<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Proveedores</title>
        <link rel="stylesheet" href="style/proveedores.css">

            <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>

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
