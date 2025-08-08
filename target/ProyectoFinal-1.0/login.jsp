<%-- Document : login Created on : 20/07/2025, 01:45:28 Author : Angel Geovanny --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Iniciar Sesión</title>
        <style>

            .form-Inicio {
                width: 320px;
                border-radius: 0.75rem;
                background-color: rgba(17, 24, 39, 1);
                padding: 2rem;
                color: rgba(243, 244, 246, 1);
            }

            .title {
                text-align: center;
                font-size: 1.5rem;
                line-height: 2rem;
                font-weight: 700;
            }

            .form {
                margin-top: 1.5rem;
            }

            .entrada{
                margin-top: 0.25rem;
                font-size: 0.875rem;
                line-height: 1.25rem;
            }

            .entrada label {
                display: block;
                color: rgba(156, 163, 175, 1);
                margin-bottom: 4px;
            }

            .entrada input {
                width: 100%;
                border-radius: 0.375rem;
                border: 1px solid rgba(55, 65, 81, 1);
                outline: 0;
                background-color: rgba(17, 24, 39, 1);
                padding: 0.75rem 1rem;
                color: rgba(243, 244, 246, 1);
            }

            .entrada input:focus {
                border-color: rgba(167, 139, 250);
            }

            .forgot {
                display: flex;
                justify-content: flex-end;
                font-size: 0.75rem;
                line-height: 1rem;
                color: rgba(156, 163, 175,1);
                margin: 8px 0 14px 0;
            }

            .forgot a,.Regístrate a {
                color: rgba(243, 244, 246, 1);
                text-decoration: none;
                font-size: 14px;
            }

            .forgot a:hover, .Regístrate a:hover {
                text-decoration: underline rgba(167, 139, 250, 1);
            }

            .Ingresar {
                display: block;
                width: 100%;
                background-color: rgba(167, 139, 250, 1);
                padding: 0.75rem;
                text-align: center;
                color: rgba(17, 24, 39, 1);
                border: none;
                border-radius: 0.375rem;
                font-weight: 600;
                cursor: pointer;
            }

            .alert {
                background: #ffdddd;
                padding: 0.5rem;
                margin-bottom: 1rem;
                border-left: 4px solid #f44336;
                color: #a94442;
            }
        </style>
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