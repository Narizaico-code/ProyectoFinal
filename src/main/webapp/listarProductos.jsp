<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <link rel="stylesheet" href="style/listarProductos.css">

    <style>
        /* General body and container styles for dark theme */
body {
    background-color: #1a2035; /* Dark blue background color */
    color: #e0e0e0; /* Light gray text color */
    font-family: Arial, sans-serif;
}

.container {
    padding-top: 20px;
}

/* Styles for the main heading */
.text-center {
    color: #ffffff; /* White color for the heading */
}

/* Styles for the "Add Product" button */
.btn-primary {
    background-color: #4a5568; /* A slightly lighter dark gray for the button */
    border-color: #4a5568;
    color: #e0e0e0;
}

.btn-primary:hover {
    background-color: #6a748a; /* A lighter shade on hover */
    border-color: #6a748a;
}

/* Styles for the table itself */
.table {
    background-color: #2d3748; /* Darker blue-gray for the table body */
    color: #e0e0e0; /* Light gray text for table content */
    border-collapse: collapse; /* Ensure borders collapse for a clean look */
    width: 100%;
}

/* Styles for the table header */
.table-dark thead {
    background-color: #1a2035; /* The same dark blue as the body */
    color: #ffffff; /* White text for the header */
}

.table-dark th {
    border-color: #4a5568; /* Border color for the header cells */
    padding: 12px 15px;
    text-align: left;
}

/* Styles for the table body rows and cells */
.table tbody tr {
    border-bottom: 1px solid #4a5568; /* Separator for rows */
}

.table td {
    padding: 12px 15px;
    border-top: 1px solid #4a5568;
}

/* Specific styles for the action buttons */
.btn-warning {
    background-color: #ffc107; /* Standard warning color */
    border-color: #ffc107;
    color: #212529; /* Dark text for contrast */
}

.btn-danger {
    background-color: #dc3545; /* Standard danger color */
    border-color: #dc3545;
    color: #ffffff;
}

/* Style for the "No products registered" message */
.text-center[colspan="14"] {
    color: #a0aec0; /* A slightly lighter gray for this message */
}

/* Styles for the menu link at the top */
.menu-container {
    background-color: #1a2035;
    padding: 10px;
    text-align: left;
}

.menu-container img {
    filter: invert(100%); /* Inverts the color of the image to make it white */
}
        
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
