package controller;

import dao.ProveedoresDAO;
import model.Proveedores;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletProveedores")
public class ServletProveedores extends HttpServlet {

    ProveedoresDAO dao = new ProveedoresDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        String accion = solicitud.getParameter("accion");

        if ("listar".equals(accion)) {
            List<Proveedores> lista = dao.listar();
            solicitud.setAttribute("listaProveedores", lista);
            RequestDispatcher dispatcher = solicitud.getRequestDispatcher("proveedores.jsp");
            dispatcher.forward(solicitud, respuesta);
        } else if ("desactivar".equals(accion)) {
            int id = Integer.parseInt(solicitud.getParameter("id"));
            dao.desactivar(id);
            respuesta.sendRedirect("ServletProveedores?accion=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        Proveedores p = new Proveedores();
        p.setNombreProveedor(solicitud.getParameter("nombreProveedor"));
        p.setContactoNombre(solicitud.getParameter("contactoNombre"));
        p.setTelefono(solicitud.getParameter("telefono"));
        p.setCorreo(solicitud.getParameter("correo"));
        p.setDireccion(solicitud.getParameter("direccion"));

        dao.agregar(p);
        respuesta.sendRedirect("ServletProveedores?accion=listar");
    }
}