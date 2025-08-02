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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");

        UsuarioDAO dao = new UsuarioDAO();
        switch (accion) {
            case "editar":
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(Integer.parseInt(request.getParameter("idUsuario")));
                usuario.setNombre(request.getParameter("nombre"));
                usuario.setApellido(request.getParameter("apellido"));
                usuario.setCorreo(request.getParameter("correo"));
                usuario.setContrasena(request.getParameter("contrasena"));
                usuario.setTelefono(request.getParameter("telefono"));
                usuario.setGenero(request.getParameter("genero"));
                usuario.setFechaNacimiento(Timestamp.valueOf(request.getParameter("fechaNacimiento").replace("T", " ") + ":00"));
                usuario.setRol(request.getParameter("rol"));

                dao.actualizar(usuario);

                break;
            case "eliminar":
                dao.eliminar(Integer.parseInt(request.getParameter("id")));
                break;
            default:
                throw new AssertionError();
        }

        List<Usuario> listaUsuario = dao.listarTodos();
        request.setAttribute("listaUsuario", listaUsuario);
        response.sendRedirect("ServletCliente");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsuarioDAO dao = new UsuarioDAO();
        List<Usuario> listaUsuario = dao.listarTodos();
        request.setAttribute("listaUsuario", listaUsuario);
        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }
}
