<%-- 
    Document   : pantalones
    Created on : 6/08/2025, 23:06:04
    Author     : ricar
--%>

<%@page import="model.Productos"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductoDAO" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultados para Camisas</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: 100%;
                margin: 0 auto;
                padding: 20px;
                background-color: #f5f5f5;
            }

            h1 {
                color: #333;
                border-bottom: 1px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .nav-links {
                margin-bottom: 20px;
            }

            .nav-links a {
                text-decoration: none;
                color: #2a6496;
                font-weight: bold;
                padding: 5px 10px;
                border-radius: 4px;
                background-color: #e0e0e0;
            }

            .busqueda-form {
                margin-bottom: 30px;
                display: flex;
                justify-content: center;
                gap: 10px;
            }


            .busqueda-form input[type="text"] {
                padding: 10px;
                width: 70%;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
            }

            .busqueda-form button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .busqueda-form button:hover {
                background-color: #45a049;
            }

            .productos-grid {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
            }

            .producto-card {
                background-color: white;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 15px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                transition: transform 0.3s ease;
            }

            .producto-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .producto-imagen {
                text-align: center;
                margin-bottom: 15px;
            }

            .producto-imagen img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-radius: 5px;
            }

            .producto-nombre {
                font-weight: bold;
                font-size: 1.1em;
                color: #444;
                margin-bottom: 8px;
            }

            .producto-descripcion {
                color: #666;
                font-size: 0.9em;
                margin-bottom: 10px;
                min-height: 40px;
            }

            .producto-precio {
                color: #2a6496;
                font-weight: bold;
                font-size: 1.2em;
                margin: 10px 0;
            }

            .producto-talla {
                margin: 10px 0;
                font-size: 0.9em;
            }

            .talla-actual {
                font-weight: bold;
            }

            .tallas-disponibles {
                display: flex;
                gap: 8px;
                margin: 10px 0;
                flex-wrap: wrap;
            }

            .talla-opcion {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
                cursor: pointer;
                font-size: 0.8em;
            }

            .talla-opcion:hover {
                background-color: #f0f0f0;
            }

            .boton-comprar {
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 1em;
                margin-top: 10px;
            }

            .boton-comprar:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="nav-links">
            <a href="menuPrincipal.jsp">Regresar</a>
        </div>

        <div class="busqueda-form">
            <form method="get" action="ServletCamisas">
                <input type="text" name="query" placeholder="Buscar..." />
                <button type="submit">Buscar</button>
            </form>
        </div>

        <h1>Resultados para Camisas</h1>

        <div class="productos-grid">

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/4f/df/89/4fdf898eed5d37f567b43d60688e1dbe.jpg" alt="Camisa Básica">
                </div>
                <div class="producto-nombre">pantalon de  lona  </div>
                <div class="producto-descripcion">pantalon de lona con detalles negros</div>
                <div class="producto-precio">$25.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/20/63/ad/2063adda1f742f988aec3cfaaa1bc1ce.jpg" alt="Camisa Básica">
                </div>
                <div class="producto-nombre">Pantalon de lona </div>
                <div class="producto-descripcion">Pantalo con colaboracion de harry poter </div>
                <div class="producto-precio">$15.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/7d/9e/ed/7d9eedf6d0c700041dc733a395f58e80.jpg" alt="Sudadero Kawasaki">
                </div>
                <div class="producto-nombre">Pantalo de lona de garfield </div>
                <div class="producto-descripcion"></div>
                <div class="producto-precio">$35.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/14/7d/ef/147defd738c61c27c1477987437f6ac9.jpg" alt="Suéter Ducati">
                </div>
                <div class="producto-nombre">pantalón de lona de Itachi</div>
                <div class="producto-descripcion">Color rojo</div>
                <div class="producto-precio">$45.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/82/33/09/823309fc1fd325d8243fdcee4a3eeb1f.jpg" alt="Suéter KTM">
                </div>
                <div class="producto-nombre">pantalón de lona de One Piece</div>
                <div class="producto-descripcion">pantalón de lona de One Piece</div>
                <div class="producto-precio">$25.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/cd/0c/c2/cd0cc2e1951505c92e3ab081ab4361f8.jpg" alt="Suéter Fox">
                </div>
                <div class="producto-nombre">pantalón de lona normal</div>
                <div class="producto-descripcion">pantalón de lona </div>
                <div class="producto-precio">10.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/e4/08/f4/e408f40084fdf30662566eefac1b9ba5.jpg" alt="Suéter Fox">
                </div>
                <div class="producto-nombre">pantalón de lona negro</div>
                <div class="producto-descripcion">color negro </div>
                <div class="producto-precio">$11.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/fb/4c/46/fb4c4695f5e3fe5f981db744d16eeff3.jpg" alt="Suéter Honda">
                </div>
                <div class="producto-nombre">pantalón de lona con cruces</div>
                <div class="producto-descripcion">pantalón de lona con cruces blancas</div>
                <div class="producto-precio">$17.50</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/1d/eb/c1/1debc18b03f8c2c47693086a2a3db115.jpg" alt="Suéter Honda">
                </div>
                <div class="producto-nombre">pantalón de lona con llamas negras</div>
                <div class="producto-descripcion">pantalón de lona con llamas negras</div>
                <div class="producto-precio">$40.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/05/59/e2/0559e29c2cda3d62977a568deb1eec9d.jpg" alt="Suéter Cherry">
                </div>
                <div class="producto-nombre">pantalón de lona con retazos negros</div>
                <div class="producto-descripcion">pantalón de lona con retazos negros</div>
                <div class="producto-precio">$18.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/b1/5c/49/b15c49d4fc07255c153e4254256d0468.jpg" alt="Suéter Cherry">
                </div>
                <div class="producto-nombre">pantalón de lona azul con flores</div>
                <div class="producto-descripcion">pantalón de lona azul con flores</div>
                <div class="producto-precio">$25.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/23/aa/ac/23aaac5db2816530a2d632d91674435b.jpg" alt="Suéter Be Yourself">
                </div>
                <div class="producto-nombre">pantalón de lona</div>
                <div class="producto-descripcion">pantalón de lona de Disney</div>
                <div class="producto-precio">$55.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/0f/2a/3d/0f2a3dfca4c5f958cbce26631706c416.jpg" alt="Sudadera Be Yourself">
                </div>
                <div class="producto-nombre">pantalón de lona de Las Chicas Superpoderosas</div>
                <div class="producto-descripcion">pantalón de lona de Las Chicas Superpoderosas</div>
                <div class="producto-precio">$15</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/08/25/fc/0825fcf46a979194689408ed8bf41db2.jpg" alt="Suéter Capibara">
                </div>
                <div class="producto-nombre">pantalón de lona</div>
                <div class="producto-descripcion">pantalón de lona con los personajes de Disney</div>
                <div class="producto-precio">$55.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/08/66/cd/0866cde915b75efed50e3bedc8bf8fd9.jpg" alt="Suéter Labubus">
                </div>
                <div class="producto-nombre">pantalón de lona de La Sirenita</div>
                <div class="producto-descripcion">pantalón de lona de La Sirenitao</div>
                <div class="producto-precio">$35.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/8a/e7/20/8ae72082921a8477c7088591f2cc6568.jpg" alt="Suéter Daisy Duck">
                </div>
                <div class="producto-nombre">pantalón de lona de los personajes cartoon</div>
                <div class="producto-descripcion">pantalón de lona de los personajes cartoon</div>
                <div class="producto-precio">$45.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/fe/cc/28/fecc28b7ccd9b71ce0455e5a0e3aa96a.jpg" alt="Suéter Pantera Rosa">
                </div>
                <div class="producto-nombre">pantalón de lona de Dragon Ball</div>
                <div class="producto-descripcion">pantalón de lona con la Súper esferas del dragón y Goku Blue</div>
                <div class="producto-precio">$11.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/736x/d3/d8/19/d3d819c35115bf21e3e5398b5eedaca9.jpg" alt="Suéter Stich">
                </div>
                <div class="producto-nombre">pantalón de lona de Dragon Ball</div>
                <div class="producto-descripcion"> pantalón de lona con Freezer cell Goku y Gohan</div>
                <div class="producto-precio">$15.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>

            <div class="producto-card">
                <div class="producto-imagen">
                    <img src="https://i.pinimg.com/1200x/ac/59/eb/ac59ebf9d2c96fbea64a4678705ef604.jpg" alt="Suéter Mickey">
                </div>
                <div class="producto-nombre">pantalón de lona de Billy y Mandy</div>
                <div class="producto-descripcion">pantalón de lona de Billy y Mandy</div>
                <div class="producto-precio">$19.99</div>
                <div class="producto-talla">
                    <span class="talla-actual">Talla:</span> L
                </div>
                <div class="tallas-disponibles">
                    <span class="talla-opcion">S</span>
                    <span class="talla-opcion">M</span>
                    <span class="talla-opcion">L</span>
                    <span class="talla-opcion">XL</span>
                </div>
                <button class="boton-comprar">Comprar</button>
            </div>
        </div>

    </body>
</html>