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
        <link rel="stylesheet" href="style/menuPrincipal.css">

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
                <a href="index.jsp">Cerrar Sesión</a>
            </div>
        </div>

        <!-- Contenido dividido en 2 -->
        <div class="contenido">

            <!-- SecciÃ³n CategorÃ­as -->
            <div class="categorias">
                <button onclick="mostrarMegaMenu('hombre')">Hombre</button>
                <button onclick="mostrarMegaMenu('mujer')">Mujer</button>
            </div>

            <!-- Mega menÃº para Hombre -->
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
                    <a href="#">SuÃ©teres</a>
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

            <!-- Mega menÃº para Mujer -->
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
                    <a href="#">SuÃ©teres</a>
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

                // Ocultar el mega menÃº cuando se hace clic fuera
                document.addEventListener("click", function (event) {
                    const btnHombre = document.querySelector("button[onclick=\"mostrarMegaMenu('hombre')\"]");
                    const btnMujer = document.querySelector("button[onclick=\"mostrarMegaMenu('mujer')\"]");
                    const menuHombre = document.getElementById("menu-hombre");
                    const menuMujer = document.getElementById("menu-mujer");

                    // Si el clic NO fue sobre los botones ni sobre los menÃºs
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

        <!-- SecciÃ³n Productos -->
        <!-- SecciÃ³n: Camisas -->
        <div class="seccion">
            <section>
                <div class="contenedor-productos">
                    <div class="encabezado-seccion">
                        <h2>Camisas</h2>
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver mÃ¡s</button>
                        <a href="camisas.jsp">
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button></a>
                    </div>

                    <div class="productos">
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8ItVG6L4PtaPdboK3AwBjDhJtBq5orRzFEg&s" alt="Camisa Elegante">
                            <h3>Camisa Elegante</h3>
                            <p>Camisa de algodÃ³n con diseÃ±o moderno para eventos formales.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq9E8hTLCj_y-TU2ra4qH0l1M_xLIYVJh9nw&s" alt="Camisa BÃ¡sica">
                            <h3>Camisa BÃ¡sica</h3>
                            <p>Camisa bÃ¡sica de uso diario, ligera y cÃ³moda.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyG87o5iaTj1TmfNrRFMOK_tbuF71sIf9yZA&s" alt="Camisa a Cuadros">
                            <h3>Camisa a Cuadros</h3>
                            <p>Camisa informal con diseÃ±o de cuadros clÃ¡sicos.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhac59qYX4Dy-IHadefeu46NhfIfpfWQ3zgQ&s" alt="Camisa Slim Fit">
                            <h3>Camisa Slim Fit</h3>
                            <p>Ajustada al cuerpo para un estilo mÃ¡s moderno.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxX4qu8NH2_d6Xhi-1M_q8UHrRXt2P_wdqOyYXsMnGviQ9m5vhP01SOjDIcNGaU6TrLXk&usqp=CAU" alt="Camisa Casual">
                            <h3>Camisa Casual</h3>
                            <p>Ideal para salidas informales o trabajo casual.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- SecciÃ³n: Pantalones -->
            <section>
                <div class="contenedor-productos">
                    <div class="encabezado-seccion">
                        <h2>Pantalones</h2>
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver mÃ¡s</button>
                        <a href="pantalones.jsp">
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button></a>
                    </div>

                    <div class="productos">
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5vvI-4A8gQPVapROMAttP2TnYHIylKdTzzg&s" alt="PantalÃ³n Casual">
                            <h3>PantalÃ³n Casual</h3>
                            <p>De corte recto, cÃ³modo para el dÃ­a a dÃ­a.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNTQGaujhps04jUbPwmngyS7Sj4N4Ci5YxZg&s" alt="PantalÃ³n Cargo">
                            <h3>PantalÃ³n Cargo</h3>
                            <p>Con bolsillos laterales, estilo urbano.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRaEzKN6sUJIfIExozLrlu8CM6UA165zKJPg&s" alt="Jogger">
                            <h3>Jogger</h3>
                            <p>PantalÃ³n deportivo con puÃ±os elÃ¡sticos.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5E9hQmEbUcmiU580EbcUtnPWKiCfUaILHvaMN8t0UdSoWvgmcy_kJ7vleehR4KXUgKZc&usqp=CAU" alt="PantalÃ³n de Vestir">
                            <h3>PantalÃ³n de Vestir</h3>
                            <p>Para eventos formales y reuniones de trabajo.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4W8uBxR6a_ikILpQqsCvNCThW9Wx70AWTVw&s" alt="PantalÃ³n Slim">
                            <h3>PantalÃ³n Slim</h3>
                            <p>Ajustado a las piernas para un look moderno.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- SecciÃ³n: SuÃ©teres -->
            <section>
                <div class="contenedor-productos">
                    <div class="encabezado-seccion">
                        <h2>SuÃ©teres</h2>
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver mÃ¡s</button>
                        <h2>Suéteres</h2>
                        <a href="sueteres.jsp">
                        <button class="ver-mas" onclick="mostrarMegaMenu('verMas')">Ver más</button></a>
                    </div>

                    <div class="productos">
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA4qW08bmbo5s-yVS4KCnbXbAN7bphS5ydXA&s" alt="SuÃ©ter BÃ¡sico">
                            <h3>SuÃ©ter BÃ¡sico</h3>
                            <p>SuÃ©ter de lana ligero y cÃ¡lido para uso diario.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbdRSlszDC0tHY9kLN8N7l7cDGNPPmFfXcNA&s" alt="SuÃ©ter de Cuello Alto">
                            <h3>Cuello Alto</h3>
                            <p>Ideal para invierno y dÃ­as frÃ­os.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wSylwr3zwLMv_kcRKgKMK7J3ZckSVgAfSQ&s" alt="SuÃ©ter con Capucha">
                            <h3>Con Capucha</h3>
                            <p>DiseÃ±o casual con estilo deportivo.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLpPmgcg_JFm7YPMB2Ft_Ulktu16S8KL86xw&s" alt="Cardigan">
                            <h3>Cardigan</h3>
                            <p>Abrigo abierto con botones para un look elegante.</p>
                        </div>
                        <div class="producto">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0vni5V__w7Ik3l6-wETrfhu3tsXIjtU7P9-vtWX8diJt5IbFbqGmsXya3Gk_tyw9r05c&usqp=CAU" alt="SuÃ©ter Trenzado">
                            <h3>Trenzado</h3>
                            <p>Textura de punto grueso para mayor abrigo.</p>
                        </div>
                    </div>
            </section>

        </div>
</body>
</html>

