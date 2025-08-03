package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UsuarioDAO;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author Angel Geovanny
 */
@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        solicitud.getRequestDispatcher("login.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        respuesta.setContentType("text/html;charset=UTF-8");

        String correo = solicitud.getParameter("correo");
        String contraseña = solicitud.getParameter("contrasena");

        if (correo == null || contraseña == null || correo.isEmpty() || contraseña.isEmpty()) {
            solicitud.setAttribute("error", "Faltan datos");
            solicitud.getRequestDispatcher("login.jsp").forward(solicitud, respuesta);
            return;
        }

        if (correo != null && contraseña != null) {

            UsuarioDAO dao = new UsuarioDAO();
            List<Usuario> listaUsuarios = dao.listarTodos();

            // Buscar usuario
        for (Usuario usuario : listaUsuarios) {
            if (usuario.getCorreo().equalsIgnoreCase(correo)
             && usuario.getContrasena().equals(contraseña)) {
                // Credenciales OK, inicializar sesión
                HttpSession session = solicitud.getSession();
                session.setAttribute("correo",    usuario.getCorreo());
                session.setAttribute("nombre",    usuario.getNombre());
                session.setAttribute("telefono",  usuario.getTelefono());
                session.setAttribute("genero", usuario.getGenero());
                session.setAttribute("fechaNacimiento", usuario.getFechaNacimiento());
                session.setAttribute("rol",       usuario.getRol());

             // Redirigir según el rol
            if ("Admin".equalsIgnoreCase(usuario.getRol())) {
                respuesta.sendRedirect(solicitud.getContextPath() + "/administrar.jsp");
            } else if ("cliente".equalsIgnoreCase(usuario.getRol())) {
                respuesta.sendRedirect(solicitud.getContextPath() + "/ServletMenuPrincipal");
            } else {
                // En caso de rol inesperado, redirigir al menú principal por defecto
                respuesta.sendRedirect(solicitud.getContextPath() + "/ServletMenuPrincipal");
            }
            return;
        }
    }

    // Si llegamos aquí, credenciales inválidas
    solicitud.setAttribute("error", "Correo o contraseña incorrectos");
    solicitud.getRequestDispatcher("login.jsp").forward(solicitud, respuesta);
}
}
}