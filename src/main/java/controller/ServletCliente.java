package controller;

import dao.UsuarioDAO;
import model.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {

    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            // Leemos idUsuario, no "id"
            int id = Integer.parseInt(request.getParameter("idUsuario"));
            dao.eliminar(id);
        } else if ("editar".equals(accion)) {
            // Preparamos el formulario en modo editar
            int id = Integer.parseInt(request.getParameter("idUsuario"));
            Usuario usuario = dao.buscarPorId(id);
            request.setAttribute("usuario", usuario);
            request.setAttribute("accionForm", "editar");
        } else if ("agregar".equals(accion)) {
            // Modo agregar
            request.setAttribute("accionForm", "agregar");
        }

        // Siempre listamos al final
        List<Usuario> listaUsuario = dao.listarTodos();
        request.setAttribute("listaUsuario", listaUsuario);
        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        // Instanciamos y rellenamos campos comunes
        Usuario usuario = new Usuario();
        usuario.setNombre(request.getParameter("nombre"));
        usuario.setApellido(request.getParameter("apellido"));
        usuario.setCorreo(request.getParameter("correo"));
        usuario.setContrasena(request.getParameter("contrasena"));
        usuario.setTelefono(request.getParameter("telefono"));
        usuario.setGenero(request.getParameter("genero"));
        usuario.setFechaNacimiento(
                Timestamp.valueOf(
                        request.getParameter("fechaNacimiento")
                                .replace("T", " ")
                        + ":00"
                )
        );
        usuario.setRol(request.getParameter("rol"));

        if ("editar".equals(accion)) {
            usuario.setIdUsuario(
                    Integer.parseInt(request.getParameter("idUsuario"))
            );
            dao.actualizar(usuario);
        } else if ("agregar".equals(accion)) {
            dao.guardar(usuario);
        }
        // NOTA: ya no manejamos eliminar por POST

        // Después de agregar/editar, volvemos al listado
        response.sendRedirect("ServletCliente");
    }
}