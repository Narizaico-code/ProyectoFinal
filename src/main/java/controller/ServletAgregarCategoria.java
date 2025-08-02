package controller;

import dao.categoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Categorias;

@WebServlet("/ServletAgregarCategoria")
public class ServletAgregarCategoria extends HttpServlet {

    categoriaDAO categoriaDao = new categoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar el formulario para agregar
        request.getRequestDispatcher("registroCategoria.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String nombreCategoria = request.getParameter("nombreCategoria");

        if (nombreCategoria == null || nombreCategoria.trim().isEmpty()) {
            request.setAttribute("error", "El nombre de la categoría es obligatorio.");
            request.getRequestDispatcher("registroCategoria.jsp").forward(request, response);
            return;
        }

        Categorias categoria = new Categorias();
        categoria.setNombreCategoria(nombreCategoria.trim());

        try {
            categoriaDao.guardar(categoria);
            response.sendRedirect("ServletListarCategoria");
        } catch (Exception e) {
            request.setAttribute("error", "Error al guardar la categoría: " + e.getMessage());
            request.getRequestDispatcher("registroCategoria.jsp").forward(request, response);
        }
    }
}
