package controller;

import dao.DetallePedidosDAO;
import model.DetallePedidos;
import model.Pedidos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CarritoServlet")
public class CarritoServlet extends HttpServlet {
    private DetallePedidosDAO detalleDAO = new DetallePedidosDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Pedidos pedidoActual = (Pedidos) session.getAttribute("pedidoActual");

        List<DetallePedidos> detalles = new ArrayList<>();
        if (pedidoActual != null) {
            detalles = detalleDAO.listarPorIdPedido(pedidoActual.getIdPedido());
        }

        session.setAttribute("detallesPedido", detalles);
        request.getRequestDispatcher("/carrito.jsp").forward(request, response);
    }
}