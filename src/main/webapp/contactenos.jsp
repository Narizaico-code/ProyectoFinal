<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contáctenos</title>
        <link rel="stylesheet" href="style/contactenos.css?">
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
                    <button class="btn btn-primary btn-custom"><img src="https://img.icons8.com/?size=100&id=39977&format=png&color=000000" alt="Regresar" style="width:50px;height:50px;"></button>
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
