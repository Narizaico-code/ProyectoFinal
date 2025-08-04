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
        <style>
            /* === Estilos Generales combinados === */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif; /* Mantengo Arial para que sea igual que el primero */
    background-color: #0d1b2a; /* del segundo */
    color: #f1f1f1; /* texto claro del segundo */
}

/* === Menú Superior === */
.menu {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #1b263b; /* del segundo */
    padding: 10px 20px; /* mantengo padding del primero */
    color: white;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.menu .search-bar {
    display: flex;
    align-items: center;
    flex-grow: 1;
    margin-left: 20px;
}

.menu .search-bar img {
    height: 50px; /* tamaño logo del primero */
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 20px; /* un poco más consistente con segundo */
    margin-left: auto; /* para que quede a la derecha */
}

.nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 0; /* elimino margen izquierdo para usar gap */
    font-size: 1.1em;
    font-weight: bold; /* del segundo */
    transition: color 0.3s ease;
}

.nav-links a:hover {
    color: #a9def9; /* color hover del segundo */
}

/* === Sección de tarjetas (tablas) === */
.tablas {
    display: flex;
    justify-content: center;
    gap: 30px; /* intermedia entre 30 y 40 */
    padding: 50px 40px; /* padding unificado */
    flex-wrap: wrap;
}

/* === Tarjetas (card) === */
.card {
    background-color: #1b263b; /* color oscuro del segundo */
    border-radius: 10px; /* del primero */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* sombra del segundo */
    text-align: center;
    width: 300px; /* tamaño ancho del primero */
    min-height: 250px; /* altura mínima del primero */
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    padding: 20px; /* padding del primero */
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
}

.card:hover {
    transform: translateY(-8px); /* efecto hover del segundo */
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4); /* sombra hover del segundo */
}

.card img {
    width: 150px; /* tamaño imagen del primero */
    height: 150px;
    object-fit: cover;
    border-radius: 5px;
    margin-bottom: 15px;
    transition: transform 0.3s ease;
}

.card:hover img {
    transform: scale(1.1);
}

.card h3 {
    margin-top: auto;
    margin-bottom: 0;
    color: #f1f1f1; /* color de texto claro */
    font-size: 1.5em;
}

        </style>
        

    </head>
    <body>
        <div class="menu">
            <div class="espacio"></div>
            <form class="search-bar" action="buscarProductos" method="get">
                <img src="images/Logo.jpg" alt="Logo de la marca">
            </form>

            <div class="nav-links">
                <a href="index.jsp">Regresar</a>
            </div>
        </div>
        
         <div class="tablas">
            <div class="card">
                <a href="ServletListarProducto"> <img src="https://img.icons8.com/?size=100&id=11229&format=png&color=000000" alt="Poductos"></a>
                <h3>Productos</h3>
            </div>
            <div class="card">
                <a href="ServletProveedores"><img src="https://img.icons8.com/?size=100&id=61849&format=png&color=000000" alt="Proveedores"></a>
                <h3>Proveedores</h3>
            </div>
            <div class="card">
                <a href="ServletCliente"> <img src="https://img.icons8.com/?size=100&id=69&format=png&color=000000" alt="Clientes"></a>
                <h3>Clientes</h3>
            </div>
            <div class="card">
                <a href="ServletListarCategoria"> <img src="https://img.icons8.com/?size=100&id=12560&format=png&color=000000" alt="Clientes"></a>
                <h3>Categorias</h3>
            </div>
        </div>
    </body>
</html>
