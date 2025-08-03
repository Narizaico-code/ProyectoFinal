package controller;

import dao.categoriaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet("/ServletListarCategoria")
public class ServletListarCategoria extends HttpServlet {

     //get y post

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        respuesta.setContentType("text/html;charset=UTF-8");

        categoriaDAO dao = new categoriaDAO();
        List<Categorias> listaCategorias = dao.listarTodos();

        solicitud.setAttribute("listaCategorias", listaCategorias);
        solicitud.getRequestDispatcher("listarCategorias.jsp").forward(solicitud, respuesta);
    }
}