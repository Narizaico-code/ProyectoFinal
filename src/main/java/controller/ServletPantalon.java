package controller;

import dao.ProductoDAO;
import dao.DetallePedidosDAO;
import dao.PedidosDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Productos;
import model.DetallePedidos;
import model.Pedidos;

@WebServlet(name = "ServletPantalon", urlPatterns = {"/ServletPantalon"})
public class ServletPantalon extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        int idCategoriaPantalones = 2;
        String busqueda = solicitud.getParameter("query");

        ProductoDAO dao = new ProductoDAO();
        List<Productos> resultados;

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            resultados = dao.listarPorBusqueda(busqueda.trim(), idCategoriaPantalones);
        } else {
            resultados = dao.listarPorCategoria(idCategoriaPantalones);
        }

        solicitud.setAttribute("resultadoBusqueda", resultados);
        solicitud.getRequestDispatcher("pantalones.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idProductoStr = request.getParameter("idProducto");
        String tallaSeleccionada = request.getParameter("tallaSeleccionada");

        if (idProductoStr != null && !idProductoStr.isEmpty() &&
            tallaSeleccionada != null && !tallaSeleccionada.isEmpty()) {

            try {
                int idProducto = Integer.parseInt(idProductoStr);

                ProductoDAO productoDAO = new ProductoDAO();
                Productos producto = productoDAO.buscarPorId(idProducto);

                if (producto != null) {
                    HttpSession session = request.getSession();
                    Pedidos pedido = (Pedidos) session.getAttribute("pedidoActual");
                    PedidosDAO pedidoDAO = new PedidosDAO();

                    if (pedido == null) {
                        pedido = new Pedidos();

                        // Fecha actual
                        LocalDate hoy = LocalDate.now();
                        ZoneId zona = ZoneId.systemDefault();
                        Date fechaActual = Date.from(hoy.atStartOfDay(zona).toInstant());

                        pedido.setFechaPedido(fechaActual);
                        pedido.setEstado("PENDIENTE"); 
                        pedido.setMetodoPago("EFECTIVO");
                        pedido.setTotal(0.0); 

                        pedido = pedidoDAO.crearPedido(
                            pedido.getIdUsuario() != null ? pedido.getIdUsuario() : 1, // Ajusta el idUsuario según sesión
                            pedido.getTotal(),
                            pedido.getMetodoPago()
                        );

                        if (pedido == null) {
                            request.getSession().setAttribute("mensajeError", "Error al crear el pedido.");
                            response.sendRedirect(request.getContextPath() + "/ServletPantalon");
                            return;
                        }
                        session.setAttribute("pedidoActual", pedido);
                    }

                    // Crear detalle
                    DetallePedidos detalle = new DetallePedidos();
                    detalle.setIdPedido(pedido.getIdPedido());
                    detalle.setIdProducto(idProducto);
                    detalle.setTalla(tallaSeleccionada);
                    detalle.setCantidad(1);
                    detalle.setPrecioUnitario(producto.getPrecio());
                    detalle.setSubTotal(producto.getPrecio());

                    DetallePedidosDAO detalleDAO = new DetallePedidosDAO();
                    detalleDAO.agregarDetalle(detalle);

                    // Actualizar total pedido sumando subtotal del detalle
                    double nuevoTotal = (pedido.getTotal() != null ? pedido.getTotal() : 0) + detalle.getSubTotal();
                    pedido.setTotal(nuevoTotal);
                    pedidoDAO.actualizarPedido(pedido);

                    session.setAttribute("mensaje", "Producto agregado al carrito correctamente.");
                } else {
                    request.getSession().setAttribute("mensajeError", "Producto no encontrado.");
                }

            } catch (NumberFormatException e) {
                request.getSession().setAttribute("mensajeError", "ID de producto inválido.");
            }

        } else {
            request.getSession().setAttribute("mensajeError", "Selecciona una talla antes de comprar.");
        }

        response.sendRedirect(request.getContextPath() + "/ServletPantalon");
    }
}
