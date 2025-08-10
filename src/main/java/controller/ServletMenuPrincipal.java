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

@WebServlet(name = "ServletMenuPrincipal", urlPatterns = {"/ServletMenuPrincipal"})
public class ServletMenuPrincipal extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {

        String usuario = (String) solicitud.getSession().getAttribute("usuario");
        if (usuario == null) {
            usuario = "Invitado";
        }
        solicitud.setAttribute("titulo", "Menú Principal");
        solicitud.setAttribute("usuario", usuario);

        String busqueda = solicitud.getParameter("query");
        ProductoDAO dao = new ProductoDAO();

        if (busqueda != null && !busqueda.trim().isEmpty()) {
            // Si hay búsqueda, mostramos resultados filtrados
            List<Productos> resultados = dao.listarPorBusqueda(busqueda, 0); // 0 = sin filtrar categoría
            solicitud.setAttribute("resultadoBusqueda", resultados);
        } else {
            // Cargar 3 productos de cada categoría
            List<Productos> camisas = dao.listarLimit(1, 4);    // idCategoria 1 = Camisas
            List<Productos> pantalones = dao.listarLimit(2, 4);// idCategoria 2 = Pantalones
            List<Productos> sueteres = dao.listarLimit(3, 4);  // idCategoria 3 = Suéteres

            solicitud.setAttribute("camisas", camisas);
            solicitud.setAttribute("pantalones", pantalones);
            solicitud.setAttribute("sueteres", sueteres);
        }

        solicitud.getRequestDispatcher("menuPrincipal.jsp").forward(solicitud, respuesta);
    }

    @Override
    protected void doPost(HttpServletRequest solicitud, HttpServletResponse respuesta)
            throws ServletException, IOException {
        doGet(solicitud, respuesta);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para mostrar menú principal";
    }
    
    
}
