<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
          crossorigin="anonymous">
    <link rel="stylesheet" href="style/resgistroCategoria.css">

</head>
<body>
<div class="container mt-4">
    <h2>Registrar Nueva Categoría</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="ServletAgregarCategoria" method="post">
        <div class="mb-3">
            <label for="nombreCategoria" class="form-label">Nombre de la Categoría:</label>
            <input type="text" id="nombreCategoria" name="nombreCategoria" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Guardar</button>
        <a href="ServletListarCategoria" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
</body>
</html>
