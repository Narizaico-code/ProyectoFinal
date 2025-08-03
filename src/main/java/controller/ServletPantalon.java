package controller;

import dao.ProductoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import model.Productos;

/**
 *
 * @author informatica
 */
@WebServlet(name = "ServletPantalon", urlPatterns = {"/ServletPantalon"})
public class ServletPantalon extends HttpServlet {

    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
        throws ServletException, IOException {
    
    String busqueda = solicitud.getParameter("query");
    System.out.println("Valor recibido en query: " + busqueda); // <-- esto es para verificar

    ProductoDAO dao = new ProductoDAO();
    List<Productos> resultados;

    if (busqueda != null && !busqueda.trim().isEmpty()) {
        resultados = dao.listarPorBusqueda(busqueda.trim());
    } else {
        resultados = dao.listarTodos();
    }

    solicitud.setAttribute("resultadoBusqueda", resultados);
    solicitud.getRequestDispatcher("pantalones.jsp").forward(solicitud, respuesta);
    System.out.println("Valor recibido en query: " + busqueda);
}

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        doGet(solicitud, respuesta);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para mostrar productos 'Pantalon'";
    }
}
