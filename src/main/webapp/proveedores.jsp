<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Proveedores</title>
    </head>
    <body>
        <h1>Lista de Proveedores</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Contacto</th>
                <th>Teléfono</th>
                <th>Correo</th>
                <th>Dirección</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
            <%
                List<Proveedores> lista = (List<Proveedores>) request.getAttribute("listaProveedores");
                for (Proveedores p : lista) {
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
                    <a href="ProveedorServlet?accion=desactivar&id=<%= p.getIdProveedor()%>">Desactivar</a>
                </td>
            </tr>
            <% }%>
        </table>

        <h2>Agregar Proveedor</h2>
        <form action="ProveedorServlet" method="post">
            <input type="text" name="nombreProveedor" placeholder="Nombre del proveedor" required><br>
            <input type="text" name="contactoNombre" placeholder="Nombre del contacto"><br>
            <input type="text" name="telefono" placeholder="Teléfono"><br>
            <input type="email" name="correo" placeholder="Correo"><br>
            <input type="text" name="direccion" placeholder="Dirección"><br>
            <input type="submit" value="Agregar">
        </form>
    </body>
</html>
