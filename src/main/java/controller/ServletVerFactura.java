package controller;

import dao.FacturaDAO;
import model.Factura;

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

        int idPedido = Integer.parseInt(request.getParameter("idPedido"));
        List<Factura> detalles = facturaDAO.listarPorPedido(idPedido);

        request.setAttribute("detallesFactura", detalles);
        request.getRequestDispatcher("factura.jsp").forward(request, response);
    }
}
