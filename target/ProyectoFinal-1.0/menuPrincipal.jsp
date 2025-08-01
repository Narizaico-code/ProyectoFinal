<%-- 
    Document   : registrarse
    Created on : 25/07/2025, 11:23:24
    Author     : ricardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${titulo}</title>
        <style>
            /* ==== VARIABLES ==== */
            :root {
                --primary-color: #a3c4f3;
                --secondary-color: #d6eadf;
                --accent-color: #f5cac3;
                --text-color: #333;
                --background-color: #fefefe;
                --button-hover: #b5d3f5;
            }

            /* ==== BASE ==== */
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: var(--secondary-color);
                margin: 0;
                padding: 0;
                color: var(--text-color);
                display: flex;
                flex-direction: column;
                height: 100vh;
            }

            h2 {
                padding: 10px 20px;
                margin: 0 0 10px 0;
                font-size: 24px;
                text-align: left;
                color: var(--text-color);
            }

            /* ==== MENU SUPERIOR ==== */
            .menu {
                background-color: var(--background-color);
                padding: 15px 30px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ccc;
                position: sticky;
                top: 0;
                z-index: 1000;
            }

            .nav-links a {
                color: var(--text-color);
                text-decoration: none;
                font-weight: 500;
                margin-left: 20px;
                transition: color 0.3s ease;
            }

            .nav-links a:hover {
                color: var(--accent-color);
            }

            /* ==== SEARCH BAR ==== */
            .search-bar {
                display: flex;
                align-items: center;
                gap: 8px;
                flex-grow: 1;
                justify-content: center;
            }

            .search-bar img {
                width: 70px;
                height: auto;
                position: absolute;
                top: 0px;
                left: 70px;
            }

            .search-bar input[type="text"] {
                padding: 8px 12px;
                border: 1px solid #ccc;
                border-radius: 20px;
                font-size: 14px;
                width: 250px;
                transition: all 0.3s ease;
            }

            .search-bar input[type="text"]:focus {
                outline: none;
                border-color: var(--accent-color);
                box-shadow: 0 0 5px rgba(245, 202, 195, 0.3);
            }

            .search-bar button {
                padding: 8px 16px;
                background-color: #ff9900;
                border: none;
                border-radius: 20px;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .search-bar button:hover {
                background-color: var(--button-hover);
            }

            /* ==== CATEGORÍAS ==== */
            .categorias {
                background-color: var(--background-color);
                padding: 30px 20px;
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 15px;
                border-bottom: 1px solid #eee;
            }

            .categorias button {
                background-color: #f0f0f0;
                border: none;
                padding: 10px 20px;
                border-radius: 30px;
                font-weight: 500;
                color: var(--text-color);
                cursor: pointer;
                transition: all 0.3s ease;
                height: 65px;
            }

            .categorias button:hover {
                background-color: var(--primary-color);
                color: white;
            }

            /* ==== MEGA MENU ==== */
            .mega-menu {
                display: flex;
                justify-content: center;
                background-color: var(--background-color);
                padding: 30px;
                gap: 50px;
                border-bottom: 1px solid #ccc;
            }

            .mega-menu .col h4 {
                font-weight: bold;
                margin-bottom: 10px;
                color: var(--text-color);
            }

            .mega-menu .col a {
                text-decoration: none;
                color: #555;
                font-size: 14px;
                transition: color 0.3s ease;
            }

            .mega-menu .col a:hover {
                color: var(--accent-color);
            }

            /* ==== SECCIÓN DE PRODUCTOS ==== */
            .seccion {
                padding: 0;
            }

            .contenedor-productos {
                padding: 0 20px;
            }

            .encabezado-seccion {
                padding: 0 20px;
                margin-bottom: 10px;
                display: block;
            }

            .encabezado-seccion h2 {
                padding: 0;
                margin: 0 0 5px 0;
                font-size: 24px;
                text-align: left;
                color: var(--text-color);
            }

            .encabezado-seccion .ver-mas {
                margin-top: 5px;
                padding: 8px 16px;
                background-color: #ff9900;
                border: none;
                border-radius: 20px;
                color: white;
                font-weight: bold;
                cursor: pointer;
                transition: background-color 0.3s ease;
                display: inline-block;
            }

            .encabezado-seccion .ver-mas:hover {
                background-color: var(--button-hover);
            }

            .productos {
                display: flex;
                justify-content: center;
                align-content: flex-start;
                gap: 25px;
                padding: 30px 20px;
                flex-wrap: nowrap;
                overflow-x: auto;
            }

            .producto {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                width: 220px;
                padding: 15px;
                text-align: center;
            }

            .producto img {
                width: auto;
                height: 1fr;
                object-fit: cover;
                border-radius: 5px;
            }

            .producto h3 {
                margin: 12px 0 8px 0;
                font-size: 18px;
                color: var(--primary-color);
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
            <div class="espacio"></div>
            <form class="search-bar" action="ServletMenuPrincipal" method="get">
                <img src="images/Logo.jpg" alt="Logo de la marca">
                <input type="text" name="query" placeholder="Buscar productos...">
                <button type="submit">Buscar</button>
            </form>

            <div class="nav-links">
                <a href="contacto.jsp">Contacto</a>
                <a href="index.jsp">Cerrar Sesión</a>
            </div>
        </div>

        <div class="contenido">
            <%
                // Obtener lista de productos y resultados de búsqueda
                List<Productos> resultadoBusqueda = (List<Productos>) request.getAttribute("resultadoBusqueda");
                List<Productos> productos = (List<Productos>) request.getAttribute("productos");

                if (resultadoBusqueda != null && !resultadoBusqueda.isEmpty()) {
            %>
            <h2>Resultados de la búsqueda</h2>
            <div class="productos">
                <%
                    for (Productos producto : resultadoBusqueda) {
                %>
                <div class="producto">
                    <img src="<%= producto.getImagenURL()%>" alt="<%= producto.getNombreProducto()%>" 
                         >
                    <h3><%= producto.getNombreProducto()%></h3>
                    <p><%= producto.getDescripcion()%></p>
                </div>
                <%
                    }
                %>
            </div>
            <a href="ServletMenuPrincipal">Volver al listado completo</a>
            <%
            } else {
                // Mostrar listado completo por categorías
                // Primero definimos listas auxiliares para cada categoría:
                List<Productos> camisas = new java.util.ArrayList();
                List<Productos> pantalones = new java.util.ArrayList();
                List<Productos> sueteres = new java.util.ArrayList();

                if (productos != null) {
                    for (Productos producto : productos) {
                        String categoria = producto.getCategoria();
                        if (categoria != null) {
                            categoria = categoria.toLowerCase();
                            if (categoria.equals("camisa") || categoria.equals("camisas")) {
                                camisas.add(producto);
                            } else if (categoria.equals("pantalon") || categoria.equals("pantalones")) {
                                pantalones.add(producto);
                            } else if (categoria.equals("suéter") || categoria.equals("sueter") || categoria.equals("suéteres") || categoria.equals("sueteres")) {
                                sueteres.add(producto);
                            }
                        }
                    }
                }
            %>

            <!-- Categoría Camisas -->
            <div class="categorias">
                <button type="submit" onclick="location.href='camisas.jsp'"><h2>Camisas</h2></button>
                <div class="productos">
                    <%
                        for (Productos p : camisas) {
                    %>
                    <div class="producto">
                        <img src="<%= p.getImagenURL()%>" alt="<%= p.getNombreProducto()%>" 
                             >
                        <h3><%= p.getNombreProducto()%></h3>
                        <p><%= p.getDescripcion()%></p>
                    </div>
                    <%
                        }
                        if (camisas.isEmpty()) {
                    %>
                    <p>No hay productos en esta categoría.</p>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- Categoría Pantalones -->
            <div class="categorias">
                <button type="submit" onclick="location.href='pantalones.jsp'"><h2>Pantalones</h2></button>
                <div class="productos">
                    <%
                        for (Productos p : pantalones) {
                    %>
                    <div class="producto">
                        <img src="<%= p.getImagenURL()%>" alt="<%= p.getNombreProducto()%>" 
                             >
                        <h3><%= p.getNombreProducto()%></h3>
                        <p><%= p.getDescripcion()%></p>
                    </div>
                    <%
                        }
                        if (pantalones.isEmpty()) {
                    %>
                    <p>No hay productos en esta categoría.</p>
                    <%
                        }
                    %>
                </div>
            </div>

            <!-- Categoría Suéteres -->
            <div class="categorias">
                <button type="submit" onclick="location.href='sueteres.jsp'"><h2>Suéteres</h2></button>
                <div class="productos">
                    <%
                        for (Productos p : sueteres) {
                    %>
                    <div class="producto">
                        <img src="<%= p.getImagenURL()%>" alt="<%= p.getNombreProducto()%>" 
                             >
                        <h3><%= p.getNombreProducto()%></h3>
                        <p><%= p.getDescripcion()%></p>
                    </div>
                    <%
                        }
                        if (sueteres.isEmpty()) {
                    %>
                    <p>No hay productos en esta categoría.</p>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>
        </div>

        <!-- Script mega menú (igual que el tuyo) -->
        <script>
            function mostrarMegaMenu(tipo) {
                const hombre = document.getElementById("menu-hombre");
                const mujer = document.getElementById("menu-mujer");

                if (tipo === 'hombre') {
                    hombre.style.display = "flex";
                    mujer.style.display = "none";
                } else {
                    mujer.style.display = "flex";
                    hombre.style.display = "none";
                }
            }

            document.addEventListener("click", function (event) {
                const btnHombre = document.querySelector("button[onclick=\"mostrarMegaMenu('hombre')\"]");
                const btnMujer = document.querySelector("button[onclick=\"mostrarMegaMenu('mujer')\"]");
                const menuHombre = document.getElementById("menu-hombre");
                const menuMujer = document.getElementById("menu-mujer");

                if (
                        !menuHombre.contains(event.target) &&
                        !btnHombre.contains(event.target) &&
                        !menuMujer.contains(event.target) &&
                        !btnMujer.contains(event.target)
                        ) {
                    menuHombre.style.display = "none";
                    menuMujer.style.display = "none";
                }
            });
        </script>

    </body>
</html>