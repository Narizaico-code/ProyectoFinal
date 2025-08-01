<%-- 
    Document   : camisas
    Created on : 31/07/2025, 16:43:26
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Camisas</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/camisas.css?v=1">
    </head>
    <body>
        
        <div class="menu">
            <button class="btn"  id="btn-volver" onclick="history.back()">←Volver</button>
            <div class="grid"></div>
            <div id="poda">
                <div class="glow"></div>
                <div class="darkBorderBg"></div>
                <div class="darkBorderBg"></div>
                <div class="darkBorderBg"></div>

                <div class="white"></div>

                <div class="border"></div>

                <div id="main">
                    <input placeholder="Search..." type="text" name="text" class="input" />
                    <div id="input-mask"></div>
                    <div id="pink-mask"></div>
                    <div class="filterBorder"></div>
                    <div id="filter-icon">
                        <svg
                            preserveAspectRatio="none"
                            height="27"
                            width="27"
                            viewBox="4.8 4.56 14.832 15.408"
                            fill="none"
                            >
                        <path
                            d="M8.16 6.65002H15.83C16.47 6.65002 16.99 7.17002 16.99 7.81002V9.09002C16.99 9.56002 16.7 10.14 16.41 10.43L13.91 12.64C13.56 12.93 13.33 13.51 13.33 13.98V16.48C13.33 16.83 13.1 17.29 12.81 17.47L12 17.98C11.24 18.45 10.2 17.92 10.2 16.99V13.91C10.2 13.5 9.97 12.98 9.73 12.69L7.52 10.36C7.23 10.08 7 9.55002 7 9.20002V7.87002C7 7.17002 7.52 6.65002 8.16 6.65002Z"
                            stroke="#d6d6e6"
                            stroke-width="1"
                            stroke-miterlimit="10"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            ></path>
                        </svg>
                    </div>
                    <div id="search-icon">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            viewBox="0 0 24 24"
                            stroke-width="2"
                            stroke-linejoin="round"
                            stroke-linecap="round"
                            height="24"
                            fill="none"
                            class="feather feather-search"
                            >
                        <circle stroke="url(#search)" r="8" cy="11" cx="11"></circle>
                        <line
                            stroke="url(#searchl)"
                            y2="16.65"
                            y1="22"
                            x2="16.65"
                            x1="22"
                            ></line>
                        <defs>
                        <linearGradient gradientTransform="rotate(50)" id="search">
                        <stop stop-color="#f8e7f8" offset="0%"></stop>
                        <stop stop-color="#b6a9b7" offset="50%"></stop>
                        </linearGradient>
                        <linearGradient id="searchl">
                        <stop stop-color="#b6a9b7" offset="0%"></stop>
                        <stop stop-color="#837484" offset="50%"></stop>
                        </linearGradient>
                        </defs>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
        <div class="productos">
            <div class="card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2ss7iQ90yvlwTKDgUGGxStwvKm3LZY7KLLA&s" alt="Camisa semi formal">
                <h3>Camisa semi formal</h3>
                <p>Camisa de algodon con lineas en azul</p>
            </div>
            <div class="card">
                <img src="https://leonisa.gt/cdn/shop/files/M3036_457_1200X1500_1_1024x1024.jpg?v=1722810009" alt="Camis manga larga">
                <h3>Camis manga larga</h3>
                <p>Camisa de algodon, manga larga</p>
            </div>
            <div class="card">
                <img src="https://m.media-amazon.com/images/I/81ObyhBUNAL._UY1000_.jpg" alt="Camisa estilo playa">
                <h3>Camisa estilo playa</h3>
                <p>Camisa de lino, con detyalles en azul, para vacacionar</p>
            </div>
            <div class="card">
                <img src="https://s3-us-west-1.amazonaws.com/calzzapato/zoom/09GS3H-1.jpg" alt="Camisa polo">
                <h3>Camisa polo</h3>
                <p>Camisa polo muy ligera hecha de algodón y polestireno</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/2e/ba/82/2eba8287a363ad0ec4a50bf14f069fbe.jpg" alt="Camisa casual">
                <h3>Camisa casual</h3>
                <p>Camisa de manga larga hecha de algodón y elastano</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/b4/fc/ba/b4fcbac548db57b9b86b4499859d75e4.jpg" alt="Camisa a cuadros">
                <h3>Camisa a cuadros</h3>
                <p>Un diseño de cuadros sencillo y casual hecha dealgodón.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/d8/64/5a/d8645ad2b52551f8bb662f734d873b74.jpg" alt="Suéter Daisy y Yankees">
                <h3>Camisa sencilla</h3>
                <p>es de estilo casual, con un diseño sencillo y hechos de algodón.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/e5/df/f4/e5dff4fe42028cc05013e3b3f355fa81.jpg" alt="Camisa multi diseño">
                <h3>Camisa multi diseño</h3>
                <p>Camisa que combina una mitad estampada con flores y la otra de color sólido, hecho de algodón.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/b0/78/fe/b078fe5397518bce073f4406145d9138.jpg"all="Camisa Veraniega">
                <h3>Camisa Veraniega</h3>
                <p>Camisa con un diseño que combina palmeras estampadas en un material de seda.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/ba/43/2f/ba432f44d867fa0399b671049f3cfb5d.jpg"all="Camisa Tropical">
                <h3>Camisa Tropical</h3>
                <p>Camisa con un diseño que combina detalles estampados en un material de seda.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/ca/1d/4c/ca1d4cc68fdabfc9ab1222e2dea76786.jpg"all="Camisa Militar Casual">
                <h3>Camisa Militar Casual</h3>
                <p>Camisa con un diseño sencillo y detalles en los bolsillos, hecho de lino.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/34/71/58/347158882cf395f9b43df634d34bf7fa.jpg"all="Camisa con corte elegante">
                <h3>Camisa con corte elegante</h3>
                <p>Camisa con un diseño que combina detalles en botones y un corte elegante, hecho de lino.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/19/5d/32/195d32a53c3a74c80b59c53ae58d0749.jpg"all="Camisa Casual de Manga Corta">
                <h3>Camisa Casual de Manga Corta</h3>
                <p>Camisa de manga corta y con un diseño sencillo, hecho de lino, ideal para días cálidos.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/7c/3b/b4/7c3bb4f58bd7f01dfb4a6de61eb63e58.jpg"all="Camisa Estilo Moderno">
                <h3>Camisa Formal</h3>
                <p>Camisa de manga larga, ideal para un estilo formal o de negocios, hecho de algodón de tejido fino.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/39/8f/e5/398fe58817656884a0bf1822e49939a7.jpg"all="Camisa en Nudo">
                <h3>Camisa en Nudo</h3>
                <p>Camisa estilo contemporáneo, con un diseño distintivo que incluye elementos en forma de nudos.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/3c/67/8d/3c678dd7111c50a5b5e0e030fda4ac7d.jpg"all="Camisa Estilo Casual con Detalles">
                <h3>Camisa Estilo Casual con Detalles</h3>
                <p>Camisas con un diseño sencillo que destaca por los botones en la parte superior del pecho.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/c7/c2/c6/c7c2c695ac624a744a6d3c28c4f0fb78.jpg"all="Camisa con Diseño Asimétrico">
                <h3>Camisa con Diseño Asimétrico</h3>
                <p>Camisa con un diseño único que combina una mitad con estampado floral y la otra de color sólido.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/97/48/41/97484107b85ce0d1ab72d5e1551c12d8.jpg"all="Camisa con Efecto Degradado">
                <h3>Camisa con Efecto Degradado</h3>
                <p>Camisa de estilo veraniego con un diseño de color degradado con cuello en V hecho de lino.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/c9/dd/24/c9dd2455f7923004ca35231201bd8e63.jpg"all="Camisa de Cuadros Texturizados">
                <h3>Camisa de Cuadros Texturizados</h3>
                <p>Camisa de manga larga con un diseño de parches de diferentes colores y texturas formando un patrón de cuadros.</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/d4/be/96/d4be962d6f76e83d8e2d58a0ac00119f.jpg"all="Camisa con Efecto de Ondas">
                <h3>Camisa con Efecto de Ondas</h3>
                <p>Camisa de estilo casual con un patrón de ondas horizontales y un efecto degradado hecho de mezcla de algodón y lino.</p>
            </div>
        </div>

    </body>
</html>
