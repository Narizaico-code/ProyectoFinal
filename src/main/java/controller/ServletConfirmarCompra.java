package controller;

import dao.FacturaDAO;
import dao.PedidosDAO;
import model.Factura;
import model.Pedidos;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletConfirmarCompra")
public class ServletConfirmarCompra extends HttpServlet {

    private PedidosDAO pedidosDAO = new PedidosDAO();
    private FacturaDAO facturaDAO = new FacturaDAO();

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuario == null) {
            response.sendRedirect("ServletLogin");
            return;
        }

        List<Factura> carrito = (List<Factura>) session.getAttribute("carrito");
        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect("carrito.jsp");
            return;
        }

        // calcular total
        double total = carrito.stream()
                .mapToDouble(f -> (f.getSubTotal() != null ? f.getSubTotal() : (f.getCantidad() * f.getPrecioUnitario())))
                .sum();

        // obtén id usuario desde la entidad. Usé el nombre que confirmaste: getIdUduario()
        int idUsuario = usuario.getIdUsuario(); // <- si tu método se llama distinto cámbialo aquí

        // crear pedido (usa tu PedidosDAO)
        Pedidos pedido = pedidosDAO.crearPedido(idUsuario, total, "EFECTIVO");
        if (pedido == null) {
            request.setAttribute("error", "No se pudo crear el pedido.");
            request.getRequestDispatcher("carrito.jsp").forward(request, response);
            return;
        }

        // persistir cada detalle con idPedido
        for (Factura f : carrito) {
            f.setIdPedido(pedido.getIdPedido());
            facturaDAO.guardar(f);
        }

        // limpiar carrito
        session.removeAttribute("carrito");

        // redirigir a ver factura
        response.sendRedirect("ServletVerFactura?idPedido=" + pedido.getIdPedido());
    }
}
