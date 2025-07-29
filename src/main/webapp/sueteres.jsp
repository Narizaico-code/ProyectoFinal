<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hometown Hero Sudadera</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 0;
            /* Eliminamos padding del body si queremos que ocupe toda la pantalla para centrar */
            background-color: #f8f8f8;
            display: flex; /* Usamos flexbox para centrar el contenido */
            justify-content: center; /* Centra horizontalmente */
            align-items: center; /* Centra verticalmente */
            min-height: 100vh; /* Asegura que el body ocupe al menos el 100% de la altura de la ventana */
        }

        .product-container {
            display: flex;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 1000px;
            width: 100%;
            overflow: hidden;
            /* Añadido: margen automático para ayudar a centrar en caso de que el flexbox del body no sea suficiente o en anchos específicos */
            margin: auto;
            /* Puedes añadir un poco de padding al contenedor si quieres que no esté pegado a los bordes en pantallas muy pequeñas */
            padding: 10px; /* Esto es opcional, depende del diseño deseado */
            box-sizing: border-box; /* Asegura que el padding no añada ancho extra */
        }

        .product-image-section {
            flex: 1;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            background-color: #eee; /* A light background for the image area */
        }

        .product-image {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }

        .image-nav-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10; /* Asegura que los botones estén por encima de la imagen */
        }

        .image-nav-button.left {
            left: 10px;
        }

        .image-nav-button.right {
            right: 10px;
        }

        .product-details-section {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .product-title {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .product-price {
            display: flex;
            align-items: baseline;
            margin-bottom: 15px;
        }

        .current-price {
            font-size: 24px;
            font-weight: bold;
            color: #d9534f; /* Red for discounted price */
            margin-right: 10px;
        }

        .original-price {
            font-size: 18px;
            color: #888;
            text-decoration: line-through;
        }

        .discount-badge {
            background-color: #d9534f;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            margin-left: 10px;
            font-weight: bold;
        }

        .delivery-info {
            background-color: #e0ffe0; /* Light green background */
            border: 1px solid #c0ffc0;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 20px;
            font-size: 14px;
            color: #3c763d; /* Darker green text */
        }

        .delivery-info strong {
            color: #333;
        }

        .option-label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .size-options, .color-options {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .size-option, .color-option {
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
            background-color: #f0f0f0;
            transition: all 0.2s ease-in-out;
            font-size: 14px;
        }

        .size-option:hover, .color-option:hover {
            border-color: #a0a0a0;
        }

        .size-option.selected, .color-option.selected {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .stock-info {
            font-size: 15px;
            color: #d9534f; /* Red for low stock */
            margin-bottom: 20px;
            font-weight: bold;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .quantity-button {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            padding: 8px 12px;
            cursor: pointer;
            font-size: 18px;
            border-radius: 4px;
            transition: background-color 0.2s;
        }

        .quantity-button:hover {
            background-color: #e0e0e0;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            border: 1px solid #ddd;
            padding: 8px 0;
            margin: 0 5px;
            border-radius: 4px;
            font-size: 16px;
        }

        .add-to-cart-button, .buy-now-button {
            width: 100%;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.2s;
            margin-bottom: 10px;
        }

        .add-to-cart-button {
            background-color: #007bff; /* Blue */
            color: white;
        }

        .add-to-cart-button:hover {
            background-color: #0056b3;
        }

        .buy-now-button {
            background-color: #28a745; /* Green */
            color: white;
        }

        .buy-now-button:hover {
            background-color: #218838;
        }

        .pickup-info {
            background-color: #f9f9f9;
            border: 1px solid #eee;
            padding: 15px;
            border-radius: 4px;
            margin-top: 20px;
            font-size: 14px;
            color: #666;
        }

        .pickup-info strong {
            color: #333;
        }

        .store-info-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            margin-top: 5px;
            display: inline-block;
        }

        .store-info-link:hover {
            text-decoration: underline;
        }

        .compare-share-buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            font-size: 14px;
            color: #007bff;
            cursor: pointer;
        }

        .compare-share-buttons div:hover {
            text-decoration: underline;
        }

        .sku-info {
            margin-top: 20px;
            font-size: 13px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="product-container">
        <div class="product-image-section">
            <button class="image-nav-button left">&lt;</button>
            <img src="http://googleusercontent.com/file_content/0" alt="Hometown Hero Sudadera Azul Oscuro" class="product-image">
            <button class="image-nav-button right">&gt;</button>
        </div>
        <div class="product-details-section">
            <div style="text-align: right; margin-bottom: 15px;">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart" style="cursor: pointer; color: #888;">
                    <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                </svg>
            </div>
            <h1 class="product-title">Sudadera, Azul Obscuro</h1>
            <div class="product-price">
                <span class="current-price">Q264.50</span>
            </div>
            
            <div class="option-label">Talla Seleccionada: L</div>
            <div class="size-options">
                <div class="size-option">S</div>
                <div class="size-option">M</div>
                <div class="size-option selected">L</div>
                <div class="size-option">XL</div>
            </div>

            <div class="option-label">Color: Azul Obscuro</div>
            <div class="color-options">
                <div class="color-option selected">Azul Obscuro</div>
            </div>

            <div class="stock-info">Quedan 3 producto(s) en stock!</div>

            <div class="option-label">Cantidad</div>
            <div class="quantity-selector">
                <button class="quantity-button">-</button>
                <input type="text" value="1" class="quantity-input">
                <button class="quantity-button">+</button>
            </div>

            <button class="add-to-cart-button">AÑADIR AL CARRITO</button>
            <button class="buy-now-button">COMPRAR AHORA</button>

            <div class="sku-info">SKU: 0060243304001</div>
        </div>
    </div>
</body>
</html>