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

/**
 *
 * @author ricardo
 */
@WebServlet(name = "ServletMenuPrincipal", urlPatterns = {"/ServletMenuPrincipal"})
public class ServletMenuPrincipal extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        String usuario = (String) solicitud.getSession().getAttribute("usuario");
        if (usuario == null) {
            usuario = "Invitado";
        }
        solicitud.setAttribute("titulo", "Menú Principal");
        solicitud.setAttribute("usuario", usuario);


        String busqueda = solicitud.getParameter("query");
        ProductoDAO dao = new ProductoDAO();

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            List<Productos> resultados = dao.listarPorBusqueda(busqueda);
            solicitud.setAttribute("resultadoBusqueda", resultados);
        } else {
            List<Productos> todos = dao.listarTodos();
            solicitud.setAttribute("productos", todos);
        }

        solicitud.getRequestDispatcher("menuPrincipal.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        doGet(solicitud,respuesta);
    }
    @Override
    public String getServletInfo() {
        return "Servlet para mostrar menú principal";
    }
}