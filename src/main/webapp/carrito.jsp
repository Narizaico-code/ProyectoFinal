<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.DetallePedidos" %>
<%@ page import="model.Productos" %>
<%@ page import="dao.ProductoDAO" %>

<%
    List<DetallePedidos> detalles = (List<DetallePedidos>) session.getAttribute("detallesPedido");
    if (detalles == null) {
        detalles = new java.util.ArrayList<DetallePedidos>();
    }

    double total = 0;
    ProductoDAO productosDAO = new ProductoDAO();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito</title>
    <link rel="stylesheet" href="style/carrito.css?">
</head>
<body>
    <header>
        <img src="imagenes/logo.png" alt="Logo Stillz" class="logo" />
        <div class="titulo">Mi Carrito de Compras</div>
        <div class="acciones">
            <div class="btn-regresar-container">
                <a href="ServletMenuPrincipal">
                    <button class="btn btn-primary btn-custom"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></button>
                </a>
            <form action="cerrarSesion.jsp" method="post">
                <button type="submit">Cerrar Sesión</button>
            </form>
        </div>
    </header>

    <main>
        <div class="carrito">
            <form action="ActualizarCarritoServlet" method="post">
                <%
                    for (DetallePedidos detalle : detalles) {
                        Productos producto = productosDAO.buscarPorId(detalle.getIdProducto());
                        if (producto != null) {
                            double subtotal = detalle.getCantidad() * detalle.getPrecioUnitario();
                            total += subtotal;
                %>
                <div class="producto">
                    <img src="<%= producto.getImagenURL() %>" alt="<%= producto.getNombreProducto() %>" />
                    <div class="producto-info">
                        <strong><%= producto.getNombreProducto() %></strong>
                        <span>Talla: <%= detalle.getTalla() %></span>
                        <span>Q<%= String.format("%.2f", detalle.getPrecioUnitario()) %></span>
                    </div>
                    <input type="number" name="cantidad_<%= detalle.getIdDetallePedido() %>" value="<%= detalle.getCantidad() %>" min="1" />
                    <span class="subtotal">Q<%= String.format("%.2f", subtotal) %></span>
                    <input type="hidden" name="idDetallePedido" value="<%= detalle.getIdDetallePedido() %>" />
                </div>
                <%      }
                    } %>
                <button type="submit" class="boton">Actualizar Cantidades</button>
            </form>
        </div>

        <div class="resumen">
            <h3>Detalle Total</h3>
            <p>Total: <strong>Q<%= String.format("%.2f", total) %></strong></p>
            <hr />
            <form action="FinalizarCompraServlet" method="post">
                <button class="boton">Realizar Pedido</button>
            </form>
        </div>
    </main>
</body>
</html>