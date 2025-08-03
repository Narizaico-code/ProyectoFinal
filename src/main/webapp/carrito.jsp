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
                font-size: 28px;
                text-align: center;
                flex-grow: 1;
            }

            .acciones {
                display: flex;
                gap: 10px;
            }

            main {
                display: flex;
                justify-content: space-between;
                padding: 20px;
            }

            .carrito {
                width: 70%;
            }

            .producto {
                display: flex;
                align-items: center;
                justify-content: space-between;
                border-bottom: 1px solid #ccc;
                padding: 15px 0;
            }

            .producto img {
                height: 80px;
                margin-right: 20px;
            }

            .producto-info {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .resumen {
                width: 25%;
                border: 1px solid #ccc;
                padding: 20px;
                border-radius: 8px;
            }

            input[type="number"] {
                width: 60px;
                padding: 5px;
            }

            .boton {
                background-color: orange;
                color: white;
                padding: 10px;
                border: none;
                width: 100%;
                font-size: 16px;
                cursor: pointer;
            }

            .boton:hover {
                background-color: darkorange;
            }

            .subtotal {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <header>
            <img src="imagenes/logo.png" alt="Logo Stillz" class="logo">
            <div class="titulo">Mi Carrito de Compras</div>
            <div class="acciones">
                <form action="menuPrincipal.jsp">
                    <button type="submit">Volver</button>
                </form>
                <form action="cerrarSesion.jsp" method="post">
                    <button type="submit">Cerrar Sesión</button>
                </form>
            </div>
        </header>
        <main>
            <div class="carrito">
                <form action="actualizarCarrito.jsp" method="post">

                    <!-- Producto 1 -->
                    <div class="producto">
                        <img src="https://cdn.palbincdn.com/users/51066/images/PFM0_STTU759_C002-1703171613.jpg" alt="Camiseta">
                        <div class="producto-info">
                            <strong>Camiseta</strong>
                            <span>Talla: SM</span>
                            <span>Q50</span>
                        </div>
                        <input type="number" name="cantidad1" value="1" min="1">
                        <span class="subtotal">Q50</span>
                    </div>

                    <!-- Producto 2 -->
                    <div class="producto">
                        <img src="https://www.progresivajeans.com/cdn/shop/products/7.1.1_SUE199_MOSTAZA_SUETER_TEJIDO_CUELLO_REDONDO_A.jpg?v=1630960088&width=1080" alt="sueeter">
                        <div class="producto-info">
                            <strong>Sueter</strong>
                            <span>Q50</span>
                        </div>
                        <input type="number" name="cantidad2" value="1" min="1">
                        <span class="subtotal">Q50</span>
                    </div>
                    <button type="submit" class="boton">Actualizar Cantidades</button>
                </form>
            </div>
            <div class="resumen">
                <h3>Detalle Total</h3>
                <p>Total: <strong> Q100</strong></p>
                <hr>
                <p><strong>TOTAL: Q100</strong></p>
                <form action="procesarCompra.jsp" method="post">
                    <button class="boton">Realizar Pedido</button>
                </form>
            </div>
        </main>
    </body>
</html>
