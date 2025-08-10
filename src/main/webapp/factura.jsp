<%-- 
    Document   : factura
    Created on : 6/08/2025, 10:24:21
    Author     : razep
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Factura</title>
        <link rel="stylesheet" href="factura.css">
    </head>
    <body>
        <div class="contenedor">
            <div class="row">
                <div class="titulo">FACTURA</div>
                <div class="logo">Stillz</div>
            </div>

            <div class="row" style="margin-top: 40px;">
                <div class="col">
                    <strong>DATOS DEL CLIENTE</strong><br>
                    kevin<br>
                    corexd@gmail.com<br>
                    911-234-5678<br>
                    mixco
                </div>
                <div class="col">
                    <strong>DATOS DE LA EMPRESA</strong><br>
                    parce<br>
                    correoxdddd@gmail.com<br>
                    911-234-5678<br>
                    mixco
                </div>
            </div>

            <table class="tabla">
                <thead>
                    <tr>
                        <th>Detalle</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Camisa</td>
                        <td>01</td>
                        <td>10 Q</td>
                        <td>10 Q</td>
                    </tr>
                    <tr>
                        <td>Pantalon</td>
                        <td>01</td>
                        <td>11 Q</td>
                        <td>11 Q</td>
                    </tr>
                    <tr>
                        <td>Sueter</td>
                        <td>01</td>
                        <td>4 Q</td>
                        <td>4 Q</td>
                    </tr>
                    <tr>
                        <td>Pantalon</td>
                        <td>01</td>
                        <td>10 Q</td>
                        <td>10 Q</td>
                    </tr>
                    <tr>
                        <td>Camisa</td>
                        <td>01</td>
                        <td>10 Q</td>
                        <td>10 Q</td>
                    </tr>
                    <tr>
                        <td>Sueter</td>
                        <td>01</td>
                        <td>10 Q</td>
                        <td>10 Q</td>
                    </tr>
                </tbody>
            </table>

            <div class="iva">
                <p>IVA: 20% — 100 Q</p>
                <h2>TOTAL: 150 Q</h2>
            </div>

            <button class="gracias">Gracias</button>
        </div>
    </body>
</html>