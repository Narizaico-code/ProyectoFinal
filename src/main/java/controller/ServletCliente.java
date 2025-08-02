package controller;
 
import dao.ProveedoresDAO;
import dao.UsuarioDAO;
import model.Usuario;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import model.Proveedores;
 
@WebServlet("/ServletProveedores")
public class ServletCliente extends HttpServlet {
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        request.setCharacterEncoding("UTF-8");
 
        int idProveedor = 0;
        if (request.getParameter("idProveedor") != null && !request.getParameter("idProveedor").isEmpty()) {
            idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
        }
 
        String nombreProveedor = request.getParameter("nombreProveedor");
        String contactoNombre = request.getParameter("contactoNombre");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");
        String estado = request.getParameter("estado");
 
        Proveedores proveedor = new Proveedores();
        proveedor.setNombreProveedor(nombreProveedor);
        proveedor.setContactoNombre(contactoNombre);
        proveedor.setTelefono(telefono);
        proveedor.setCorreo(correo);
        proveedor.setDireccion(direccion);
        proveedor.setEstado(estado);
 
        ProveedoresDAO dao = new ProveedoresDAO();
 
        if (idProveedor > 0) {
            proveedor.setIdProveedor(idProveedor);
            dao.actualizar(proveedor);
        } else {
            dao.guardar(proveedor);
        }
 
        List<Proveedores> listaProveedores = dao.listarActivos();
        request.setAttribute("proveedores", listaProveedores);
        request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        String accion = request.getParameter("accion");
        ProveedoresDAO dao = new ProveedoresDAO();
 
        if ("eliminar".equalsIgnoreCase(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
        }
 
        List<Proveedores> listaProveedores = dao.listarActivos();
        request.setAttribute("proveedores", listaProveedores);
        request.getRequestDispatcher("proveedores.jsp").forward(request, response);
    }
}