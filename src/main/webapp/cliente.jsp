<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Usuario" %>
<%
    List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuario");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Administrador de Clientes</title>

        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #0d1b2a;
                color: #f1f1f1;
            }

            h1, h2, h3 {
                text-align: center;
                margin-top: 30px;
                margin-bottom: 20px;
            }

            /* Imagen menú con fondo oscuro */
            .menu {
                width: 128px;
                height: auto;
                display: block;
                margin: 15px 20px;
            }

            /* Formulario */
            .form-container {
                width: 80%;
                max-width: 600px;
                margin: 30px auto;
                padding: 20px;
                border-radius: 10px;
                background-color: #1b263b;
                box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            }

            /* Ajuste de inputs dentro del formulario */
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="password"],
            .form-container input[type="number"],
            .form-container input[type="datetime-local"] {
                width: 96%; /* Ajustado para que encaje bien en el contenedor */
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #444;
                border-radius: 5px;
                background-color: #0d1b2a;
                color: #f1f1f1;
                box-sizing: border-box; /* Para que el padding no afecte el ancho */
            }

            input::placeholder {
                color: #bbb;
            }

            .form-container label {
                color: #f1f1f1;
            }

            /* Botones del formulario */
            .submit-button-container .btn-add {
                background-color: #3b82f6;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .submit-button-container .btn-add:hover {
                background-color: #2563eb;
            }

            /* Botones en general */
            .btn {
                padding: 5px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
                display: inline-block;
                margin: 2px;
            }
            .btn-edit {
                background-color: #fbbf24;
                color: #1b263b;
            }
            .btn-edit:hover {
                background-color: #f59e0b;
                color: #111;
            }
            .btn-delete {
                background-color: #ef4444;
                color: white;
            }
            .btn-delete:hover {
                background-color: #dc2626;
            }

            .btn-container {
                text-align: center;
                margin-bottom: 20px;
            }

            /* Tabla */
            table {
                width: 98%;
                margin: auto;
                border-collapse: collapse;
                background-color: #1b263b;
                box-shadow: 0 4px 10px rgba(0,0,0,0.3);
                color: #f1f1f1;
            }
            th, td {
                border: 1px solid #0d1b2a;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #16213e;
                color: #f1f1f1;
            }
            tbody tr:nth-child(even) {
                background-color: #142850;
            }
            tbody tr:hover {
                background-color: #1f4068;
            }

            /* Estilo para el checkbox de mostrar contraseña */
            .password-toggle-group {
                display: flex;
                align-items: center;
                gap: 5px;
                color: #f1f1f1;
                margin-top: -5px; /* Ajuste para que se vea mejor */
            }
        </style>
    </head>
    <body>

        <header>
            <h1>Administrador de Clientes</h1>
        </header>

        <main>
            <section class="form-container">
                <h3 id="formTitulo">Nuevo Cliente</h3>
                <form id="formUsuario" method="post" action="ServletCliente">
                    <input type="hidden" name="accion" id="accion" value="agregar" />
                    <input type="hidden" name="idUsuario" id="idUsuario" value="" />

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="nombre">Nombre:</label>
                            <input type="text" name="nombre" id="nombre" placeholder="Nombre" required />
                        </div>
                        <div class="form-group">
                            <label for="apellido">Apellido:</label>
                            <input type="text" name="apellido" id="apellido" placeholder="Apellido" />
                        </div>
                        <div class="form-group">
                            <label for="correo">Correo:</label>
                            <input type="email" name="correo" id="correo" placeholder="Correo" />
                        </div>
                        <div class="form-group">
                            <label for="contrasena">Contraseña:</label>
                            <input type="password" name="contrasena" id="contrasena" placeholder="Contraseña" />
                            <div class="password-toggle-group">
                                <input type="checkbox" id="togglePassword">
                                <span>Mostrar contraseña</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Teléfono:</label>
                            <input type="number" name="telefono" id="telefono" placeholder="Teléfono" />
                        </div>

                        <div class="form-group full-width">
                            <label>Género:</label>
                            <label><input type="radio" name="genero" value="masculino" /> Masculino</label>
                            <label><input type="radio" name="genero" value="femenino" /> Femenino</label>
                            <label><input type="radio" name="genero" value="no" /> Otro</label>
                        </div>
                        <div class="form-group full-width">
                            <label>Rol:</label>
                            <label><input type="radio" name="rol" value="Cliente" /> Cliente</label>
                            <label><input type="radio" name="rol" value="Admin" /> Admin</label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fechaNacimiento">Fecha de Nacimiento:</label>
                        <input type="datetime-local" name="fechaNacimiento" id="fechaNacimiento" />
                    </div>

                    <div class="submit-button-container">
                        <button type="submit" id="btnGuardar" class="btn-add">Guardar</button>
                    </div>
                </form>
            </section>

            <section>
                <h2 style="text-align: center;">Listado de Clientes</h2>
                <div class="btn-container">
                    <button type="button" class="btn-add" onclick="prepararAgregar()">Agregar Nuevo Cliente</button>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>ID</th><th>Nombre</th><th>Apellido</th><th>Correo</th>
                            <th>Teléfono</th><th>Género</th><th>F. Nac.</th><th>Rol</th><th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (usuarios != null) {
                            for (Usuario u : usuarios) {%>
                        <tr>
                            <td><%= u.getIdUsuario()%></td>
                            <td><%= u.getNombre()%></td>
                            <td><%= u.getApellido()%></td>
                            <td><%= u.getCorreo()%></td>
                            <td><%= u.getTelefono()%></td>
                            <td><%= u.getGenero()%></td>
                            <td><%= u.getFechaNacimiento()%></td>
                            <td><%= u.getRol()%></td>
                            <td>
                                <button type="button" class="btn btn-edit"
                                        onclick="cargarFormularioEditar(
                                                '<%=u.getIdUsuario()%>',
                                                '<%=u.getNombre()%>',
                                                '<%=u.getApellido()%>',
                                                '<%=u.getCorreo()%>',
                                                '<%=u.getContrasena()%>',
                                                '<%=u.getTelefono()%>',
                                                '<%=u.getGenero()%>',
                                                '<%=u.getFechaNacimiento().toString().substring(0, 16).replace(' ', 'T')%>',
                                                '<%=u.getRol()%>'
                                                )">
                                    Editar
                                </button>
                                <a href="ServletCliente?accion=eliminar&idUsuario=<%=u.getIdUsuario()%>" class="btn btn-delete">
                                    Eliminar
                                </a>
                            </td>
                        </tr>
                        <%    }
                    } else { %>
                        <tr>
                            <td colspan="9" style="text-align: center;">No hay clientes para mostrar.</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </section>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const togglePassword = document.getElementById('togglePassword');
                const contrasenaField = document.getElementById('contrasena');

                if (togglePassword && contrasenaField) {
                    togglePassword.addEventListener('change', function () {
                        if (togglePassword.checked) {
                            contrasenaField.type = 'text';
                        } else {
                            contrasenaField.type = 'password';
                        }
                    });
                }
            });

            function prepararAgregar() {
                document.getElementById("formTitulo").innerText = "Nuevo Cliente";
                document.getElementById("accion").value = "agregar";
                document.getElementById("idUsuario").value = "";
                ["nombre", "apellido", "correo", "contrasena", "telefono", "fechaNacimiento"].forEach(id => {
                    const element = document.getElementById(id);
                    if (element)
                        element.value = "";
                });
                document.querySelectorAll("input[name=genero]").forEach(r => r.checked = false);
                document.querySelectorAll("input[name=rol]").forEach(r => r.checked = false);
                document.getElementById("btnGuardar").innerText = "Guardar";
                document.getElementById("btnGuardar").className = "btn-add";

                document.getElementById('contrasena').type = 'password';
                const togglePassword = document.getElementById('togglePassword');
                if (togglePassword) {
                    togglePassword.checked = false;
                }

                document.getElementById("formUsuario").scrollIntoView({behavior: "smooth"});
            }

            function cargarFormularioEditar(id, nombre, apellido, correo, contrasena, telefono, genero, fechaNacimiento, rol) {
                document.getElementById("formTitulo").innerText = "Editar Cliente";
                document.getElementById("accion").value = "editar";
                document.getElementById("idUsuario").value = id;
                document.getElementById("nombre").value = nombre;
                document.getElementById("apellido").value = apellido;
                document.getElementById("correo").value = correo;
                document.getElementById("contrasena").value = contrasena;
                document.getElementById("telefono").value = telefono;
                document.getElementById("fechaNacimiento").value = fechaNacimiento;
                document.querySelectorAll("input[name=genero]").forEach(r => r.checked = (r.value === genero));
                document.querySelectorAll("input[name=rol]").forEach(r => r.checked = (r.value === rol));
                document.getElementById("btnGuardar").innerText = "Actualizar";
                document.getElementById("btnGuardar").className = "btn-add";

                document.getElementById('contrasena').type = 'password';
                const togglePassword = document.getElementById('togglePassword');
                if (togglePassword) {
                    togglePassword.checked = false;
                }

                document.getElementById("formUsuario").scrollIntoView({behavior: "smooth"});
            }
        </script>
    </body>
</html>