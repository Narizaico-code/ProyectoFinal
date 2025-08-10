package controller;

import dao.FacturaDAO;
import model.Factura;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ServletVerFactura")
public class ServletVerFactura extends HttpServlet {

    private FacturaDAO facturaDAO = new FacturaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idPedidoParam = request.getParameter("idPedido");
        if (idPedidoParam == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int idPedido;
        try {
            idPedido = Integer.parseInt(idPedidoParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<Factura> detalles = facturaDAO.listarPorPedido(idPedido);

        HttpSession session = request.getSession(false);
        Usuario usuario = null;
        if (session != null) {
            usuario = (Usuario) session.getAttribute("usuarioLogueado");
        }

        request.setAttribute("detallesFactura", detalles);
        request.setAttribute("idPedido", idPedido);
        request.setAttribute("usuario", usuario); // para mostrar datos del usuario en la JSP
        request.getRequestDispatcher("factura.jsp").forward(request, response);
    }
}
