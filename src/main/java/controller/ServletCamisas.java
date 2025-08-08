
package controller;

import dao.ProductoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Productos;

/**
 *
 * @author edy14
 */
@WebServlet(name = "ServletCamisas", urlPatterns = {"/ServletCamisas"})
public class ServletCamisas extends HttpServlet {

protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
        throws ServletException, IOException {
    
    final int ID_CATEGORIA_CAMISAS = 1;
        String busqueda = solicitud.getParameter("query");
       
        ProductoDAO dao = new ProductoDAO();
        List<Productos> resultados;

       
        if (busqueda != null && !busqueda.trim().isEmpty()) {
            resultados = dao.listarPorBusqueda(busqueda.trim(), ID_CATEGORIA_CAMISAS);
        } else {
            resultados = dao.listarPorCategoria(ID_CATEGORIA_CAMISAS);
        }
        
        solicitud.setAttribute("resultadoBusqueda", resultados);
       
        solicitud.getRequestDispatcher("camisas.jsp").forward(solicitud, respuesta);
    }
    
    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        doGet(solicitud, respuesta);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para mostrar productos 'Camisas'";
    }
}

