<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Categorias"%>
<%
    Categorias categoria = (Categorias) request.getAttribute("categoria");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Categoría</title>
    </head>
    <body>
        <h1>Editar Categoría</h1>

        <form action="ServletEditarCategoria" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%= categoria.getIdCategoria() %>">

            <label for="nombreCategoria">Nombre de la Categoría:</label><br>
            <input type="text" id="nombreCategoria" name="nombreCategoria" value="<%= categoria.getNombreCategoria() %>" required><br><br>

            <input type="submit" value="Actualizar">
        </form>

        <br>
        <a href="ServletListarCategoria">Volver a la lista</a>
    </body>
</html>
