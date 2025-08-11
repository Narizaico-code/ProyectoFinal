<%-- 
    Document   : listarMarcas
    Created on : 4/08/2025, 01:09:08
    Author     : ricar
--%>
listarMarcas jsp, <%-- 
    Document   : listarMarcas
    Created on : 3 ago 2025, 21:33:43
    Author     : 
--%>

<%@page import="model.Marca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Marcas</title>

        <% if (request.getSession().getAttribute("mensaje") != null) {%>
    <div class="alert alert-success">
        <%= request.getSession().getAttribute("mensaje")%>
        <% request.getSession().removeAttribute("mensaje"); %>
    </div>
    <% } %>

    <% if (request.getSession().getAttribute("error") != null) {%>
    <div class="alert alert-danger">
        <%= request.getSession().getAttribute("error")%>
        <% request.getSession().removeAttribute("error"); %>
    </div>
    <% } %>
    <style>
        /* General body and container styles for dark theme */
        body {
            background-color: #1a2035; /* Dark blue background color */
            color: #e0e0e0; /* Light gray text color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Header and navigation bar styling */
        .header {
            background-color: #1a2035;
            padding: 10px 20px;
            border-bottom: 1px solid #4a5568;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #ffffff;
            font-size: 1.5em;
            font-weight: bold;
        }

        .logo img {
            height: 50px;
            width: 50px;
            margin-right: 10px;
            border-radius: 50%;
        }

        .nav-links {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .nav-links a {
            color: #a0aec0;
            text-decoration: none;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #ffffff;
        }

        .nav-links img {
            width: 50px;
            height: 50px;
            filter: invert(100%);
        }

        /* Main container and card styling */
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .card {
            background-color: #2d3748;
            border-radius: 8px;
            padding: 20px;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-title {
            margin: 0;
            color: #ffffff;
        }

        .btn-primary {
            background-color: #4a5568;
            border: none;
            color: #e0e0e0;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .btn-primary:hover {
            background-color: #6a748a;
        }

        /* Table styling */
        .table-responsive {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: #2d3748;
            color: #e0e0e0;
        }

        .table thead tr {
            background-color: #1a2035;
            color: #ffffff;
        }

        .table th,
        .table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #4a5568;
        }

        .table th:last-child,
        .table td:last-child {
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #384257;
        }

        /* Specific styles for table content */
        .badge {
            background-color: #4a5568;
            color: #ffffff;
            padding: 5px 8px;
            border-radius: 4px;
        }

        strong {
            color: #ffffff;
        }

        .action-btns {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-edit,
        .btn-delete {
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9em;
            font-weight: bold;
            color: #ffffff;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-edit {
            background-color: #ffc107;
            color: #212529;
        }

        .btn-delete {
            background-color: #dc3545;
        }

        /* Styling for the empty state message */
        .empty-state {
            text-align: center;
            padding: 50px;
        }

        .empty-state h3 {
            margin-top: 10px;
            color: #a0aec0;
        }

        .empty-state p {
            color: #718096;
        }

        /* Alert messages styling */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: #fff;
            font-weight: bold;
        }

        .alert-success {
            background-color: #4CAF50;
            border: 1px solid #45a049;
        }

        .alert-danger {
            background-color: #f44336;
            border: 1px solid #da190b;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="nav-container">
            <a href="#" class="logo">
                <img src="images/Logo.jpg" alt="Logo">
                MiTienda
            </a>
            <div class="nav-links">
                <a href="ServletMarcas?accion=listar">Marcas</a>
                <a href="contactenos.jsp">Contacto</a>
                <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>

            </div>
        </div>
    </header>

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h1 class="card-title">Listado de Marcas</h1>
                <a href="ServletMarcas?accion=nuevo" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Agregar Marca
                </a>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Correo</th>
                            <th>Descripción</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Marca> listaMarcas = (List<Marca>) request.getAttribute("marcas");
                            if (listaMarcas != null && !listaMarcas.isEmpty()) {
                                for (Marca marca : listaMarcas) {
                        %>
                        <tr>
                            <td><span class="badge badge-primary">#<%= marca.getIdMarca()%></span></td>
                            <td><strong><%= marca.getNombreMarca()%></strong></td>
                            <td><%= marca.getCorreoMarca()%></td>
                            <td><%= marca.getDescripcion()%></td>
                            <td class="text-center">
                                <div class="action-btns">
                                    <a href="ServletMarcas?accion=editar&id=<%= marca.getIdMarca()%>" class="btn btn-sm btn-edit">
                                        <i class="fas fa-edit"></i> Editar
                                    </a>
                                    <a href="ServletMarcas?accion=eliminar&id=<%= marca.getIdMarca()%>" class="btn btn-sm btn-delete">
                                        <i class="fas fa-trash-alt"></i> Eliminar
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <i class="fas fa-box-open"></i>
                                    <h3>No hay marcas registradas</h3>
                                    <p>Comienza agregando una nueva marca</p>
                                </div>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
     </body>
</html>