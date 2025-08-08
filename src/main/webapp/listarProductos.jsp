<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
          crossorigin="anonymous">
          
     <style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #0d1b2a;
        color: #f1f1f1;
    }

    h1 {
        text-align: center;
        margin-top: 30px;
        margin-bottom: 20px;
    }

    /* Imagen menú con fondo oscuro */
    .menu {
        width: 128px;
        height: auto;
        display: block;
        margin: 15px 20px;
    }

    /* Formulario */
    form {
        width: 50%;
        margin: 0 auto 30px auto;
        padding: 20px;
        border-radius: 10px;
        background-color: #1b263b;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    }

    input {
        width: 96%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #444;
        border-radius: 5px;
        background-color: #0d1b2a;
        color: #f1f1f1;
    }

    input::placeholder {
        color: #bbb;
    }

    /* Botones */
    .btn-add {
        background-color: #3b82f6;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        margin-top: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .btn-add:hover {
        background-color: #2563eb;
    }

    .btn {
        padding: 5px 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .btn-edit {
        background-color: #fbbf24;
        color: #1b263b;
    }
    .btn-edit:hover {
        background-color: #f59e0b;
        color: #111;
    }
    .btn-delete {
        background-color: #ef4444;
        color: white;
    }
    .btn-delete:hover {
        background-color: #dc2626;
    }

    /* Tabla */
    table {
        width: 98%;
        margin: auto;
        border-collapse: collapse;
        background-color: #1b263b;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        color: #f1f1f1;
    }
    th, td {
        border: 1px solid #0d1b2a;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #16213e;
        color: #f1f1f1;
    }
    tbody tr:nth-child(even) {
        background-color: #142850;
    }
    tbody tr:hover {
        background-color: #1f4068;
    }
</style>
</style>

</head>

<body>
<!-- Menú con la imagen, en un contenedor para fondo oscuro -->
<div class="menu-container">
   <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>
</div>

<div class="container mt-4">
    <h2 class="text-center mb-4">Listado de Productos</h2>
    <a href="registroProducto.jsp" class="btn btn-primary mb-3">Agregar Producto</a>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>ID Proveedor</th>
            <th>ID Marca</th>
            <th>ID Categoría</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Talla</th>
            <th>Color</th>
            <th>Imagen</th>
            <th>Fecha Ingreso</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Productos> listaProductos = (List<Productos>) request.getAttribute("listaProductos");
            if (listaProductos != null && !listaProductos.isEmpty()) {
                for (Productos producto : listaProductos) {
        %>
        <tr>
            <td><%=producto.getIdProducto()%></td>
            <td><%=producto.getIdProveedor()%></td>
            <td><%=producto.getIdMarca()%></td>
            <td><%=producto.getIdCategoria()%></td>
            <td><%=producto.getNombreProducto()%></td>
            <td><%=producto.getDescripcion()%></td>
            <td>Q.<%=producto.getPrecio()%></td>
            <td><%=producto.getStock()%></td>
            <td><%=producto.getTalla()%></td>
            <td><%=producto.getColor()%></td>
            <td><img src="<%=producto.getImagenURL()%>" width="80" alt="imagen"></td>
            <td><%=producto.getFechaIngreso()%></td>
            <td><%=producto.getEstado()%></td>
            <td>
                <a href="<%=request.getContextPath()%>/ServletEditarProducto?accion=editar&id=<%=producto.getIdProducto()%>"
                   class="btn btn-warning btn-sm">Editar</a>
                <a href="<%=request.getContextPath()%>/ServletEliminarProducto?id=<%=producto.getIdProducto()%>"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('¿Desea eliminar este producto?')">Eliminar</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="14" class="text-center">No hay productos registrados</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>
</html>
