package controller;

import dao.DetallePedidosDAO;
import dao.PedidosDAO; // You will need to create this DAO
import model.DetallePedidos;
import model.Pedidos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/ActualizarCarritoServlet")
public class ActualizarCarritoServlet extends HttpServlet {

    private DetallePedidosDAO detallePedidosDAO = new DetallePedidosDAO();
    private PedidosDAO pedidosDAO = new PedidosDAO(); // Assuming you have a PedidosDAO

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Pedidos pedidoActual = (Pedidos) session.getAttribute("pedidoActual");

        if (pedidoActual == null) {
            response.sendRedirect("menuPrincipal.jsp"); // Redirect if there's no active order
            return;
        }

        double nuevoTotalGeneral = 0;

        // Get all parameter names from the form
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            // We only care about parameters that start with "cantidad_"
            if (paramName.startsWith("cantidad_")) {
                try {
                    // Extract the idDetallePedido from the parameter name
                    int idDetallePedido = Integer.parseInt(paramName.substring("cantidad_".length()));
                    int nuevaCantidad = Integer.parseInt(request.getParameter(paramName));

                    // Get the specific DetallePedidos object from the database
                    DetallePedidos detalle = detallePedidosDAO.buscarPorId(idDetallePedido);

                    if (detalle != null) {
                        // Update the quantity and recalculate the subtotal
                        detalle.setCantidad(nuevaCantidad);
                        double nuevoSubtotal = detalle.getPrecioUnitario() * nuevaCantidad;
                        detalle.setSubTotal(nuevoSubtotal); // Assuming your model has setSubTotal

                        // Update the DetallePedidos object in the database
                        detallePedidosDAO.actualizarDetalle(detalle); // You will need to create this method

                        // Add the new subtotal to the running total
                        nuevoTotalGeneral += nuevoSubtotal;
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }

        // Update the total in the main Pedidos object
        pedidoActual.setTotal(nuevoTotalGeneral);
        pedidosDAO.actualizar(pedidoActual); // Assuming you have an update method for Pedidos

        // Redirect to the CarritoServlet to display the updated cart
        response.sendRedirect(request.getContextPath() + "/CarritoServlet");
    }
}