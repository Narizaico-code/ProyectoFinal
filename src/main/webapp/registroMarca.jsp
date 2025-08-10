<%-- 
    Document   : registroMarca
    Created on : 4/08/2025, 01:10:04
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Nueva Marca</title>
        <link rel="stylesheet" href="style/registroMarca.css">

    </head>
    <body>
        <div class="form-container">
            <h1 class="form-title">Registrar Nueva Marca</h1>
            
            <%-- Mostrar mensajes de éxito/error --%>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="ServletMarcas?accion=guardar" method="POST">
                <div class="form-group">
                    <label for="nombre">Nombre de la Marca</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                
                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" class="form-control" id="correo" name="correo" required>
                </div>
                
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
                </div>
                
                <div class="form-group">
                    <button type="button" class="btn btn-cancel" onclick="window.location.href='ServletMarcas'">
                        <i class="fas fa-times"></i> Cancelar
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Guardar Marca
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>