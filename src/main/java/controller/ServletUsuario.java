package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String telefono = request.getParameter("telefono");
        String genero = request.getParameter("genero");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");

        Timestamp fechaNacimiento = null;
        if (fechaNacimientoStr != null && !fechaNacimientoStr.isEmpty()) {
            fechaNacimiento = Timestamp.valueOf(fechaNacimientoStr + " 00:00:00");
        }

        // Crear objeto Usuario
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setCorreo(correo);
        usuario.setContrasena(contrasena);
        usuario.setTelefono(telefono);
        usuario.setGenero(genero);
        usuario.setFechaNacimiento(fechaNacimiento);
        usuario.setRol("cliente"); // Puedes cambiarlo si es dinámico

        // Guardar en la base de datos
        UsuarioDAO dao = new UsuarioDAO();
        dao.guardar(usuario);

        // Confirmación
        out.println("<html><body>");
        out.println("<h2>¡Registro exitoso!</h2>");
        out.println("<p>Bienvenido, " + nombre + " " + apellido + "</p>");
        out.println("</body></html>");
    }
}
