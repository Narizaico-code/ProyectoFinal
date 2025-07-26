<%-- 
    Document   : registrarse
    Created on : 25/07/2025, 11:23:24
    Author     : ricar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Registro</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .form-container {
                background-color: #fff;
                padding: 2rem;
                border-radius: 10px;
                box-shadow: 0 0 15px rgba(0,0,0,0.1);
                width: 350px;
            }

            h2 {
                text-align: center;
                margin-bottom: 1rem;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-top: 10px;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input, select, button {
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            button {
                margin-top: 15px;
                background-color: #28a745;
                color: white;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Registrarse</h2>
            <form action="procesarRegistro.jsp" method="post">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" maxlength="128" required>

                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" maxlength="128" required>

                <label for="correo">Correo electrónico:</label>
                <input type="email" id="correo" name="correo" maxlength="128" required>

                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" maxlength="255" required>

                <label for="telefono">Teléfono:</label>
                <input type="tel" id="telefono" name="telefono" maxlength="12" required>

                <label for="genero">Género:</label>
                <select id="genero" name="genero">
                    <option value="masculino">Masculino</option>
                    <option value="femenino">Femenino</option>
                    <option value="no" selected>Prefiero no decirlo</option>
                </select>

                <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento">

                <button type="submit">Registrarse</button>
            </form>
        </div>
    </body>
</html>