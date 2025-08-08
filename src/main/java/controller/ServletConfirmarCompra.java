package controller;

import dao.PedidoDAO;
import dao.FacturaDAO;
import model.Pedido;
import model.Factura;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/ServletConfirmarCompra")
public class ServletConfirmarCompra extends HttpServlet {

    private PedidoDAO pedidoDAO = new PedidoDAO();
    private FacturaDAO facturaDAO = new FacturaDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        List<Factura> carrito = (List<Factura>) sesion.getAttribute("carrito");
        int idUsuario = (int) sesion.getAttribute("idUsuario");

        double total = carrito.stream().mapToDouble(Factura::getSubTotal).sum();

        // Crear pedido
        Pedido pedido = new Pedido(idUsuario, total, "CONFIRMADO", new Date());
        pedidoDAO.guardar(pedido);

        // Guardar detalles
        for (Factura f : carrito) {
            f.setIdPedido(pedido.getIdPedido());
            facturaDAO.guardar(f);
        }

        // Limpiar carrito y redirigir
        sesion.removeAttribute("carrito");
        response.sendRedirect("ServletVerFactura?idPedido=" + pedido.getIdPedido());
    }
}
