<%-- 
    Document   : administrar
    Created on : 31/07/2025, 20:29:26
    Author     : Dell Inspiron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administracion</title>
        <link rel="stylesheet" href="style/administrar.css">

    </head>
    <body>
        <div class="menu">
            <div class="espacio"></div>
            <form class="search-bar" action="buscarProductos" method="get">
                <img src="images/Logo.jpg" alt="Logo de la marca">
            </form>

            <div class="nav-links">
                <a href="ServletMenuPrincipal">Regresar</a>
            </div>
        </div>
        
         <div class="tablas">
            <div class="card">
                <a href="ServletListarProducto"> <img src="https://img.icons8.com/?size=100&id=11229&format=png&color=000000" alt="Poductos"></a>
                <h3>Productos</h3>
            </div>
            <div class="card">
                <a href="proveedores.jsp"><img src="https://img.icons8.com/?size=100&id=61849&format=png&color=000000" alt="Proveedores"></a>
                <h3>Proveedores</h3>
            </div>
            <div class="card">
                <a href="login.jsp"> <img src="https://img.icons8.com/?size=100&id=69&format=png&color=000000" alt="Clientes"></a>
                <h3>Clientes</h3>
            </div>
        </div>
    </body>
</html>
