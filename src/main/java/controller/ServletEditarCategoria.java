package controller;

import dao.categoriaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Categorias;

/**
 *
 * @author informatica
 */
@WebServlet("/ServletEditarCategoria")
public class ServletEditarCategoria extends HttpServlet {

    categoriaDAO categoriaDao = new categoriaDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        solicitud.setCharacterEncoding("UTF-8");
        String accion = solicitud.getParameter("accion");

        if ("editar".equals(accion)) {
            int idEditar = Integer.parseInt(solicitud.getParameter("id"));
            Categorias categoria = categoriaDao.buscarPorId(idEditar);
            solicitud.setAttribute("categoria", categoria);
            solicitud.getRequestDispatcher("editarCategoria.jsp").forward(solicitud, respuesta);
        } else {
            throw new ServletException("Acción GET no válida: " + accion);
        }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        solicitud.setCharacterEncoding("UTF-8");
        String accion = solicitud.getParameter("accion");

        if ("actualizar".equals(accion)) {
            int id = Integer.parseInt(solicitud.getParameter("id"));
            Categorias categoria = categoriaDao.buscarPorId(id);

            categoria.setNombreCategoria(solicitud.getParameter("nombreCategoria"));

            categoriaDao.actualizar(categoria);
            respuesta.sendRedirect("ServletListarCategoria");
        } else {
            throw new ServletException("Acción POST no válida: " + accion);
        }
    }
}