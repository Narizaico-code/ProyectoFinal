<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Factura" %>
<%@ page import="model.Usuario" %>

<%
    List<Factura> detalles = (List<Factura>) request.getAttribute("detallesFactura");
    if (detalles == null) {
        detalles = new java.util.ArrayList<>();
    }
    double total = 0.0;
    for (Factura f : detalles) {
        if (f.getSubTotal() != null) {
            total += f.getSubTotal();
        } else if (f.getCantidad() != null && f.getPrecioUnitario() != null) {
            total += f.getCantidad() * f.getPrecioUnitario();
        }
    }
    Integer idPedido = (Integer) request.getAttribute("idPedido");
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
<<<<<<< HEAD
        <title>Factura</title>
        <link rel="stylesheet" href="factura.css">
=======
        <title>Factura - Pedido <%= idPedido%></title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #f7f7f7;
                padding: 20px;
            }
            .container {
                max-width: 900px;
                margin: auto;
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }
            table th, table td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }
            .right {
                text-align: right;
            }
            .total {
                font-weight: bold;
                font-size: 1.2em;
            }
            .small {
                font-size: 0.9em;
                color: #666;
            }
            .actions {
                margin-top: 20px;
                display:flex;
                gap:10px;
                justify-content:flex-end;
            }
        </style>
>>>>>>> ft/Angel
    </head>
    <body>
        <div class="container">
            <h1>Factura</h1>
            <p class="small">Pedido: <strong><%= idPedido%></strong></p>

            <% if (usuario != null) {%>
            <div>
                <strong>Cliente:</strong> <%= usuario.getNombre() != null ? usuario.getNombre() : "(sin nombre)"%>
                &nbsp;|&nbsp; <strong>ID:</strong> <%= usuario.getIdUsuario()%> <!-- si tu método es distinto cámbialo -->
            </div>
            <% } %>

            <table>
                <thead>
                    <tr>
                        <th>Producto / ID</th>
                        <th>Talla</th>
                        <th>Cant.</th>
                        <th>Precio Unitario</th>
                        <th class="right">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (detalles.isEmpty()) {
                    %>
                    <tr><td colspan="5">No hay elementos en esta factura.</td></tr>
                    <%
                    } else {
                        for (Factura f : detalles) {
                    %>
                    <tr>
                        <td><%= "ID:" + (f.getIdProducto() != null ? f.getIdProducto() : "-")%></td>
                        <td><%= f.getTalla() != null ? f.getTalla() : "-"%></td>
                        <td><%= f.getCantidad() != null ? f.getCantidad() : 0%></td>
                        <td>Q <%= f.getPrecioUnitario() != null ? String.format("%.2f", f.getPrecioUnitario()) : "0.00"%></td>
                        <td class="right">Q <%= f.getSubTotal() != null ? String.format("%.2f", f.getSubTotal()) : String.format("%.2f", (f.getCantidad() != null && f.getPrecioUnitario() != null) ? f.getCantidad() * f.getPrecioUnitario() : 0.0)%></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

            <div class="actions">
                <div style="text-align:right;">
                    <p class="right total">Total: Q <%= String.format("%.2f", total)%></p>
                </div>
                <!-- Botón para volver -->
                <a href="index.jsp" style="padding:8px 12px; background:#ddd; border-radius:4px; text-decoration:none; color:#000;">Volver</a>

                <!-- Botón descargar PDF -->
                <form action="ServletFacturaPDF" method="GET" style="margin:0;">
                    <input type="hidden" name="idPedido" value="<%= idPedido%>"/>
                    <button type="submit" style="padding:8px 12px; border-radius:4px; background:#2b7; color:white; border:none; cursor:pointer;">Descargar PDF</button>
                </form>
            </div>
        </div>
    </body>
</html>
