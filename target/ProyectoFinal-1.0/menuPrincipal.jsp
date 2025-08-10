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

    <div class="menu">
        <div class="espacio"></div>
        <form class="search-bar" action="ServletMenuPrincipal" method="get">
            <img src="images/Logo.jpg" alt="Logo de la marca">
            <input type="text" name="query" placeholder="Buscar productos...">
            <button type="submit">Buscar</button>
        </form>

        <div class="nav-links">
            <a href="index.jsp"><img src="https://img.icons8.com/?size=256w&id=34526&format=png&color=FFFFFF" alt="Cerrar Sesion" style="width:50px;height:50px;"></a>
            <a href="CarritoServlet">
                <img src="https://img.icons8.com/?size=256w&id=59997&format=png&color=FFFFFF" alt="Ir al Carrito" style="width:50px;height:50px;">
            </a>
        </div>
    </div>

    <div class="contenido">
        <div class="categorias">
            <button onclick="mostrarMegaMenu('hombre')">Hombre</button>
            <button onclick="mostrarMegaMenu('mujer')">Mujer</button>
        </div>
    </div>

    <h1>Bienvenido a la tienda</h1>

    <h2>Camisas</h2>
    <a href="ServletCamisas" class="ver-mas">Ver más camisas</a>
    <div class="productos-grid">
    <%
        List<Productos> camisas = (List<Productos>) request.getAttribute("camisas");
        if (camisas != null) {
            for (int i = 0; i < Math.min(4, camisas.size()); i++) {
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

    <h2>Pantalones</h2>
    <a href="ServletPantalon" class="ver-mas">Ver más pantalones</a>
    <div class="productos-grid">
        <%
            List<Productos> pantalones = (List<Productos>) request.getAttribute("pantalones");
            if (pantalones != null && !pantalones.isEmpty()) {
                int contador = 0;
                for (Productos producto : pantalones) {
                    if (contador >= 4) break;
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

    <h2>Suéteres</h2>
    <a href="ServletSueteres" class="ver-mas">Ver más suéteres</a>
    <div class="productos-grid">
        <%
            List<Productos> sueteres = (List<Productos>) request.getAttribute("sueteres");
            if (sueteres != null && !sueteres.isEmpty()) {
                int contador = 0;
                for (Productos producto : sueteres) {
                    if (contador >= 4) break;
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