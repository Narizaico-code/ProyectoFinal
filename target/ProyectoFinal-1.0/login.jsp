<%-- Document : login Created on : 20/07/2025, 01:45:28 Author : Angel Geovanny --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
              crossorigin="anonymous">
    <a class="a" href="index.jsp"><img src="images/menu.png" alt="Imagen de regreso a menu"></a>
    <link rel="stylesheet" href="style/index.css">

</head>

<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="alert alert-danger"><%= error%></div>
        <%
            }
        %>
        <form action="ServletLogin" method="post">
            <input type="email" name="correo" placeholder="Correo" required id="correo">
            <section class="section">
                <input type="password" name="contrasena" placeholder="Contraseña" id="password" required>
                <input type="checkbox" onclick="document.getElementById('password').type = this.checked ? 'text' : 'password'">
            </section>
            <input type="submit" value="Ingresar">
        </form>
    </div>

    
</body>
</html>