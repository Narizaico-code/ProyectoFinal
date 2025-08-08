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
        <title>Tienda de Suéteres</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
              crossorigin="anonymous">
        <link rel="stylesheet" href="style/extra.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>sueteres</title>
        <link rel="stylesheet" href="style/sueteres.css">

    </head>
    <body>
        <div class="nav-links">
            <a href="menuPrincipal.jsp">Regresar</a>
  
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/a2/df/16/a2df16ff43493c295c3f346e8c7163a6.jpg" alt="Sudadera Manga Larga">
            <h3>Sudadera Con Manga Larga</h3>
            <p>Sudadera manga larga color morado</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/2e/e6/83/2ee6838c0ca61f984636a7473875f7eb.jpg" alt="Sudadera de Stitch">
            <h3>Sudadera de Stitch</h3>
            <p>Sudadera con capucha de graffiti urbano con personajes de Stitch y detalles neón</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/34/69/b8/3469b86182fb37cbd28c82ac49c3381b.jpg" alt="Suéter de Dragon Ball">
            <h3>Suéter de Dragon Ball</h3>
            <p>Sudadera suéter de anime Dragon Ball</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/d3/47/69/d34769d78df2e872fbc2994be628c1b0.jpg" alt="Suéter Daisy y Yankees">
            <h3>Suéter de Daisy y Yankees</h3>
            <p>Suéter lila con diseño único</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/d9/f2/6f/d9f26f4016717e9d36a8abc6efef29c8.jpg" alt="Suéter Daisy y Yankees">
            <h3>Suéter de Rugrats</h3>
            <p>Suéter  de la serie Rugrats</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/6c/6f/6f/6c6f6f17b5fb5a090b0f3d6b9e6bec8e.jpg" alt="Suéter Daisy y Yankees">
            <h3>Suéter de carlitos rugrats</h3>
            <p>Suéter  de la serie Rugrats</p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/e4/98/cc/e498cc4bc14ba44a2b696f1d1fab9f46.jpg" alt="Suéter Daisy y Yankees">
            <h3>Suéter de  carro Toyota Supra</h3>
            <p>Suéter  de Toyota Supra  </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/55/c4/e4/55c4e457e051b552de3140ed04143386.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter  </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/55/e8/2f/55e82fe6ec5def4dd4d572fef98beb40.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter Ferrari </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/fa/73/36/fa733644ecbf16931a55857f9d374a0c.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter  Ktm </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/8f/49/ff/8f49ff4cfd1bfeba32b6e3877fd2b5af.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de one piece </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/1200x/3d/66/fa/3d66fac7da32baf0ebf0f8eb37a9f45f.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Nasa </h3>
            <p>Suéter  de Nasa    </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/91/1e/6c/911e6c28a10918cbbdb490e689debcf5.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Moto Kawasaki </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/f1/04/a0/f104a0aae3bc89f61bc6f03992187e09.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Yamaha  </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/3f/23/70/3f237063f047d025cedfd009cd79d8f3.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Moto Panigale </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/c4/a5/e7/c4a5e74eb95e04465254e7ee6c54e5b6.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Porshe </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/e9/55/8e/e9558ed36912254c84f083445c290d15.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Bmw M4 </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/00/5a/4b/005a4b652e8675eea9dd859281efc700.jpg"all="Suéter Daisy y Yankees">
            <h3>Suéter de Jeep  </h3>
            <p>Suéter      </p>
        </div>
        <div class="card">
            <img src="https://i.pinimg.com/736x/35/79/69/357969fc831ef8a9566b273f8e42fcb9.jpg"all="Suéter Daisy y Yankees">
            <h3>Sudadero Fox </h3>
            <p>Sudadero      </p>
        </div>
    </div>

</body>
</html>