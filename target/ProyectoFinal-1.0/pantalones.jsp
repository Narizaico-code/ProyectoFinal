<%-- 
    Document   : pantalones
    Created on : 1 ago 2025, 14:18:56
    Author     : informatica
--%>

<%@page import="model.Productos"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="dao.ProductoDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pantalones</title>
        <link rel="stylesheet" href="style/pantalones.css"/>
    </head>
    <body>
        <div class="nav-links">
            <a href="menuPrincipal.jsp">Regresar</a>
        </div>
        <div> 
            <form method="get" action="ServletPantalon">
                <input type="text" name="query" placeholder="Buscar..." required />
                <button type="submit">Buscar</button>
            </form>
        </div>
        <div class="contenido">
            <%
                List<Productos> resultadoBusqueda = (List<Productos>) request.getAttribute("resultadoBusqueda");

                if (resultadoBusqueda != null && !resultadoBusqueda.isEmpty()) {
            %>
            <h2>Resultados</h2>
            <div class="productos">
                <%
                    for (Productos producto : resultadoBusqueda) {
                %>
                <div class="producto">
                    <img src="<%= producto.getImagenURL()%>" alt="<%= producto.getNombreProducto()%>">
                    <h3><%= producto.getNombreProducto()%></h3>
                    <p><%= producto.getDescripcion()%></p>
                    <p>Talla: <%= producto.getTalla()%></p>
                    <p>Color: <%= producto.getColor()%></p>
                </div>
                <%
                    }
                %>
            </div>
            <%
            } else {
            %>
            <p>No se encontraron productos.</p>
            <%
                }
            %>
        </div>
    </body>
</html>