package controller;

import dao.DetallePedidosDAO;
import dao.PedidosDAO;
import dao.ProductoDAO;
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

/**
 *
 * @author Zeta
 */

    @WebServlet(name = "ServletSueteres", urlPatterns = {"/ServletSueteres"})
    public class ServletSueteres extends HttpServlet {

        @Override
        protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
                throws ServletException, IOException {

            final int ID_CATEGORIA_SUETERES = 3;

            String busqueda = solicitud.getParameter("query");
            System.out.println("Valor recibido en query (GET): " + busqueda);

            ProductoDAO dao = new ProductoDAO();
            List<Productos> resultados;

            if (busqueda != null && !busqueda.trim().isEmpty()) {
                resultados = dao.listarPorBusqueda(busqueda.trim(), ID_CATEGORIA_SUETERES);
            } else {
                resultados = dao.listarPorCategoria(ID_CATEGORIA_SUETERES);
            }

            solicitud.setAttribute("resultadoBusqueda", resultados);
            solicitud.getRequestDispatcher("sueteres.jsp").forward(solicitud, respuesta);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String idProductoStr = request.getParameter("idProducto");
            String tallaSeleccionada = request.getParameter("tallaSeleccionada");

            if (idProductoStr != null && !idProductoStr.isEmpty()
                    && tallaSeleccionada != null && !tallaSeleccionada.isEmpty()) {

                try {
                    int idProducto = Integer.parseInt(idProductoStr);
                    ProductoDAO productoDAO = new ProductoDAO();
                    Productos producto = productoDAO.buscarPorId(idProducto);

                    if (producto != null) {
                        HttpSession session = request.getSession();
                        Pedidos pedido = (Pedidos) session.getAttribute("pedidoActual");
                        PedidosDAO pedidoDAO = new PedidosDAO();
                        DetallePedidosDAO detalleDAO = new DetallePedidosDAO();

                        if (pedido == null) {
                            // Crear nuevo pedido si no existe
                            pedido = new Pedidos();
                            LocalDate hoy = LocalDate.now();
                            ZoneId zona = ZoneId.systemDefault();
                            Date fechaActual = Date.from(hoy.atStartOfDay(zona).toInstant());

                            // Asigna un idUsuario temporal, deberías usar el ID del usuario logueado
                            pedido = pedidoDAO.crearPedido(1, 0.0, "EFECTIVO");

                            if (pedido == null) {
                                request.getSession().setAttribute("mensajeError", "Error al crear el pedido.");
                                response.sendRedirect(request.getContextPath() + "/ServletSueteres");
                                return;
                            }
                            session.setAttribute("pedidoActual", pedido);
                        }

                        // Crear detalle y agregarlo
                        DetallePedidos detalle = new DetallePedidos();
                        detalle.setIdPedido(pedido.getIdPedido());
                        detalle.setIdProducto(idProducto);
                        detalle.setTalla(tallaSeleccionada);
                        detalle.setCantidad(1);
                        detalle.setPrecioUnitario(producto.getPrecio());
                        detalle.setSubTotal(producto.getPrecio());
                        detalleDAO.agregarDetalle(detalle);

                        // Actualizar total del pedido
                        double nuevoTotal = (pedido.getTotal() != null ? pedido.getTotal() : 0) + detalle.getSubTotal();
                        pedido.setTotal(nuevoTotal);
                        pedidoDAO.actualizar(pedido);

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

            // Redirigir al CarritoServlet para que se muestre el carrito actualizado
            response.sendRedirect(request.getContextPath() + "/ServletSueteres");
        }

        @Override
        public String getServletInfo() {
            return "Servlet para mostrar productos 'Sueteres'";
        }
    }
 
