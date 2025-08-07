/* 
Created on : 29/07/2025, 23:10:52
Author     : ricar
*/

<%@page import="model.Productos"%>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.ProductoDAO" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>sueteres</title>
        <link rel="stylesheet" href="style/sueteres.css">

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
                    <img src="https://i.pinimg.com/1200x/e4/98/cc/e498cc4bc14ba44a2b696f1d1fab9f46.jpg" alt="Camisa Básica">
                </div>
                <div class="producto-nombre">Camisa Básica</div>
                <div class="producto-descripcion">Camisa básica de uso diario, ligera y cómoda.</div>
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
                    <img src="https://i.pinimg.com/1200x/2e/e6/83/2ee6838c0ca61f984636a7473875f7eb.jpg" alt="Camisa Básica">
                </div>
                <div class="producto-nombre">Camisa Básica</div>
                <div class="producto-descripcion">Camisa básica de uso diario, ligera y cómoda.</div>
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
                    <img src="https://i.pinimg.com/736x/91/1e/6c/911e6c28a10918cbbdb490e689debcf5.jpg" alt="Sudadero Kawasaki">
                </div>
                <div class="producto-nombre">Sudadero de Kawasaki</div>
                <div class="producto-descripcion"></div>
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
                    <img src="https://i.pinimg.com/736x/5f/5c/49/5f5c49100ba9a4c8c23715472488e5ef.jpg" alt="Suéter Ducati">
                </div>
                <div class="producto-nombre">Suéter de moto Ducati</div>
                <div class="producto-descripcion">Color rojo.</div>
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
                    <img src="https://i.pinimg.com/736x/fa/73/36/fa733644ecbf16931a55857f9d374a0c.jpg" alt="Suéter KTM">
                </div>
                <div class="producto-nombre">Suéter de KTM</div>
                <div class="producto-descripcion">Suéter negro con naranja</div>
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
                    <img src="https://i.pinimg.com/736x/35/79/69/357969fc831ef8a9566b273f8e42fcb9.jpg" alt="Suéter Fox">
                </div>
                <div class="producto-nombre">Suéter de la marca Fox</div>
                <div class="producto-descripcion">Suéter blanco</div>
                <div class="producto-precio">$65.99</div>
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
                    <img src="https://i.pinimg.com/1200x/63/88/2b/63882b958df62db08b0e3ff12d0c0686.jpg" alt="Suéter Fox">
                </div>
                <div class="producto-nombre">Suéter de la marca Fox</div>
                <div class="producto-descripcion">Suéter rojo</div>
                <div class="producto-precio">$65.99</div>
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
                    <img src="https://i.pinimg.com/1200x/32/f9/89/32f9893bd87771e14e4120c5f2f87029.jpg" alt="Suéter Honda">
                </div>
                <div class="producto-nombre">Suéter de la marca Honda</div>
                <div class="producto-descripcion">Suéter de color rojo con detalles rojos</div>
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
                    <img src="https://i.pinimg.com/1200x/dd/c8/04/ddc804a1751ec96e442201a66ef8f8aa.jpg" alt="Suéter Honda">
                </div>
                <div class="producto-nombre">Suéter de la marca Honda</div>
                <div class="producto-descripcion">Suéter de color blanco</div>
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
                    <img src="https://i.pinimg.com/736x/79/fc/21/79fc21b86e8d007736e0898d7bbacdae.jpg" alt="Suéter Cherry">
                </div>
                <div class="producto-nombre">Suéter de la marca Cherry</div>
                <div class="producto-descripcion">Suéter de color blanco</div>
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
                    <img src="https://i.pinimg.com/736x/73/b7/12/73b7127111b0d40dd78bbc2d79b27192.jpg" alt="Suéter Cherry">
                </div>
                <div class="producto-nombre">Suéter de la marca Cherry</div>
                <div class="producto-descripcion">Suéter de color blanco</div>
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
                    <img src="https://i.pinimg.com/736x/fb/5d/da/fb5dda0ad989d54bac41bd3d90422876.jpg" alt="Suéter Be Yourself">
                </div>
                <div class="producto-nombre">Suéter de la marca Be Yourself</div>
                <div class="producto-descripcion">Suéter de color negro</div>
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
                    <img src="https://i.pinimg.com/1200x/d8/0e/a0/d80ea04af96867d9fc24f4ffe2dfe390.jpg" alt="Sudadera Be Yourself">
                </div>
                <div class="producto-nombre">Sudadera Be Yourself</div>
                <div class="producto-descripcion">Sudadera Con Capucha Y Cordón De Forro Polar Con Estampado De Dibujos Animados</div>
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
                    <img src="https://i.pinimg.com/1200x/45/e0/c1/45e0c15718752d432507f502c3fe8d89.jpg" alt="Suéter Capibara">
                </div>
                <div class="producto-nombre">Suéter de Capibara</div>
                <div class="producto-descripcion">Suéter morado</div>
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
                    <img src="https://i.pinimg.com/1200x/a7/49/30/a74930351f1d3768f51d9f541f75d585.jpg" alt="Suéter Labubus">
                </div>
                <div class="producto-nombre">Suéter de Labubus</div>
                <div class="producto-descripcion">Suéter azul marino</div>
                <div class="producto-precio">$75.99</div>
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
                    <img src="https://i.pinimg.com/736x/d3/47/69/d34769d78df2e872fbc2994be628c1b0.jpg" alt="Suéter Daisy Duck">
                </div>
                <div class="producto-nombre">Suéter de Daisy Duck</div>
                <div class="producto-descripcion">Suéter color morado</div>
                <div class="producto-precio">$85.99</div>
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
                    <img src="https://i.pinimg.com/1200x/47/56/05/475605b883f71bb5818f7bf145ea67cb.jpg" alt="Suéter Pantera Rosa">
                </div>
                <div class="producto-nombre">Suéter de la Pantera Rosa</div>
                <div class="producto-descripcion">Suéter color rosado</div>
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
                    <img src="https://i.pinimg.com/1200x/a9/6a/84/a96a84dfccce386ffab11cb013b0b9fc.jpg" alt="Suéter Stich">
                </div>
                <div class="producto-nombre">Suéter de Stich</div>
                <div class="producto-descripcion">Suéter color violeta</div>
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
                    <img src="https://i.pinimg.com/1200x/8d/19/57/8d1957d94c8413d17c5d3c99be6eb4ad.jpg" alt="Suéter Mickey">
                </div>
                <div class="producto-nombre">Suéter de Mickey</div>
                <div class="producto-descripcion">Suéter sublimado</div>
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