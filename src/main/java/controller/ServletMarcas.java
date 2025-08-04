package controller;

import dao.MarcasDAO;
import database.Conexion;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Marca;

@WebServlet("/ServletMarcas")
public class ServletMarcas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        accion = (accion == null) ? "listar" : accion;

        try (Connection conexion = Conexion.getInstancia().getConexion()) {
            MarcasDAO marcaDAO = new MarcasDAO(conexion);
            HttpSession session = request.getSession();

            switch (accion) {
                case "listar":
                    listarMarcas(request, response, marcaDAO);
                    break;
                case "nuevo":
                    request.getRequestDispatcher("registroMarca.jsp").forward(request, response);
                    break;
                case "guardar":
                    guardarMarca(request, response, marcaDAO, session);
                    break;
                case "editar":
                    mostrarFormularioEdicion(request, response, marcaDAO);
                    break;
                case "actualizar":
                    actualizarMarca(request, response, marcaDAO, session);
                    break;
                case "eliminar":
                    eliminarMarca(request, response, marcaDAO, session);
                    break;
                default:
                    listarMarcas(request, response, marcaDAO);
            }
        } catch (SQLException e) {
            manejarError(request, response, "Error de base de datos: " + e.getMessage());
        }
    }

    private void listarMarcas(HttpServletRequest request, HttpServletResponse response, MarcasDAO marcaDAO)
            throws SQLException, ServletException, IOException {
        List<Marca> marcas = marcaDAO.listarMarcas();
        request.setAttribute("marcas", marcas);
        request.getRequestDispatcher("listarMarcas.jsp").forward(request, response);
    }

    private void guardarMarca(HttpServletRequest request, HttpServletResponse response, 
            MarcasDAO marcaDAO, HttpSession session) throws SQLException, IOException {
        Marca marca = new Marca();
        marca.setNombreMarca(request.getParameter("nombre"));
        marca.setCorreoMarca(request.getParameter("correo"));
        marca.setDescripcion(request.getParameter("descripcion"));

        if (marcaDAO.insertarMarca(marca)) {
            session.setAttribute("mensaje", "Marca registrada exitosamente");
        } else {
            session.setAttribute("error", "Error al registrar la marca");
        }
        response.sendRedirect("ServletMarcas");
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response, 
            MarcasDAO marcaDAO) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Marca marca = marcaDAO.obtenerMarcaPorId(id);
        
        if (marca != null) {
            request.setAttribute("marca", marca);
            request.getRequestDispatcher("editarMarca.jsp").forward(request, response);
        } else {
            manejarError(request, response, "Marca no encontrada");
        }
    }

    private void actualizarMarca(HttpServletRequest request, HttpServletResponse response, 
            MarcasDAO marcaDAO, HttpSession session) throws SQLException, IOException {
        Marca marca = new Marca();
        marca.setIdMarca(Integer.parseInt(request.getParameter("id")));
        marca.setNombreMarca(request.getParameter("nombre"));
        marca.setCorreoMarca(request.getParameter("correo"));
        marca.setDescripcion(request.getParameter("descripcion"));

        if (marcaDAO.actualizarMarca(marca)) {
            session.setAttribute("mensaje", "Marca actualizada exitosamente");
        } else {
            session.setAttribute("error", "Error al actualizar la marca");
        }
        response.sendRedirect("ServletMarcas");
    }

    private void eliminarMarca(HttpServletRequest request, HttpServletResponse response, 
            MarcasDAO marcaDAO, HttpSession session) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (marcaDAO.eliminarMarca(id)) {
            session.setAttribute("mensaje", "Marca eliminada exitosamente");
        } else {
            session.setAttribute("error", "Error al eliminar la marca");
        }
        response.sendRedirect("ServletMarcas");
    }

    private void manejarError(HttpServletRequest request, HttpServletResponse response, String mensaje)
            throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("listarMarcas.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}