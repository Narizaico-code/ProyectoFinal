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
        
        <% if (request.getSession().getAttribute("mensaje") != null) { %>
    <div class="alert alert-success">
        <%= request.getSession().getAttribute("mensaje") %>
        <% request.getSession().removeAttribute("mensaje"); %>
    </div>
<% } %>

<% if (request.getSession().getAttribute("error") != null) { %>
    <div class="alert alert-danger">
        <%= request.getSession().getAttribute("error") %>
        <% request.getSession().removeAttribute("error"); %>
    </div>
<% } %>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            :root {
                --primary-color: #4361ee;
                --secondary-color: #3f37c9;
                --danger-color: #f72585;
                --light-color: #f8f9fa;
                --dark-color: #212529;
                --border-radius: 8px;
                --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f7fa;
                color: #333;
            }
            
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            
            .header {
                background-color: white;
                padding: 15px 0;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                margin-bottom: 30px;
            }
            
            .nav-container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 20px;
            }
            
            .logo {
                font-weight: bold;
                font-size: 1.5rem;
                color: var(--primary-color);
                text-decoration: none;
                display: flex;
                align-items: center;
            }
            
            .logo img {
                height: 40px;
                margin-right: 10px;
            }
            
            .nav-links {
                display: flex;
                gap: 20px;
            }
            
            .nav-links a {
                text-decoration: none;
                color: var(--dark-color);
                font-weight: 500;
                padding: 8px 12px;
                border-radius: var(--border-radius);
                transition: all 0.3s ease;
            }
            
            .nav-links a:hover {
                background-color: var(--light-color);
                color: var(--primary-color);
            }
            
            .card {
                background-color: white;
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
                padding: 25px;
                margin-bottom: 30px;
            }
            
            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                padding-bottom: 15px;
                border-bottom: 1px solid #eee;
            }
            
            .card-title {
                font-size: 1.5rem;
                color: var(--dark-color);
                margin: 0;
            }
            
            .btn {
                display: inline-flex;
                align-items: center;
                padding: 10px 20px;
                border-radius: var(--border-radius);
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
                border: none;
                cursor: pointer;
            }
            
            .btn-primary {
                background-color: var(--primary-color);
                color: white;
            }
            
            .btn-primary:hover {
                background-color: var(--secondary-color);
                transform: translateY(-2px);
            }
            
            .table-responsive {
                overflow-x: auto;
            }
            
            .table {
                width: 100%;
                border-collapse: collapse;
                font-size: 0.9rem;
            }
            
            .table th {
                background-color: var(--primary-color);
                color: white;
                padding: 12px 15px;
                text-align: left;
                font-weight: 500;
            }
            
            .table td {
                padding: 12px 15px;
                border-bottom: 1px solid #eee;
                vertical-align: middle;
            }
            
            .table tr:last-child td {
                border-bottom: none;
            }
            
            .table tr:hover {
                background-color: #f8f9fa;
            }
            
            .badge {
                display: inline-block;
                padding: 4px 8px;
                border-radius: 20px;
                font-size: 0.75rem;
                font-weight: 600;
            }
            
            .badge-primary {
                background-color: #e3f2fd;
                color: var(--primary-color);
            }
            
            .action-btns {
                display: flex;
                gap: 10px;
            }
            
            .btn-sm {
                padding: 6px 12px;
                font-size: 0.8rem;
                border-radius: 4px;
            }
            
            .btn-edit {
                background-color: #e3f2fd;
                color: var(--primary-color);
                border: 1px solid #bbdefb;
            }
            
            .btn-edit:hover {
                background-color: #bbdefb;
            }
            
            .btn-delete {
                background-color: #ffebee;
                color: var(--danger-color);
                border: 1px solid #ffcdd2;
            }
            
            .btn-delete:hover {
                background-color: #ffcdd2;
            }
            
            .text-center {
                text-align: center;
            }
            
            .empty-state {
                text-align: center;
                padding: 40px 0;
                color: #666;
            }
            
            .empty-state i {
                font-size: 3rem;
                color: #ddd;
                margin-bottom: 15px;
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
                                <td><span class="badge badge-primary">#<%= marca.getIdMarca() %></span></td>
                                <td><strong><%= marca.getNombreMarca() %></strong></td>
                                <td><%= marca.getCorreoMarca() %></td>
                                <td><%= marca.getDescripcion() %></td>
                                <td class="text-center">
                                    <div class="action-btns">
                                        <a href="ServletMarcas?accion=editar&id=<%= marca.getIdMarca() %>" class="btn btn-sm btn-edit">
                                            <i class="fas fa-edit"></i> Editar
                                        </a>
                                        <a href="ServletMarcas?accion=eliminar&id=<%= marca.getIdMarca() %>" class="btn btn-sm btn-delete">
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
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>