<%-- 
    Document   : registrarse
    Created on : 25/07/2025, 11:23:24
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
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .menu {
            background-color: #333;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            color: white;
        }

        .search-bar {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .search-bar input[type="text"] {
            padding: 7px;
            border: none;
            border-radius: 3px;
            font-size: 14px;
            width: 200px;
        }

        .search-bar button {
            padding: 7px 12px;
            background-color: #ff9800;
            border: none;
            border-radius: 3px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-bar button:hover {
            background-color: #e68900;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-left: 20px;
        }

        /* NUEVO: Contenedor general dividido en 2 mitades */
        .contenido {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .categorias {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            background-color: #eee;
            padding: 20px;
            gap: 15px;
        }

        .categorias button {
            background-color: #555;
            border: none;
            padding: 12px 20px;
            color: white;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .categorias button:hover {
            background-color: #ff9800;
        }

        .productos {
            flex: 1;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-content: flex-start;
            gap: 25px;
            padding: 30px 20px;
            overflow-y: auto;
        }

        .producto {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            width: 220px;
            padding: 15px;
            text-align: center;
        }

        .producto img {
            width: 100%;
            height: 140px;
            object-fit: cover;
            border-radius: 5px;
        }

        .producto h3 {
            margin: 12px 0 8px 0;
            font-size: 18px;
        }

        .producto p {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

    <!-- Barra superior -->
    <div class="menu">
        <form class="search-bar" action="buscarProductos" method="get">
            <input type="text" name="query" placeholder="Buscar productos...">
            <button type="submit">Buscar</button>
        </form>

        <div class="nav-links">
            <a href="inicio.jsp">Inicio</a>
            <a href="contacto.jsp">Contacto</a>
            <a href="index.jsp">Cerrar Sesión</a>
        </div>
    </div>

    <!-- Contenido dividido en 2 -->
    <div class="contenido">

        <!-- Sección Categorías -->
        <div class="categorias">
            <button onclick="location.href='categoria.jsp?cat=camisas'">Camisas</button>
            <button onclick="location.href='categoria.jsp?cat=pantalones'">Pantalones</button>
            <button onclick="location.href='categoria.jsp?cat=zapatos'">Zapatos</button>
            <button onclick="location.href='categoria.jsp?cat=accesorios'">Accesorios</button>
            <button onclick="location.href='categoria.jsp?cat=abrigos'">Abrigos</button>
            <button onclick="location.href='categoria.jsp?cat=deportiva'">Ropa Deportiva</button>
            <button onclick="location.href='categoria.jsp?cat=ofertas'">Ofertas</button>
            <button onclick="location.href='categoria.jsp?cat=novedades'">Novedades</button>
        </div>

        <!-- Sección Productos -->
        <div class="productos">
            <div class="producto">
                <img src="images/camisa1.jpg" alt="Camisa elegante">
                <h3>Camisa Elegante</h3>
                <p>Camisa de algodón con diseño moderno y cómodo para cualquier ocasión.</p>
            </div>
            <div class="producto">
                <img src="images/pantalon1.jpg" alt="Pantalón casual">
                <h3>Pantalón Casual</h3>
                <p>Pantalón casual con ajuste perfecto y tela resistente.</p>
            </div>
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Zapatos deportivos">
                <h3>Zapatos Deportivos</h3>
                <p>Zapatos deportivos ligeros y cómodos para uso diario.</p>
            </div>
            <!-- Puedes agregar más productos aquí -->
        </div>

    </div>

</body>
</html>
