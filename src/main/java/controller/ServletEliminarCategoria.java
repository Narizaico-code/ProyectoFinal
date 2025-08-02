package controller;

import dao.categoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletEliminarCategoria")
public class ServletEliminarCategoria extends HttpServlet {

    categoriaDAO categoriaDao = new categoriaDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        String idParam = solicitud.getParameter("id");

        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                categoriaDao.eliminar(id);
            } catch (NumberFormatException e) {
                throw new ServletException("ID inválido para eliminación", e);
            }
        }

        respuesta.sendRedirect("ServletListarCategoria");
    }
}
