package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ProductoDAO;
import model.Producto;

@WebServlet("/ServletProductos")
public class ServletProductos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        
        solicitud.setCharacterEncoding("UTF-8");

        int idProveedor = Integer.parseInt(solicitud.getParameter("idProveedor"));
        String nombreProducto = solicitud.getParameter("nombreProducto");
        String descripcion = solicitud.getParameter("descripcion");
        double precio = Double.parseDouble(solicitud.getParameter("precio"));
        int stock = Integer.parseInt(solicitud.getParameter("stock"));
        String talla = solicitud.getParameter("talla");
        String color = solicitud.getParameter("color");
        String marca = solicitud.getParameter("marca");
        String categoria = solicitud.getParameter("categoria");
        String imagenURL = solicitud.getParameter("imagenURL");
        String estado = solicitud.getParameter("estado");

        Producto producto = new Producto();
        producto.setIdProveedor(idProveedor);
        producto.setNombreProducto(nombreProducto);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setStock(stock);
        producto.setTalla(talla);
        producto.setColor(color);
        producto.setMarca(marca);
        producto.setCategoria(categoria);
        producto.setImagenURL(imagenURL);
        producto.setEstado(estado);
        producto.setFechaIngreso(LocalDateTime.now()); 

        ProductoDAO dao = new ProductoDAO();
        dao.guardar(producto);

        List<Producto> listaProductos = dao.listarTodos();

        solicitud.setAttribute("listaProductos", listaProductos);
        solicitud.getRequestDispatcher("listarProductos.jsp").forward(solicitud, respuesta);
    }
}
