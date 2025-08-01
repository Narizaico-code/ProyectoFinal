<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Proveedores</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 20px;
            }
            header img {
                height: 60px;
            }
            .buttons {
                margin-bottom: 15px;
            }
            .buttons a {
                margin-right: 10px;
                padding: 8px 12px;
                text-decoration: none;
                background-color: #007BFF;
                color: white;
                border-radius: 5px;
            }
            .buttons a:hover {
                background-color: #0056b3;
            }
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                padding: 8px;
                border: 1px solid #aaa;
                text-align: center;
            }
            .action-btn {
                margin: 2px;
                padding: 4px 8px;
                border: none;
                color: white;
                border-radius: 4px;
                cursor: pointer;
            }
            .edit {
                background-color: #ffc107;
            }
            .delete {
                background-color: #dc3545;
            }
            .deactivate {
                background-color: #6c757d;
            }
        </style>
    </head>
    <body>

        <header>
            <img src="logo stillz" alt="Logo stillz">
            <div class="buttons">
                <a href="contactenos.jsp">Contactenos</a>
                <a href="index.jsp">Regresar</a>
            </div>
        </header>

        <h1>Lista de Proveedores</h1>

        <table>
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
                    <form action="ServletProveedores" method="get" style="display:inline;">
                        <input type="hidden" name="accion" value="editar">
                        <input type="hidden" name="id" value="<%= p.getIdProveedor()%>">
                        <button class="action-btn edit" type="submit">Editar</button>
                    </form>

                    <form action="ServletProveedores" method="get" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="id" value="<%= p.getIdProveedor()%>">
                        <button class="action-btn delete" type="submit">Eliminar</button>
                    </form>

                    <form action="ServletProveedores" method="get" style="display:inline;">
                        <input type="hidden" name="accion" value="desactivar">
                        <input type="hidden" name="id" value="<%= p.getIdProveedor()%>">
                        <button class="action-btn deactivate" type="submit">Desactivar</button>
                    </form>
                </td>
            </tr>
            <% }%>
        </table>

        <h2>Agregar Proveedor</h2>
        <form action="ServletProveedores" method="post">
            <input type="text" name="nombreProveedor" placeholder="Nombre del proveedor" required><br>
            <input type="text" name="contactoNombre" placeholder="Nombre del contacto"><br>
            <input type="text" name="telefono" placeholder="Teléfono"><br>
            <input type="email" name="correo" placeholder="Correo"><br>
            <input type="text" name="direccion" placeholder="Dirección"><br>
            <input type="submit" value="Agregar">
        </form>
    </body>
</html>