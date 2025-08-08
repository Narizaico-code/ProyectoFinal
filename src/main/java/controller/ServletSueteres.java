
package controller;

/**
 *
 * @author edy14
 */
import dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Productos; 

@WebServlet(name = "ServletSueteres", urlPatterns = {"/ServletSueteres"})
public class ServletSueteres extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
        throws ServletException, IOException {
       
        final int ID_CATEGORIA_SUETERES = 3; 
        
        String busqueda = solicitud.getParameter("query");
        System.out.println("Valor recibido en query (GET): " + busqueda);

        ProductoDAO dao = new ProductoDAO();
        List<Productos> resultados;

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            resultados = dao.listarPorBusqueda(busqueda.trim(), ID_CATEGORIA_SUETERES);
        } else {
            resultados = dao.listarPorCategoria(ID_CATEGORIA_SUETERES);
        }

        solicitud.setAttribute("resultadoBusqueda", resultados);
        solicitud.getRequestDispatcher("sueteres.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idProductoStr = request.getParameter("idProducto");
        String tallaSeleccionada = request.getParameter("tallaSeleccionada");

        if (idProductoStr != null && !idProductoStr.isEmpty() && tallaSeleccionada != null && !tallaSeleccionada.isEmpty()) {
            int idProducto = Integer.parseInt(idProductoStr);
            
            ProductoDAO dao = new ProductoDAO();
            Productos productoSeleccionado = dao.buscarPorId(idProducto);

            System.out.println("----------------------------------------");
            System.out.println("¡Información de compra recibida en el servidor!");
            System.out.println("ID del Producto: " + idProducto);
            if (productoSeleccionado != null) {
                System.out.println("Nombre del Producto: " + productoSeleccionado.getNombreProducto());
            } else {
                System.out.println("Nombre del Producto: No encontrado (ID: " + idProducto + ")");
            }
            System.out.println("Talla seleccionada: " + tallaSeleccionada);
            System.out.println("----------------------------------------");

            request.setAttribute("mensajeConfirmacion", "Producto " + idProducto + " (Talla: " + tallaSeleccionada + ") seleccionado.");

        } else {
            System.err.println("Error (POST): No se recibió el ID del producto o la talla seleccionada.");
            request.setAttribute("mensajeError", "Por favor, selecciona una talla antes de continuar.");
        }
        
        response.sendRedirect(request.getContextPath() + "/ServletSueteres");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para mostrar productos 'Sueteres'";
    }
}
