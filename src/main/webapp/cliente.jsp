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
    <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>


    <style>
        /* General body and container styles for dark theme */
        body {
            background-color: #1a2035;
            color: #e0e0e0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        header h1 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }

        /* Styles for the "Nuevo Cliente" form section */
        .form-container {
            background-color: #2d3748;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        #formTitulo {
            color: #ffffff;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 5px;
            color: #a0aec0;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        input[type="datetime-local"] {
            background-color: #4a5568;
            border: 1px solid #6a748a;
            color: #ffffff;
            padding: 10px;
            border-radius: 4px;
        }

        .password-toggle-group {
            display: flex;
            align-items: center;
            margin-top: 5px;
            font-size: 0.9em;
        }

        .password-toggle-group input {
            margin-right: 5px;
        }

        /* Radio button group styling */
        .form-group.full-width {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 15px;
        }

        .form-group.full-width label {
            margin-bottom: 0;
        }

        .submit-button-container {
            text-align: right;
            margin-top: 20px;
        }

        .btn-add {
            background-color: #48bb78; /* Green for "Add/Save" */
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-add:hover {
            background-color: #38a169;
        }

        /* Listado de Clientes section styles */
        section h2 {
            text-align: center;
            color: #ffffff;
            margin-top: 40px;
            margin-bottom: 20px;
        }

        .btn-container {
            text-align: right;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #2d3748;
        }

        thead {
            background-color: #1a2035;
            color: #ffffff;
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
            border: 1px solid #4a5568;
        }

        tbody tr:nth-child(even) {
            background-color: #2d3748;
        }

        tbody tr:nth-child(odd) {
            background-color: #1a2035;
        }

        .btn-edit {
            background-color: #ffc107;
            color: #212529;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-delete {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
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