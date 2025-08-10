<%-- Document : login Created on : 20/07/2025, 01:45:28 Author : Angel Geovanny --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="style/login.css?">
    </head>
    <body style="display: flex; justify-content: center; align-items: center; height: 100vh; background: #111827;">

        <div class="form-Inicio">
            <p class="title">Iniciar Sesión</p>

            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert"><%= error%></div>
            <%
                }
            %>

            <form class="form" action="ServletLogin" method="post">
                <div class="entrada">
                    <label for="correo">Correo</label>
                    <input type="email" name="correo" id="correo" required>
                </div>
                <div class="entrada">
                    <label for="password">Contraseña</label>
                    <input type="password" name="contrasena" id="password" required>
                    <div class="forgot">
                        <input type="checkbox" onclick="document.getElementById('password').type = this.checked ? 'text' : 'password'"> Mostrar
                    </div>
                </div>
                <button type="submit" class="Ingresar">Ingresar</button>
            </form>
            <p class="Regístrate">¿No tienes cuenta?
                <a href="registrarse.jsp">Regístrate</a>
            </p>
        </div>
    </body>
</html>