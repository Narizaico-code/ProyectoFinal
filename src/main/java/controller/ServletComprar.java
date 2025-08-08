package controller;

import dao.DetallePedidosDAO;
import dao.PedidosDAO;
import model.DetallePedidos;
import model.Pedidos;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ServletComprar")
public class ServletComprar extends HttpServlet {

    private PedidosDAO pedidosDAO = new PedidosDAO();
    private DetallePedidosDAO detalleDAO = new DetallePedidosDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        Usuario usuarioLogueado = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuarioLogueado == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Pedidos pedidoActual = (Pedidos) session.getAttribute("pedidoActual");
        if (pedidoActual == null) {
            pedidoActual = pedidosDAO.crearPedido(usuarioLogueado.getIdUsuario(), 0.0, "Efectivo");
            if (pedidoActual == null) {
                request.setAttribute("error", "No se pudo crear el pedido.");
                request.getRequestDispatcher("/pantalones.jsp").forward(request, response);
                return;
            }
            session.setAttribute("pedidoActual", pedidoActual);
        }

        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            String talla = request.getParameter("tallaSeleccionada");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double precioUnitario = Double.parseDouble(request.getParameter("precioUnitario"));

            double subTotal = cantidad * precioUnitario;

            DetallePedidos detalle = new DetallePedidos();
            detalle.setIdPedido(pedidoActual.getIdPedido());
            detalle.setIdProducto(idProducto);
            detalle.setTalla(talla);
            detalle.setCantidad(cantidad);
            detalle.setPrecioUnitario(precioUnitario);
            detalle.setSubTotal(subTotal);

            boolean agregado = detalleDAO.agregarDetalle(detalle);

            if (!agregado) {
                request.setAttribute("error", "No se pudo agregar el detalle al pedido.");
                request.getRequestDispatcher("/pantalones.jsp").forward(request, response);
                return;
            }

            // Actualizar total del pedido sumando el subtotal agregado
            pedidoActual.setTotal(pedidoActual.getTotal() + subTotal);
            pedidosDAO.actualizarPedido(pedidoActual);
            session.setAttribute("pedidoActual", pedidoActual);

            // Confirmación y redirección
            request.setAttribute("mensajeConfirmacion", "Producto agregado al carrito correctamente.");
            request.getRequestDispatcher("/carrito.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Datos de producto inválidos.");
            request.getRequestDispatcher("/pantalones.jsp").forward(request, response);
        }
    }
}
