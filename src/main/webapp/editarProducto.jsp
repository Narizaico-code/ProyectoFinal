<%-- Document : editarProducto.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Productos"%>
<%
    Productos producto = (Productos) request.getAttribute("producto");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
<link rel="stylesheet" href="style/extra.css">
</head>

<body>
    <a href="index.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a menú principal"></a>

    <div class="container mt-4">
        <form action="<%=request.getContextPath()%>/ServletEditarProducto" method="post">
            <input type="hidden" name="accion" value="actualizar">
            <input type="hidden" name="id" value="<%=producto.getIdProducto()%>">

            <div class="mb-3">
                <label for="nombreProducto" class="form-label">Nombre del producto</label>
                <input type="text" class="form-control" id="nombreProducto" name="nombreProducto"
                       value="<%=producto.getNombreProducto()%>">
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"><%=producto.getDescripcion()%></textarea>
            </div>

            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="number" step="0.01" class="form-control" id="precio" name="precio"
                       value="<%=producto.getPrecio()%>">
            </div>

            <div class="mb-3">
                <label for="stock" class="form-label">Stock</label>
                <input type="number" class="form-control" id="stock" name="stock" value="<%=producto.getStock()%>">
            </div>

            <div class="mb-3">
                <label for="talla" class="form-label">Talla</label>
                <input type="text" class="form-control" id="talla" name="talla" value="<%=producto.getTalla()%>">
            </div>

            <div class="mb-3">
                <label for="color" class="form-label">Color</label>
                <input type="text" class="form-control" id="color" name="color" value="<%=producto.getColor()%>">
            </div>

            <div class="mb-3">
                <label for="idMarca" class="form-label">ID Marca</label>
                <input type="number" class="form-control" id="idMarca" name="idMarca" value="<%=producto.getIdMarca()%>">
            </div>

            <div class="mb-3">
                <label for="idCategoria" class="form-label">ID Categoría</label>
                <input type="number" class="form-control" id="idCategoria" name="idCategoria"
                       value="<%=producto.getIdCategoria()%>">
            </div>

            <div class="mb-3">
                <label for="imagenURL" class="form-label">URL de Imagen</label>
                <input type="text" class="form-control" id="imagenURL" name="imagenURL"
                       value="<%=producto.getImagenURL()%>">
            </div>

            <div class="mb-3">
                <label for="fechaIngreso" class="form-label">Fecha de Ingreso</label>
                <input type="datetime-local" class="form-control" id="fechaIngreso" name="fechaIngreso"
                       value="<%=producto.getFechaIngresoLocalDateTime()%>">
            </div>

            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <select class="form-select" name="estado" id="estado">
                    <option value="activo" <%= producto.getEstado().equals("activo") ? "selected" : ""%>>Activo</option>
                    <option value="inactivo" <%= producto.getEstado().equals("inactivo") ? "selected" : ""%>>Inactivo</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="idProveedor" class="form-label">ID Proveedor</label>
                <input type="number" class="form-control" id="idProveedor" name="idProveedor"
                       value="<%=producto.getIdProveedor()%>">
            </div>

            <input type="submit" value="Actualizar" class="btn btn-primary">
            <a href="ServletListarProducto?accion=listar" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
            crossorigin="anonymous"></script>
</body>
</html>
