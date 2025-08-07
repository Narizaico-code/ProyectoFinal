<%-- 
    Document   : camisas
    Created on : 31/07/2025, 16:43:26
    Author     : informatica
--%>
<%@page import="model.Productos"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductoDAO" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Camisas</title>
        <link rel="stylesheet" href="style/camisas.css?">
        
    </head>
    <body>
        <div class="nav-links">
            <a href="menuPrincipal.jsp">Regresar</a>
        </div>
        <div class="busqueda-form">
            <form method="get" action="ServletCamisas">
                <input type="text" name="query" placeholder="Buscar..." />
                <button type="submit">Buscar</button>
            </form>
        </div>
        <div class="contenido">
            <%
                List<Productos> resultadoBusqueda = (List<Productos>) request.getAttribute("resultadoBusqueda");
                
                if (resultadoBusqueda != null && !resultadoBusqueda.isEmpty()) {
            %>
            <h2>Resultados para Camisas</h2>
            <div class="productos-grid">
                <%
                    for (Productos producto : resultadoBusqueda) {
                %>
                <div class="producto">
                    <div class="producto-info-visual">
                        <img src="<%= producto.getImagenURL()%>" alt="<%= producto.getNombreProducto()%>">
                        <h3><%= producto.getNombreProducto()%></h3>
                        <p><%= producto.getDescripcion()%></p>
                        <p>Precio: $<%= producto.getPrecio()%></p>
                    </div>

                    <div class="producto-acciones">
                        <p>Talla: **<%= producto.getTalla()%>**</p> <!-- Muestra la talla específica del producto -->

                        <div class="talla-selector">
                            <p>Seleccionar Talla:</p>
                            <!-- Botones de radio para seleccionar talla -->
                            <!-- nombre único para el grupo de radio buttons de cada producto -->
                            <input type="radio" id="tallaS_<%= producto.getIdProducto() %>" name="talla_<%= producto.getIdProducto() %>" value="S">
                            <label for="tallaS_<%= producto.getIdProducto() %>">S</label>

                            <input type="radio" id="tallaM_<%= producto.getIdProducto() %>" name="talla_<%= producto.getIdProducto() %>" value="M">
                            <label for="tallaM_<%= producto.getIdProducto() %>">M</label>

                            <input type="radio" id="tallaL_<%= producto.getIdProducto() %>" name="talla_<%= producto.getIdProducto() %>" value="L">
                            <label for="tallaL_<%= producto.getIdProducto() %>">L</label>

                            <input type="radio" id="tallaXL_<%= producto.getIdProducto() %>" name="talla_<%= producto.getIdProducto() %>" value="XL">
                            <label for="tallaXL_<%= producto.getIdProducto() %>">XL</label>
                        </div>

                        <button class="btn-comprar">Comprar</button>
                    </div>
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
