<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Productos"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
              rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
              crossorigin="anonymous">
        <style>
            .menu {
                width: 128px;
                height: auto;
            }
        </style>
    <a href="index.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a menu principal"></a>
</head>

<body>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Listado de Productos</h2>
        <a href="registroProducto.jsp" class="btn btn-primary mb-3">Agregar Producto</a>

        <table class="table table-bordered table-stripe">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Talla</th>
                    <th>Color</th>
                    <th>Marca</th>
                    <th>Categoría</th>
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
                    <td><%=producto.getNombreProducto()%></td>
                    <td><%=producto.getDescripcion()%></td>
                    <td>Q.<%=producto.getPrecio()%></td>
                    <td><%=producto.getStock()%></td>
                    <td><%=producto.getTalla()%></td>
                    <td><%=producto.getColor()%></td>
                    <td><%=producto.getMarca()%></td>
                    <td><%=producto.getCategoria()%></td>
                    <td><img src="<%=producto.getImagenURL()%>" width="80"></td>
                    <td><%=producto.getFechaIngreso()%></td>
                    <td><%=producto.getEstado()%></td>
                    <td>
<a href="<%=request.getContextPath()%>/ServletEditarProducto?accion=editar&id=<%=producto.getIdProducto()%>" class="btn btn-warning btn-sm">Editar</a>
                        <a href="<%=request.getContextPath()%>/ServletEliminarProducto?id=<%=producto.getIdProducto()%>" class="btn btn-danger btn-sm"
                           onclick="return confirm('¿Desea eliminar este producto?')">Eliminar</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td class="text-center" colspan="13">No hay productos registrados</td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
    crossorigin="anonymous"></script>
</body>

</html>
