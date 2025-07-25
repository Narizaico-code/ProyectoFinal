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
        .a {
            position: absolute;
            top: 15px;
            left: 15px;
            z-index: 10;
        }

        .a img {
            width: 78px;
            height: auto;
        }

        .a img:hover {
            cursor: pointer;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: rgb(61, 61, 61);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: white;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .section {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        input[type="checkbox"] {
            margin-left: 15px;
        }

        input[type="checkbox"]:hover {
            cursor: pointer;
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