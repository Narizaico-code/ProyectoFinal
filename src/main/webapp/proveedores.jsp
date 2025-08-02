<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Proveedores</title>
      <style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background-color: #0d1b2a;
        color: #f1f1f1;
    }

    h1 {
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
    form {
        width: 50%;
        margin: 0 auto 30px auto;
        padding: 20px;
        border-radius: 10px;
        background-color: #1b263b;
        box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    }

    input {
        width: 96%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #444;
        border-radius: 5px;
        background-color: #0d1b2a;
        color: #f1f1f1;
    }

    input::placeholder {
        color: #bbb;
    }

    /* Botones */
    .btn-add {
        background-color: #3b82f6;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        margin-top: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .btn-add:hover {
        background-color: #2563eb;
    }

    .btn {
        padding: 5px 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
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
</style>

            <a href="administrar.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a la administracion"></a>

    </head>
    <body>

        <h1>Listado de Proveedores</h1>

        <!-- Formulario para agregar o editar -->
        <form id="formProveedor" method="post" action="ServletProveedores">
            <h3 id="formTitulo">Nuevo Proveedor</h3>
            <input type="hidden" name="idProveedor" id="idProveedor" />
            <input type="text" name="nombreProveedor" id="nombreProveedor" placeholder="Nombre Proveedor" required /><br>
            <input type="text" name="contactoNombre" id="contactoNombre" placeholder="Nombre del Contacto" /><br>
            <input type="text" name="telefono" id="telefono" placeholder="Teléfono" /><br>
            <input type="email" name="correo" id="correo" placeholder="Correo Electrónico" /><br>
            <input type="text" name="direccion" id="direccion" placeholder="Dirección" /><br>
            <input type="hidden" name="estado" id="estado" value="activo" />
            <button type="submit" class="btn-add">Guardar</button>
        </form>

        <!-- Tabla de proveedores -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre Proveedor</th>
                    <th>Contacto</th>
                    <th>Teléfono</th>
                    <th>Correo</th>
                    <th>Dirección</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Proveedores> proveedores = (List<Proveedores>) request.getAttribute("proveedores");
                    if (proveedores != null && !proveedores.isEmpty()) {
                        for (Proveedores p : proveedores) {
                %>
                <tr>
                    <td><%= p.getIdProveedor()%></td>
                    <td><%= p.getNombreProveedor()%></td>
                    <td><%= p.getContactoNombre()%></td>
                    <td><%= p.getTelefono()%></td>
                    <td><%= p.getCorreo()%></td>
                    <td><%= p.getDireccion()%></td>
                    <td><%= p.getEstado()%></td>
                    <td>
                        <button type="button" class="btn btn-edit"
                                onclick="cargarFormularioEditar('<%= p.getIdProveedor()%>', '<%= p.getNombreProveedor()%>',
                                            '<%= p.getContactoNombre()%>', '<%= p.getTelefono()%>',
                                            '<%= p.getCorreo()%>', '<%= p.getDireccion()%>')">
                            Editar
                        </button>
                        <a href="ServletProveedores?accion=eliminar&id=<%= p.getIdProveedor()%>">
                            <button type="button" class="btn btn-delete">Eliminar</button>
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr><td colspan="8">No hay proveedores disponibles.</td></tr>
                <% }%>
            </tbody>
        </table>


        <script>
            function cargarFormularioEditar(id, nombre, contacto, telefono, correo, direccion) {
                document.getElementById("formTitulo").innerText = "Editar Proveedor";
                document.getElementById("idProveedor").value = id;
                document.getElementById("nombreProveedor").value = nombre;
                document.getElementById("contactoNombre").value = contacto;
                document.getElementById("telefono").value = telefono;
                document.getElementById("correo").value = correo;
                document.getElementById("direccion").value = direccion;
                document.getElementById("estado").value = "activo";
                document.getElementById("formProveedor").scrollIntoView({behavior: "smooth"});
            }
        </script>
    </body>
</html>
