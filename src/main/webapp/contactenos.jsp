<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contáctenos</title>
        <style>
            .left h2:nth-of-type(2) {
                margin-bottom: 20px;
            }
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: 'Inter', sans-serif;
                background-color: #000000;
                color: #ffd700;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                padding: 40px;
            }

            .container {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
                align-items: flex-start;
                width: 100%;
                max-width: 1200px;
                gap: 40px;
            }

            /* IZQUIERDA */
            .left {
                flex: 1;
            }

            .left h2 {
                font-size: 2.5em;
                margin: 0;
                text-shadow: 0 0 15px #ffd700;
            }

            .left p {
                margin-top: 15px;
                margin-bottom: 30px;
                line-height: 1.6;
                color: #ffd700;
            }

            .redes-horizontal {
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                gap: 30px;
                align-items: center;
            }

            .redes-horizontal .item {
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
                color: #ffffff;
                text-decoration: none;
            }

            .redes-horizontal .item img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                object-fit: cover;
                box-shadow: 0 0 8px rgba(255, 215, 0, 0.5);
                margin-bottom: 6px;
            }

            .redes-horizontal .item h3 {
                color: #ffd700;
                font-size: 1em;
                margin: 0;
            }

            .redes-horizontal .item p {
                font-size: 0.9em;
                margin: 0;
                color: #ffffff;
            }

            /* FORMULARIO */
            .form-container {
                background-color: #111111;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 0 25px #ffd700aa;
                max-width: 500px;
                width: 100%;
            }

            .form-group {
                position: relative;
                margin-bottom: 30px;
            }

           .form-group input,
            .form-group textarea {
                width: 100%;
                padding: 12px;
                font-size: 16px;
                border: 2px solid #ffd700;
                background-color: #111111 !important; /* IMPORTANT: Ensure dark background */
                color: #ffffff;
                border-radius: 8px;
                outline: none;
                caret-color: #ffffff;
            }
            
             /* Autofill background fix */
            .form-group input:-webkit-autofill,
            .form-group textarea:-webkit-autofill {
                -webkit-box-shadow: 0 0 0 1000px #111111 inset !important;
                -webkit-text-fill-color: #ffffff !important;
                caret-color: #ffffff !important;
            }


            .form-group input:focus,
            .form-group textarea:focus {
                border-color: #fff200;
                box-shadow: 0 0 10px #fff200;
            }

            .form-group label {
                position: absolute;
                left: 12px;
                top: 12px;
                padding: 0 5px;
                background: #111111; /* Ensure dark grey background for label */
                color: #ffd700;
                font-size: 16px;
                pointer-events: none;
                transition: 0.2s ease all;
                border-radius: 4px;
            }


            .form-group input:focus + label,
            .form-group input:not(:placeholder-shown) + label,
            .form-group textarea:focus + label,
            .form-group textarea:not(:placeholder-shown) + label {
                top: -10px;
                left: 10px;
                font-size: 13px;
                padding: 0 6px;
                background: #111111; /* Ensure dark grey background for floated label */
                color: #ffd700; /* Keep gold color */
            }

            button {
                background-color: #ffd700;
                color: #000;
                padding: 14px;
                width: 100%;
                border: none;
                border-radius: 8px;
                font-size: 18px;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
                box-shadow: 0 4px 15px rgba(255, 215, 0, 0.4);
                margin-top: 20px;
            }

            button:hover {
                background-color: #fff200;
                transform: scale(1.03);
                box-shadow: 0 6px 20px rgba(255, 242, 0, 0.6);
            }

            .btn-regresar-container {
                margin-top: 30px;
            }

            .btn-custom {
                background-color: #FFD700;
                border: none;
                color: black;
                padding: 10px 20px;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
                box-shadow: 0 0 10px #FFD700;
                transition: background-color 0.3s ease;
            }

            .btn-custom:hover {
                background-color: #e6c200;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="left">
                <h2>CONTACTENOS</h2>
                <p>Tu opinión es importante para nosotros. Si algo no salió como esperabas o tienes alguna inquietud, no dudes en escribirnos. Estamos aquí para ayudarte y mejorar gracias a ti.</p>
                <h2>Nuestras Redes Sociales</h2>
                <div class="redes-horizontal">
                    <br><!-- comment -->
                    <br>
                    <div class="item">
                        <img src="https://placehold.co/45x45/25D366/ffffff?text=WA" alt="WhatsApp">
                        <h3>WhatsApp</h3>
                        <p>+502 3456-7894</p>
                    </div>
                    <div class="item">
                        <img src="https://placehold.co/45x45/E4405F/ffffff?text=IG" alt="Instagram">
                        <h3>Instagram</h3>
                        <p>@Stillz_GT</p>
                    </div>
                    <div class="item">
                        <img src="https://placehold.co/45x45/1877F2/ffffff?text=FB" alt="Facebook">
                        <h3>Facebook</h3>
                        <p>STYLLZGT</p>
                    </div>
                    <div class="item">
                        <img src="https://placehold.co/45x45/000000/ffffff?text=TT" alt="TikTok">
                        <h3>TikTok</h3>
                        <p>@STILLZ_GT</p>
                    </div>
                </div>
            </div>
            <div class="btn-regresar-container">
                <a href="index.jsp">
                    <button class="btn btn-primary btn-custom"><img src="https://img.icons8.com/?size=100&id=24338&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></button>
                </a>
            </div>

            <div class="form-container">
                <form action="https://formsubmit.co/ramierzk99@gmail.com" method="POST">
                    <div class="form-group">
                        <input type="text" name="name" required placeholder=" ">
                        <label>Nombre</label>
                    </div>

                    <div class="form-group">
                        <input type="email" name="email" required placeholder=" ">
                        <label>Correo Electrónico</label>
                    </div>

                    <div class="form-group">
                        <input type="text" name="subject" required placeholder=" ">
                        <label>Asunto</label>
                    </div>

                    <div class="form-group">
                        <textarea name="comments" rows="4" required placeholder=" "></textarea>
                        <label>Comentarios</label>
                    </div>

                    <button type="submit">Enviar</button>
                    <input type="hidden" name="_next" value="http://localhost:8080/ProyectoFinal/ServletMenuPrincipal">
                    <input type="hidden" name="_captcha" value="false">
                </form>
            </div>
        </div>
    </body>
</html>
