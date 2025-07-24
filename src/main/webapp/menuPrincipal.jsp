<%-- 
    Document   : menuPrincipal
    Created on : 20/07/2025, 14:18:52
    Author     : ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${titulo}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .menu {
            background-color: #333;
            padding: 10px;
            text-align: center;
        }
        .menu a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        .menu a:hover {
            color: #ff9800;
        }
        .bienvenida {
            text-align: center;
            margin-top: 40px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="menu">
        <a href="inicio.jsp">Inicio</a>
        <a href="productos.jsp">Productos</a>
        <a href="contacto.jsp">Contacto</a>
        <a href="logout.jsp">Cerrar Sesión</a>
    </div>

    <div class="bienvenida">
        <h1>{Bienvenio}</h1>
        <p>Bienvenido, <strong>${usuario}</strong>!</p>
    </div>
</body>
</html>

