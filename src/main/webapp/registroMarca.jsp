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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Estilos consistentes con listarMarcas.jsp */
            :root {
                --primary-color: #4361ee;
                --danger-color: #f72585;
            }
            
            .form-container {
                max-width: 600px;
                margin: 30px auto;
                padding: 25px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
            
            .form-title {
                color: #2c3e50;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 1px solid #eee;
            }
            
            .form-group {
                margin-bottom: 20px;
            }
            
            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
            }
            
            .form-control {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }
            
            .btn {
                padding: 10px 20px;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                font-size: 16px;
                transition: all 0.3s;
            }
            
            .btn-primary {
                background-color: var(--primary-color);
                color: white;
            }
            
            .btn-primary:hover {
                opacity: 0.9;
            }
            
            .btn-cancel {
                background-color: #f1f1f1;
                color: #333;
                margin-right: 10px;
            }
            
            .btn-cancel:hover {
                background-color: #e1e1e1;
            }
            
            .alert {
                padding: 10px 15px;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            
            .alert-success {
                background-color: #d4edda;
                color: #155724;
            }
            
            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
            }
        </style>
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