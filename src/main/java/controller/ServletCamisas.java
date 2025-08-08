
package controller;

import dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Productos;

@WebServlet("/camisas")
public class ServletCamisas extends HttpServlet {

    private ProductoDAO dao = new ProductoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String busqueda = request.getParameter("busqueda");

        List<Productos> listaCamisas;

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            listaCamisas = dao.listarPorBusqueda(busqueda.trim());
        } else {
            listaCamisas = dao.listarTodos();
        }

        request.setAttribute("listaCamisas", listaCamisas);
        request.getRequestDispatcher("camisas.jsp").forward(request, response);
    }
}