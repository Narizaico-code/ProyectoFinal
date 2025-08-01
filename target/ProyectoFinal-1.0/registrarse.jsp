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

        <link rel="stylesheet" href="style/extra.css">

    </head>
    <body>
        <div class="form-container">
            <h2>Registrarse</h2>

            <form action="ServletUsuario" method="post">

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
</html>

