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
    <style>
        :root {
            --fondo-oscuro: #0F1A2B;
            --fondo-panel: #283648;
            --texto-primario: #FFFFFF;
            --texto-secundario: #CCCCCC;
            --dorado: #8C6E3F;
            --dorado-hover: #A88C5E;
            --llama-naranja: #E0701F;
            --llama-naranja-hover: #C25C18;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--fondo-oscuro);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
            flex-direction: column;
            color: var(--texto-primario);
            box-sizing: border-box;
        }

        /* Botón de regreso */
        .a {
            position: absolute;
            top: 25px;
            left: 25px;
            z-index: 1000;
        }

        .a img {
            width: 45px;
            height: 45px;
            border-radius: 8px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.4);
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            background-color: #ffffff;
            padding: 8px;
        }

        .a img:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.6);
        }

        /* Contenedor principal del login */
        .login-container {
            background-color: var(--fondo-panel);
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(255, 215, 0, 0.2);
            border: 1px solid var(--dorado);
            width: 100%;
            max-width: 400px;
            text-align: center;
            box-sizing: border-box;
            color: var(--texto-primario);
        }

        h2 {
            color: var(--dorado);
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: bold;
        }

        /* Alertas */
        .alert {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            font-size: 14px;
            text-align: left;
        }

        .alert-danger {
            background-color: #ffcccc;
            color: #cc0000;
            border: 1px solid #ff9999;
        }

        /* Formulario */
        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--dorado);
            border-radius: 8px;
            font-size: 16px;
            background-color: #ffffff;
            color: #333333;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: #888888;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: var(--dorado-hover);
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(140, 110, 63, 0.4);
        }

        /* Sección de contraseña + checkbox */
        .section {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
            justify-content: space-between;
        }

        .section input[type="password"] {
            flex-grow: 1;
        }

        .section input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
            flex-shrink: 0;
            margin-left: 0;
            vertical-align: middle;
            accent-color: var(--llama-naranja);
        }

        /* Botón de login */
        input[type="submit"] {
            background-color: var(--llama-naranja);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: var(--llama-naranja-hover);
            transform: translateY(-2px);
        }

        /* Responsivo */
        @media (max-width: 600px) {
            .login-container {
                padding: 25px 30px;
                margin: 0 15px;
            }

            h2 {
                font-size: 24px;
                margin-bottom: 20px;
            }

            input[type="email"],
            input[type="password"],
            input[type="submit"] {
                padding: 10px 12px;
                font-size: 15px;
            }

            .a {
                top: 15px;
                left: 15px;
            }

            .a img {
                width: 40px;
                height: 40px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            }
        }

    </style>
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