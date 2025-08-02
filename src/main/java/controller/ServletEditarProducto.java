package controller;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ProductoDAO;
import model.Producto;

@WebServlet("/ServletEditarProducto")
public class ServletEditarProducto extends HttpServlet {

    ProductoDAO productoDao = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        solicitud.setCharacterEncoding("UTF-8");
        String accion = solicitud.getParameter("accion");

        if ("editar".equals(accion)) {
            int idEditar = Integer.parseInt(solicitud.getParameter("id"));
            Producto producto = productoDao.buscarPorId(idEditar);
            solicitud.setAttribute("producto", producto);
            solicitud.getRequestDispatcher("editarProducto.jsp").forward(solicitud, respuesta);
        } else {
            throw new ServletException("Acción GET no válida: " + accion);
        }
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        solicitud.setCharacterEncoding("UTF-8");
        String accion = solicitud.getParameter("accion");

        if ("actualizar".equals(accion)) {
            int id = Integer.parseInt(solicitud.getParameter("id"));
            Producto producto = productoDao.buscarPorId(id);

            producto.setIdProveedor(Integer.parseInt(solicitud.getParameter("idProveedor")));
            producto.setNombreProducto(solicitud.getParameter("nombreProducto"));
            producto.setDescripcion(solicitud.getParameter("descripcion"));
            producto.setPrecio(Double.parseDouble(solicitud.getParameter("precio")));
            producto.setStock(Integer.parseInt(solicitud.getParameter("stock")));
            producto.setTalla(solicitud.getParameter("talla"));
            producto.setColor(solicitud.getParameter("color"));
            producto.setMarca(solicitud.getParameter("marca"));
            producto.setCategoria(solicitud.getParameter("categoria"));
            producto.setImagenURL(solicitud.getParameter("imagenURL"));
            producto.setEstado(solicitud.getParameter("estado"));

            productoDao.actualizar(producto);
            respuesta.sendRedirect("ServletListarProducto");
        } else {
            throw new ServletException("Acción POST no válida: " + accion);
        }
    }
}
