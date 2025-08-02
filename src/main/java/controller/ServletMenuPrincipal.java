package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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