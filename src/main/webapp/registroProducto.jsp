<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
        crossorigin="anonymous">
    <style>
        .menu {
            width: 128px;
            height: auto;
        }
    </style>
</head>

<body>
    <a href="index.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a menú principal"></a>

    <div class="container">
        <h1>Registrar Producto</h1>
        <form action="ServletProductos" method="post">
            <input type="hidden" name="accion" value="guardar">

            <div class="mb-3">
                <label for="idProveedor" class="form-label">ID Proveedor</label>
                <input type="number" id="idProveedor" name="idProveedor" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="idMarca" class="form-label">ID Marca</label>
                <input type="number" id="idMarca" name="idMarca" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="idCategoria" class="form-label">ID Categoría</label>
                <input type="number" id="idCategoria" name="idCategoria" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="nombreProducto" class="form-label">Nombre del Producto</label>
                <input type="text" id="nombreProducto" name="nombreProducto" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea id="descripcion" name="descripcion" class="form-control"></textarea>
            </div>

            <div class="mb-3">
                <label for="precio" class="form-label">Precio</label>
                <input type="number" step="0.01" id="precio" name="precio" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="stock" class="form-label">Stock</label>
                <input type="number" id="stock" name="stock" class="form-control" value="0" min="0">
            </div>

            <div class="mb-3">
                <label for="talla" class="form-label">Talla</label>
                <input type="text" id="talla" name="talla" class="form-control">
            </div>

            <div class="mb-3">
                <label for="color" class="form-label">Color</label>
                <input type="text" id="color" name="color" class="form-control">
            </div>

            <div class="mb-3">
                <label for="imagenURL" class="form-label">Imagen (URL)</label>
                <input type="text" id="imagenURL" name="imagenURL" class="form-control">
            </div>

            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <select name="estado" id="estado" class="form-control">
                    <option value="activo" selected>Activo</option>
                    <option value="inactivo">Inactivo</option>
                </select>
            </div>

            <input type="submit" value="Registrar Producto" class="btn btn-primary">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>
</html>
