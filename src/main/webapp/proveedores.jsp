<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Proveedores" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Listado de Proveedores</title>
        <link rel="stylesheet" href="style/proveedores.css">

    <a href="administrar.jsp"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></a>


    <style>
        /* General body and container styles for dark theme */
        body {
            background-color: #1a2035; /* Dark blue background color */
            color: #e0e0e0; /* Light gray text color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        /* Styles for the "Regresar" button at the top */
        body > a {
            position: absolute;
            top: 20px;
            left: 20px;
        }

        body > a img {
            width: 50px;
            height: 50px;
            filter: invert(100%); /* Inverts the color of the image to white */
        }

        /* Styles for the main heading */
        h1 {
            text-align: center;
            color: #ffffff;
            margin-bottom: 20px;
        }

        /* Styles for the "Nuevo Proveedor" form container */
        #formProveedor {
            background-color: #2d3748;
            padding: 20px;
            border-radius: 8px;
            max-width: 500px;
            margin: 0 auto 40px;
            text-align: center;
        }

        #formTitulo {
            color: #ffffff;
            margin-bottom: 20px;
        }

        /* Styles for the form input fields */
        #formProveedor input[type="text"],
        #formProveedor input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            background-color: #4a5568;
            border: 1px solid #6a748a;
            color: #ffffff;
            border-radius: 4px;
        }

        /* Styles for the form button */
        .btn-add {
            background-color: #48bb78; /* Green color for "Guardar" */
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            width: 100%;
        }

        .btn-add:hover {
            background-color: #38a169;
        }

        /* Styles for the table of providers */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #2d3748;
            color: #e0e0e0;
            margin-top: 20px;
        }

        thead {
            background-color: #1a2035;
            color: #ffffff;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #4a5568;
        }

        th:last-child, td:last-child {
            text-align: center;
        }

        tbody tr:hover {
            background-color: #384257;
        }

        /* Styles for the table action buttons */
        .btn-edit {
            background-color: #ffc107; /* Yellow for Edit */
            color: #212529;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 5px;
        }

        .btn-delete {
            background-color: #dc3545; /* Red for Delete */
            color: #ffffff;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        /* Placeholder styling for form inputs */
        ::placeholder {
            color: #a0aec0;
            opacity: 1; /* Firefox default is half-transparent */
        }
    </style>


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
