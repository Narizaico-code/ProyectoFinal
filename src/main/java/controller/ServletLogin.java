package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UsuarioDAO;
import java.util.List;
import javax.servlet.http.HttpSession;
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
        
        if (correo != null || contraseña != null) {
            UsuarioDAO dao = new UsuarioDAO();
            List<Usuario> listaClientes = dao.listarTodos();
            HttpSession session = null;
            for (Usuario usuario : listaClientes) {
                if (usuario.getCorreo().equalsIgnoreCase(correo) || usuario.getContraseña().equalsIgnoreCase(contraseña) ) {
                    session.setAttribute("correo", correo);
                    session.setAttribute("nombre", usuario.getNombre());
                    session.setAttribute("telefono", usuario.getTelefono());
                    session.setAttribute("direccion", usuario.getDireccion());
                    session.setAttribute("rol", usuario.getRol());
                    respuesta.sendRedirect("ServletMenuPrincipal");
                }else{
                    
                }
            }
        }
        
    }
}