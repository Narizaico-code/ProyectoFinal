package controller;

import dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;

/**
 *
 * @author angelreyes
 */
@WebServlet("/ServletListarProducto")
public class ServletListarProducto extends HttpServlet {

    //get y post
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws IOException, ServletException {
        respuesta.setContentType("text/html;charset=UTF-8");
        //Obtener la lista -> DAO
        ProductoDAO dao = new ProductoDAO();
        List<Producto> listaProductos = dao.listarTodos();
        //Cargar la lista en un elemento a enviar
        solicitud.setAttribute("listaProductos", listaProductos);
        //Enviar lista
        solicitud.getRequestDispatcher("listarProductos.jsp").forward(solicitud, respuesta);
    }
}
