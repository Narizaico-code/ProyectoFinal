<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Proveedores</title>
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
            <a href="administrar.jsp"><img class="menu" src="resources/menu.png" alt="Regresar a menú principal"></a>

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
