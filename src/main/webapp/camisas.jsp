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
                <div class="producto" data-id-producto="<%= producto.getIdProducto() %>">
                    <div class="producto-info-visual">
                        <img src="<%= producto.getImagenURL()%>" alt="<%= producto.getNombreProducto()%>">
                        <h3><%= producto.getNombreProducto()%></h3>
                        <p><%= producto.getDescripcion()%></p>
                        <p>Precio: $<%= producto.getPrecio()%></p>
                    </div>

                    <div class="producto-acciones">
                        <p>Talla: **<%= producto.getTalla()%>**</p>

                        <!-- Formulario para enviar el ID del producto y la talla seleccionada al Servlet -->
                        <form action="ServletCamisas" method="post">
                            <!-- Campo oculto para enviar el ID del producto -->
                            <input type="hidden" name="idProducto" value="<%= producto.getIdProducto() %>">

                            <div class="talla-selector">
                                <p>Seleccionar Talla:</p>
                                <!-- Los radio buttons deben tener el mismo 'name' dentro de su grupo para que solo uno sea seleccionable -->
                                <input type="radio" id="tallaS_<%= producto.getIdProducto() %>" name="tallaSeleccionada" value="S" required>
                                <label for="tallaS_<%= producto.getIdProducto() %>">S</label>

                                <input type="radio" id="tallaM_<%= producto.getIdProducto() %>" name="tallaSeleccionada" value="M" required>
                                <label for="tallaM_<%= producto.getIdProducto() %>">M</label>

                                <input type="radio" id="tallaL_<%= producto.getIdProducto() %>" name="tallaSeleccionada" value="L" required>
                                <label for="tallaL_<%= producto.getIdProducto() %>">L</label>

                                <input type="radio" id="tallaXL_<%= producto.getIdProducto() %>" name="tallaSeleccionada" value="XL" required>
                                <label for="tallaXL_<%= producto.getIdProducto() %>">XL</label>
                            </div>

                            <!-- El botón es de tipo "submit" para enviar el formulario -->
                            <button type="submit" class="btn-comprar">Comprar</button>
                        </form>
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
