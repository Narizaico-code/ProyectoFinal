<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Menú Principal</title>
    <link rel="stylesheet" href="style/menuPrincipal.css">
</head>
<body>

<h1>Bienvenido a la tienda</h1>

<!-- CAMISAS -->
<h2>Camisas</h2>
<a href="ServletCamisas" class="ver-mas">Ver más camisas</a>
<div class="productos-grid">
<%
    List<Productos> camisas = (List<Productos>) request.getAttribute("camisas");
    if (camisas != null) {
        for (int i = 0; i < Math.min(3, camisas.size()); i++) {
            Productos producto = camisas.get(i);
%>
    <div class="producto">
        <img src="<%= producto.getImagenURL() %>" alt="<%= producto.getNombreProducto() %>">
        <h3><%= producto.getNombreProducto() %></h3>
        <p>Precio: $<%= producto.getPrecio() %></p>
    </div>
<%
        }
    }
%>
</div>

<!-- PANTALONES -->
<h2>Pantalones</h2>
<a href="ServletPantalon" class="ver-mas">Ver más pantalones</a>
<div class="productos-grid">
    <%
        List<Productos> pantalones = (List<Productos>) request.getAttribute("pantalones");
        if (pantalones != null && !pantalones.isEmpty()) {
            int contador = 0;
            for (Productos producto : pantalones) {
                if (contador >= 3) break;
    %>
    <div class="producto">
        <img src="<%= producto.getImagenURL() %>" alt="<%= producto.getNombreProducto() %>">
        <h3><%= producto.getNombreProducto() %></h3>
        <p>Precio: $<%= producto.getPrecio() %></p>
    </div>
    <%
                contador++;
            }
        }
    %>
</div>


<!-- SUÉTERES -->
<h2>Suéteres</h2>
<a href="ServletSueteres" class="ver-mas">Ver más suéteres</a>
<div class="productos-grid">
    <%
        List<Productos> sueteres = (List<Productos>) request.getAttribute("sueteres");
        if (sueteres != null && !sueteres.isEmpty()) {
            int contador = 0;
            for (Productos producto : sueteres) {
                if (contador >= 3) break;
    %>
    <div class="producto">
        <img src="<%= producto.getImagenURL() %>" alt="<%= producto.getNombreProducto() %>">
        <h3><%= producto.getNombreProducto() %></h3>
        <p>Precio: $<%= producto.getPrecio() %></p>
    </div>
    <%
                contador++;
            }
        }
    %>
</div>


</body>
</html>
