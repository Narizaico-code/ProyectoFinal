package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UsuarioDAO;
import model.Usuario;

/**
 *
 * @author Angel Geovanny
 */
@WebServlet("/ServletLogin")
public class ServletLogin {

    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws IOException, ServletException {
        respuesta.setContentType("text/html;charset=UTF-8");
        
        String correo = solicitud.getParameter("correo");
        String contraseña = solicitud.getParameter("contraseña");
        
    }
}