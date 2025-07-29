<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Carrito</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #2c3e50;
                color: white;
                padding: 20px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .logo {
                height: 50px;
            }
            .titulo {
                font-size: 32px;
                text-align: center;
                flex-grow: 1;
            }
            .acciones {
                display: flex;
                gap: 10px;
            }
            .acciones form {
                display: inline;
            }
            main {
                padding: 20px;
            }
            .formulario-carrito {
                max-width: 600px;
                margin: auto;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 10px;
            }
            .formulario-carrito input[type="text"],
            .formulario-carrito input[type="number"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
            }
            .formulario-carrito button {
                padding: 10px 20px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>

        <header>
            <img src="imagenes/logo.png" alt="Logo Stillz" class="logo">
            <div class="titulo">Carrito</div>
            <div class="acciones">
                <form action="menuPrincipal.jsp" method="get">
                    <button type="submit">volver</button>
                </form>
                <form action="cerrarSesion.jsp" method="post">
                    <button type="submit">Cerrar la sesion</button>
                </form>
            </div>
        </header>

        <main>
            <div class="formulario-carrito">
                <h2>Detalle de pedido</h2>
                <form action="procesarCompra.jsp" method="post">
                    <label for="producto">Producto:</label>
                    <input type="text" id="producto" name="producto" required>

                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" name="cantidad" min="1" required>

                    <label for="direccion">direccion de envio:</label>
                    <input type="text" id="direccion" name="direccion" required>

                    <button type="submit">Hacer Compra</button>
                </form>
            </div>
        </main>

    </body>
</html>
