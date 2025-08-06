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
        <style>
            body {
                font-family: Arial, sans-serif;
                background: #fdfcfa;
                margin: 0;
                padding: 20px;
            }
            .contenedor {
                max-width: 800px;
                background: white;
                padding: 30px;
                margin: auto;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .titulo {
                font-size: 36px;
                font-weight: bold;
            }
            .row {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }
            .col {
                width: 48%;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 10px;
            }
            .tabla {
                width: 100%;
                margin-top: 30px;
                border-collapse: collapse;
            }
            .tabla thead {
                background: black;
                color: white;
            }
            .tabla th, .tabla td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }
            .iva {
                margin-top: 20px;
                text-align: right;
            }
            .logo {
                width: 100px;
                height: 100px;
                background-color: #eaeaea;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 12px;
                border-radius: 50%;
            }
            .gracias {
                display: inline-block;
                background: black;
                color: white;
                padding: 10px 20px;
                margin-top: 30px;
                border-radius: 20px;
                font-weight: bold;
            }
        </style>
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