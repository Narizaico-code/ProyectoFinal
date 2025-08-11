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
        <link rel="stylesheet" href="style/listarCategorias.css">

    <div class="menu-container">
        <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>
    </div>

    <style>
        /* General body and container styles for dark theme */
        body {
            background-color: #1a2035; /* Dark blue background color */
            color: #e0e0e0; /* Light gray text color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Container for the menu icon at the top */
        .menu-container {
            padding: 10px;
            text-align: left;
        }

        .menu-container img {
            width: 50px;
            height: 50px;
            filter: invert(100%); /* Inverts the color of the image to make it white */
        }

        /* Main container for the content, giving it a card-like appearance */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #2d3748; /* Darker blue-gray background for the card */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
        }

        /* Styles for the main heading inside the container */
        h2.text-center {
            color: #ffffff;
            margin-bottom: 20px;
        }

        /* Styles for the "Agregar Categoría" button */
        .btn-primary {
            background-color: #4a5568;
            border: none;
            color: #e0e0e0;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 20px;
        }

        .btn-primary:hover {
            background-color: #6a748a;
        }

        /* Table styling */
        .table {
            width: 100%;
            border-collapse: collapse;
            color: #e0e0e0;
        }

        .table thead {
            background-color: #1a2035;
            color: #ffffff;
        }

        .table th,
        .table td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #4a5568;
        }

        /* Row-specific styling for the table body */
        .table tbody tr:nth-child(even) {
            background-color: #2d3748;
        }

        .table tbody tr:nth-child(odd) {
            background-color: #1a2035;
        }

        /* Action button styling to match the image */
        .btn-warning {
            background-color: #f7b924; /* Yellow color */
            border: 1px solid #f7b924;
            color: #212529; /* Dark text for contrast */
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            margin-right: 5px;
        }

        .btn-danger {
            background-color: #dc3545; /* Red color */
            border: 1px solid #dc3545;
            color: #ffffff;
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
        }

        .btn-warning:hover {
            background-color: #e0a800;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Style for the "No categories registered" message */
        .text-center[colspan="3"] {
            color: #a0aec0;
            padding: 20px;
            text-align: center;
        }
    </style>
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
                <% }%>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
    crossorigin="anonymous"></script>
</body>
</html>