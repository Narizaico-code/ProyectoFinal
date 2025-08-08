<%-- 
    Document   : editarMarca
    Created on : 4/08/2025, 01:09:38
    Author     : ricar
--%>

<%@page import="model.Marca"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Marca</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Mismos estilos que registroMarca.jsp */
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1 class="form-title">Editar Marca</h1>
            
            <%-- Mostrar mensajes de éxito/error --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <% Marca marca = (Marca) request.getAttribute("marca"); %>
            <form action="ServletMarcas?accion=actualizar" method="POST">
                <input type="hidden" name="id" value="<%= marca.getIdMarca() %>">
                
                <div class="form-group">
                    <label for="nombre">Nombre de la Marca</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" 
                           value="<%= marca.getNombreMarca() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" class="form-control" id="correo" name="correo" 
                           value="<%= marca.getCorreoMarca() %>" required>
                </div>
                
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" 
                              rows="3" required><%= marca.getDescripcion() %></textarea>
                </div>
                
                <div class="form-group">
                    <button type="button" class="btn btn-cancel" onclick="window.location.href='ServletMarcas'">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Actualizar Marca
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>