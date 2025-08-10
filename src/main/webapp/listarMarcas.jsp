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
        <link rel="stylesheet" href="style/listarMarcas.css
        ">
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