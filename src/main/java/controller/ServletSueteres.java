package controller;

import dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Productos;

/**
 *
 * @author Zeta
 */
public class ServletSueteres {

    private ProductoDAO dao = new ProductoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String busqueda = request.getParameter("busqueda");

        List<Productos> listaSueteres;

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            listaSueteres = dao.listarPorBusqueda(busqueda.trim());
        } else {
            listaSueteres = dao.listarTodos();
        }

        request.setAttribute("listaSueteres", listaSueteres);
        request.getRequestDispatcher("sueteres.jsp").forward(request, response);
    }
}
