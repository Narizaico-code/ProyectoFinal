<%-- 
    Document   : cliente
    Created on : 1/08/2025, 17:24:32
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Clientes</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            h1 {
                text-align: center;
            }
            .btn-add {
                background-color: #007bff;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                margin-bottom: 20px;
                cursor: pointer;
            }
            .btn {
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .btn-edit {
                background-color: #f1c40f;
                color: black;
            }
            .btn-delete {
                background-color: #e74c3c;
                color: white;
            }
            table {
                width: 98%;
                margin: auto;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #111;
                color: white;
            }
            form {
                width: 50%;
                margin: 0 auto 30px auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #f9f9f9;
            }
            input {
                width: 96%;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #aaa;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>

        <h1>Listado de Clientes</h1>

        <!-- Formulario para agregar o editar -->
        <form id="formProveedor" method="post" action="ServletCliente">
        </form>
        <!-- Formulario para agregar o editar -->
        <form id="formUsuario" method="post" action="ServletCliente">
            <h3 id="formTitulo">Editar Cliente</h3>
            <input type="hidden" name="accion" value="editar">
            <input type="hidden" name="idUsuario" id="idUsuario" />
            <input type="text" name="nombre" id="nombre" placeholder="Nombre" required /><br>
            <input type="text" name="apellido" id="apellido" placeholder="Apellido" /><br>
            <input type="email" name="correo" id="correo" placeholder="Correo" /><br>
            <input type="password" name="contrasena" id="contrasena" placeholder="Contraseña" /><br>
            <input type="number" name="telefono" id="telefono" placeholder="Teléfono" /><br>

            <label><input type="radio" name="genero" value="masculino" /> Masculino</label>
            <label><input type="radio" name="genero" value="femenino" /> Femenino</label>
            <label><input type="radio" name="genero" value="no" /> Otro</label><br>

            <input type="datetime-local" name="fechaNacimiento" id="fechaNacimiento" /><br>

            <label><input type="radio" name="rol" value="Cliente" /> Cliente</label>
            <label><input type="radio" name="rol" value="Admin" /> Admin</label><br>

            <button type="submit" class="btn-add">Guardar</button>
        </form>

        <!-- Tabla de proveedores -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Telefono</th>
                    <th>Genero</th>
                    <th>fechaNacimiento</th>
                    <th>rol</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuario");
                    if (usuarios != null && !usuarios.isEmpty()) {
                        for (Usuario u : usuarios) {
                %>
                <tr>
                    <td><%= u.getIdUsuario()%></td>
                    <td><%= u.getNombre()%></td>
                    <td><%= u.getApellido()%></td>
                    <td><%= u.getCorreo()%></td>
                    <td><%= u.getContrasena()%></td>
                    <td><%= u.getTelefono()%></td>
                    <td><%= u.getGenero()%></td>
                    <td><%= u.getFechaNacimiento()%></td>
                    <td><%= u.getRol()%></td>
                    <td>
                        <button class="btn btn-edit" onclick="cargarFormularioEditar(
                    '<%= u.getIdUsuario()%>',
                    '<%= u.getNombre()%>',
                    '<%= u.getApellido()%>',
                    '<%= u.getCorreo()%>',
                    '<%= u.getContrasena()%>',
                    '<%= u.getTelefono()%>',
                    '<%= u.getGenero()%>',
                    '<%= u.getFechaNacimiento().toString().substring(0, 16).replace(' ', 'T')%>',
                    '<%= u.getRol()%>'
                    )">Editar</button>
                        <a href="ServletCliente?accion=eliminar&id=<%= u.getIdUsuario()%>">
                            <button type="button" class="btn btn-delete">Eliminar</button>
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr><td colspan="9">No hay proveedores disponibles.</td></tr>
                <% }%>
            </tbody>
        </table>


        <script>
            function cargarFormularioEditar(id, nombre, apellido, correo, contrasena, telefono, genero, fechaNacimiento, rol) {
                document.getElementById("idUsuario").value = id;
                document.getElementById("nombre").value = nombre;
                document.getElementById("apellido").value = apellido;
                document.getElementById("correo").value = correo;
                document.getElementById("contrasena").value = contrasena;
                document.getElementById("telefono").value = telefono;
                document.getElementById("fechaNacimiento").value = fechaNacimiento;

                document.querySelectorAll("input[name='genero']").forEach(r => r.checked = r.value === genero);
                document.querySelectorAll("input[name='rol']").forEach(r => r.checked = r.value === rol);

                document.getElementById("formUsuario").scrollIntoView({behavior: "smooth"});
            }
        </script>

    </body>
</html>