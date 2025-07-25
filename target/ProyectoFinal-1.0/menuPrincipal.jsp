<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>${titulo}</title>
        <style>

            body {

                font-family: 'Segoe UI', sans-serif;

                background-color: #f9f9f9;

                margin: 0;

                padding: 0;

                display: flex;

                flex-direction: column;

                height: 100vh;

            }

            /* Encabezado */

            .menu {

                background-color: #ffffff;

                padding: 15px 30px;

                display: flex;

                align-items: center;

                justify-content: space-between;

                color: #333;

                border-bottom: 1px solid #ddd;

                position: sticky;

                top: 0;

                z-index: 1000;

            }

            /* Buscador centrado */

            .search-bar {

                display: flex;

                align-items: center;

                gap: 8px;

                flex-grow: 1;

                justify-content: center;

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

                border-color: #ff9800;

                box-shadow: 0 0 5px rgba(255, 152, 0, 0.3);

            }

            .search-bar button {

                padding: 8px 16px;

                background-color: #ff9800;

                border: none;

                border-radius: 20px;

                color: white;

                font-weight: bold;

                cursor: pointer;

                transition: background-color 0.3s ease;

            }

            .search-bar button:hover {

                background-color: #e68900;

            }

            /* Links del menú a la derecha */

            .nav-links {

                display: flex;

                align-items: center;

            }

            .nav-links a {

                color: #333;

                text-decoration: none;

                font-weight: 500;

                margin-left: 20px;

                transition: color 0.3s ease;

            }

            .nav-links a:hover {

                color: #ff9800;

            }

            /* Contenido */

            .contenido {

                flex: 1;

                display: flex;

                flex-direction: column;

            }

            /* Categorías */

            .categorias {

                background-color: #fff;

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

                color: #333;

                cursor: pointer;

                transition: all 0.3s ease;

            }

            .categorias button:hover {

                background-color: #ff9800;

                color: white;

            }

             /*Productos*/ 

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

            .mega-menu {

                display: flex;

                justify-content: center;

                background-color: #fff;

                padding: 30px;

                gap: 50px;

                border-bottom: 1px solid #ddd;

            }

            .mega-menu .col {

                display: flex;

                flex-direction: column;

                gap: 8px;

            }

            .mega-menu .col h4 {

                font-weight: bold;

                margin-bottom: 10px;

                color: #333;

            }

            .mega-menu .col a {

                text-decoration: none;

                color: #555;

                font-size: 14px;

                transition: color 0.3s ease;

            }

            .mega-menu .col a:hover {

                color: #ff9800;

            }
            
            
           
        </style>
    </head>
    <body>

        <!-- Barra superior -->
        <div class="menu">
            <div class="espacio"></div>
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
                <button onclick="mostrarMegaMenu('hombre')">Hombre</button>
                <button onclick="mostrarMegaMenu('mujer')">Mujer</button>
            </div>

            <!-- Mega menú para Hombre -->
            <div class="mega-menu" id="menu-hombre" style="display: none;">
                <div class="col">
                    <h4><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJg7kZ0OB80zIHn_tnJwUdqQMGnq7tOIe4378iptqQ7R37KBhn52twXbL5Qsrll7bvyzY&usqp=CAU" alt="Tops" 

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">Tops</h4>
                    <a href="#">Estampadas</a>
                    <a href="#">Basic</a>
                    <a href="#">Manga Corta</a>
                    <a href="#">Manga Larga</a>
                </div>
                <div class="col">
                    <h4><img src="https://m.media-amazon.com/images/I/31UPR5tvMLL._SY1000_.jpg" alt="sweaters"

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">sweaters</h4>
                    <a href="#">Jackets</a>
                    <a href="#">Suéteres</a>
                    <a href="#">Abrigos</a>
                </div>
                <div class="col">
                    <h4><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCW9v-ULn9S3irnivR7aqcRIJV6I8Qy9u2cw&s" alt="pants"

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">Pants</h4>
                    <a href="#">Joger</a>
                    <a href="#">Cargo</a>
                    <a href="#">Rectos</a>
                </div>
            </div>

            <!-- Mega menú para Mujer -->
            <div class="mega-menu" id="menu-mujer" style="display: none;">
                <div class="col">
                    <h4><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJg7kZ0OB80zIHn_tnJwUdqQMGnq7tOIe4378iptqQ7R37KBhn52twXbL5Qsrll7bvyzY&usqp=CAU" alt="Tops" 

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">Tops</h4>
                    <a href="#">Estampadas</a>
                    <a href="#">Basic</a>
                    <a href="#">Top</a>
                    <a href="#">Manga Larga</a>
                </div>
                <div class="col">
                    <h4><img src="https://m.media-amazon.com/images/I/31UPR5tvMLL._SY1000_.jpg" alt="sweaters"

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">sweaters</h4>
                    <a href="#">Jackets</a>
                    <a href="#">Suéteres</a>
                    <a href="#">Abrigos</a>
                </div>
                <div class="col">
                    <h4><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCW9v-ULn9S3irnivR7aqcRIJV6I8Qy9u2cw&s" alt="pants"

                             style="width: 20px; height: 20px; vertical-align: middle; margin-right: 5px;">Pants</h4>
                    <a href="#">Joger</a>
                    <a href="#">Cargo</a>
                    <a href="#">Rectos</a>
                    <a href="#">Falda</a>
                </div>
            </div>

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

                // Ocultar el mega menú cuando se hace clic fuera

                document.addEventListener("click", function (event) {

                    const btnHombre = document.querySelector("button[onclick=\"mostrarMegaMenu('hombre')\"]");

                    const btnMujer = document.querySelector("button[onclick=\"mostrarMegaMenu('mujer')\"]");

                    const menuHombre = document.getElementById("menu-hombre");

                    const menuMujer = document.getElementById("menu-mujer");

                    // Si el clic NO fue sobre los botones ni sobre los menús

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
        </script>

        <!-- Sección Productos -->
            <h1>Camisas</h1>
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
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Pantalones Cargo">
                <h3>Pantalones Cargo</h3>
                <p>Pantalones Cargo ligeros y cómodos para uso diario.</p>
            </div>
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Estampados">
                <h3>Estampados</h3>
                <p>Estampados ligeros y cómodos para uso diario.</p>
            </div>
        </div>
        
         <div class="productos">
            <div class="producto">
                <img src="images/camisa1.jpg" alt="Playeras Deportivas">
                <h3>Playeras Deportivas</h3>
                <p>Playeras Deportivas ligeras y anti transpirantes .</p>
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
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Pantalones Cargo">
                <h3>Pantalones Cargo</h3>
                <p>Pantalones Cargo ligeros y cómodos para uso diario.</p>
            </div>
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Estampados">
                <h3>Estampados</h3>
                <p>Estampados ligeros y cómodos para uso diario.</p>
            </div>
        </div>
        
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
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Pantalones Cargo">
                <h3>Pantalones Cargo</h3>
                <p>Pantalones Cargo ligeros y cómodos para uso diario.</p>
            </div>
            
            <div class="producto">
                <img src="images/zapatos1.jpg" alt="Estampados">
                <h3>Estampados</h3>
                <p>Estampados ligeros y cómodos para uso diario.</p>
            </div>
        </div>
        
    </div>
        
       

</body>
</html>

