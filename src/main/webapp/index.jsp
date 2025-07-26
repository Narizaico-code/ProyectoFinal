<%-- 
    Document   : index.jsp
    Created on : 20/07/2025, 01:42:45
    Author     : Angel Geovanny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f0f0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container-buttons {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .container-buttons h1 {
            margin-bottom: 30px;
            font-size: 2.5rem;
        }

        .btn-custom {
            width: 200px;
            height: 60px;
            font-size: 1.2rem;
            margin: 10px;
        }
    </style>
</head>

<body>
    <div class="container-buttons">
        <h1>¡Bienvenido!</h1>
        <a href="registrarse.jsp">
            <button class="btn btn-success btn-custom">Registrar</button>
        </a>
        <a href="login.jsp">
            <button class="btn btn-primary btn-custom">Login</button>
        </a>
    </div>
</body>

</html>
