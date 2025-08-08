<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <!-- Agregado: formulario para búsqueda y filtros -->
                    <form action="${pageContext.request.contextPath}/camisas" method="get">
                        <input placeholder="Buscar..." type="text" name="busqueda" class="input" value="${param.busqueda != null ? param.busqueda : ''}" />
                        <!-- Ejemplo filtros simples -->
                        <label><input type="radio" name="talla" value="S" ${param.talla == 'S' ? 'checked' : ''} /> S</label>
                        <label><input type="radio" name="talla" value="M" ${param.talla == 'M' ? 'checked' : ''} /> M</label>
                        <label><input type="radio" name="talla" value="L" ${param.talla == 'L' ? 'checked' : ''} /> L</label>
                        <label><input type="radio" name="talla" value="" ${param.talla == null || param.talla == '' ? 'checked' : ''} /> Todas</label>

                        <label><input type="radio" name="color" value="rojo" ${param.color == 'rojo' ? 'checked' : ''} /> Rojo</label>
                        <label><input type="radio" name="color" value="azul" ${param.color == 'azul' ? 'checked' : ''} /> Azul</label>
                        <label><input type="radio" name="color" value="" ${param.color == null || param.color == '' ? 'checked' : ''} /> Todos</label>

                        <button type="submit">Filtrar</button>
                    </form>

                    <div id="input-mask"></div>
                    <div id="pink-mask"></div>
                    <div class="filterBorder"></div>
                    <div id="filter-icon">
                        <!-- SVG filtro aquí -->
                    </div>
                    <div id="search-icon">
                        <!-- SVG búsqueda aquí -->
                    </div>
                </div>
            </div>
        </div>
        <div class="productos">
            <!-- Agregado: iterar sobre listaCamisas -->
            <c:forEach var="producto" items="${listaCamisas}">
                <div class="card">
                    <img src="${producto.imagenUrl}" alt="${producto.nombreProducto}">
                    <h3>${producto.nombreProducto}</h3>
                    <p>${producto.descripcion}</p>
                    <p>Precio: Q${producto.precio}</p>

                    <!-- Botón para agregar al carrito -->
                    <form action="${pageContext.request.contextPath}/carrito" method="post">
                        <input type="hidden" name="idProducto" value="${producto.idProducto}" />
                        <button type="submit">Agregar al carrito</button>
                    </form>
                </div>
            </c:forEach>

            <!-- Si quieres mantener las tarjetas fijas del ejemplo, déjalas aquí abajo -->
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