<%-- 
    Document   : listarCategorias
    Created on : 1/08/2025, 15:50:10
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Categorias"%>
<!DOCTYPE html>
<html  lang="es">
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lista de Categorías</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
          crossorigin="anonymous">
    <style>
        .menu {
            width: 128px;
            height: auto;
        }
    </style>
    <a href="administrar.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a menú principal"></a>
</head>

<body>

<div class="container mt-4">
    <h2 class="text-center mb-4">Listado de Categorías</h2>
    <a href="registroCategoria.jsp" class="btn btn-primary mb-3">Agregar Categoría</a>

    <table class="table table-bordered table-stripe">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nombre de Categoría</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Categorias> listaCategorias = (List<Categorias>) request.getAttribute("listaCategorias");
                if (listaCategorias != null && !listaCategorias.isEmpty()) {
                    for (Categorias categoria : listaCategorias) {
            %>
            <tr>
                <td><%=categoria.getIdCategoria()%></td>
                <td><%=categoria.getNombreCategoria()%></td>
                <td>
                    <a href="<%=request.getContextPath()%>/ServletEditarCategoria?accion=editar&id=<%=categoria.getIdCategoria()%>" class="btn btn-warning btn-sm">Editar</a>
                    <a href="<%=request.getContextPath()%>/ServletEliminarCategoria?id=<%=categoria.getIdCategoria()%>" class="btn btn-danger btn-sm"
                       onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td class="text-center" colspan="3">No hay categorías registradas</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>
</html>