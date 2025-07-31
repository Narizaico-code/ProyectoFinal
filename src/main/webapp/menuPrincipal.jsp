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
          width: 100%;
          height: 140px;
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
            <form class="search-bar" action="buscarProductos" method="get">
                <img src="images/Logo.jpg" alt="Logo de la marca">
                <input type="text" name="query" placeholder="Buscar productos...">
                <button type="submit">Buscar</button>
            </form>

            <div class="nav-links">
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
                        !btnMujer.contains(event.target))
                    {
                        menuHombre.style.display = "none";
                        menuMujer.style.display = "none";

                    }

                });
            </script>
        </script>

        <!-- Sección Productos -->
            <!-- Sección: Camisas -->
       <div class="seccion">
           <section>
            <div class="contenedor-productos">
              <div class="encabezado-seccion">
                <h2>Camisas</h2>
                <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button>
              </div>

                <div class="productos">
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ItVG6L4PtaPdboK3AwBjDhJtBq5orRzFEg&s" alt="Camisa Elegante">
                        <h3>Camisa Elegante</h3>
                        <p>Camisa de algodón con diseño moderno para eventos formales.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq9E8hTLCj_y-TU2ra4qH0l1M_xLIYVJh9nw&s" alt="Camisa Básica">
                        <h3>Camisa Básica</h3>
                        <p>Camisa básica de uso diario, ligera y cómoda.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyG87o5iaTj1TmfNrRFMOK_tbuF71sIf9yZA&s" alt="Camisa a Cuadros">
                        <h3>Camisa a Cuadros</h3>
                        <p>Camisa informal con diseño de cuadros clásicos.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhac59qYX4Dy-IHadefeu46NhfIfpfWQ3zgQ&s" alt="Camisa Slim Fit">
                        <h3>Camisa Slim Fit</h3>
                        <p>Ajustada al cuerpo para un estilo más moderno.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxX4qu8NH2_d6Xhi-1M_q8UHrRXt2P_wdqOyYXsMnGviQ9m5vhP01SOjDIcNGaU6TrLXk&usqp=CAU" alt="Camisa Casual">
                        <h3>Camisa Casual</h3>
                        <p>Ideal para salidas informales o trabajo casual.</p>
                    </div>
                </div>
            </section>

            <!-- Sección: Pantalones -->
            <section>
                <div class="contenedor-productos">
              <div class="encabezado-seccion">
                <h2>Pantalones</h2>
                <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button>
              </div>
               
                <div class="productos">
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vvI-4A8gQPVapROMAttP2TnYHIylKdTzzg&s" alt="Pantalón Casual">
                        <h3>Pantalón Casual</h3>
                        <p>De corte recto, cómodo para el día a día.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTQGaujhps04jUbPwmngyS7Sj4N4Ci5YxZg&s" alt="Pantalón Cargo">
                        <h3>Pantalón Cargo</h3>
                        <p>Con bolsillos laterales, estilo urbano.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRaEzKN6sUJIfIExozLrlu8CM6UA165zKJPg&s" alt="Jogger">
                        <h3>Jogger</h3>
                        <p>Pantalón deportivo con puños elásticos.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5E9hQmEbUcmiU580EbcUtnPWKiCfUaILHvaMN8t0UdSoWvgmcy_kJ7vleehR4KXUgKZc&usqp=CAU" alt="Pantalón de Vestir">
                        <h3>Pantalón de Vestir</h3>
                        <p>Para eventos formales y reuniones de trabajo.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W8uBxR6a_ikILpQqsCvNCThW9Wx70AWTVw&s" alt="Pantalón Slim">
                        <h3>Pantalón Slim</h3>
                        <p>Ajustado a las piernas para un look moderno.</p>
                    </div>
                </div>
            </section>

            <!-- Sección: Suéteres -->
            <section>
                <div class="contenedor-productos">
              <div class="encabezado-seccion">
                <h2>Suéteres</h2>
                <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button>
              </div>
                
                <div class="productos">
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA4qW08bmbo5s-yVS4KCnbXbAN7bphS5ydXA&s" alt="Suéter Básico">
                        <h3>Suéter Básico</h3>
                        <p>Suéter de lana ligero y cálido para uso diario.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbdRSlszDC0tHY9kLN8N7l7cDGNPPmFfXcNA&s" alt="Suéter de Cuello Alto">
                        <h3>Cuello Alto</h3>
                        <p>Ideal para invierno y días fríos.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wSylwr3zwLMv_kcRKgKMK7J3ZckSVgAfSQ&s" alt="Suéter con Capucha">
                        <h3>Con Capucha</h3>
                        <p>Diseño casual con estilo deportivo.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLpPmgcg_JFm7YPMB2Ft_Ulktu16S8KL86xw&s" alt="Cardigan">
                        <h3>Cardigan</h3>
                        <p>Abrigo abierto con botones para un look elegante.</p>
                    </div>
                    <div class="producto">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0vni5V__w7Ik3l6-wETrfhu3tsXIjtU7P9-vtWX8diJt5IbFbqGmsXya3Gk_tyw9r05c&usqp=CAU" alt="Suéter Trenzado">
                        <h3>Trenzado</h3>
                        <p>Textura de punto grueso para mayor abrigo.</p>
                    </div>
                </div>
                </section>

        </div>
</body>
</html>

