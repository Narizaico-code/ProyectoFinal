<%-- 
    Document   : camisas
    Created on : 31/07/2025, 16:43:26
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Camisas</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/camisas.css?v=1">
    </head>
    <body>
        
        <div class="menu">
            <button class="btn"  id="btn-volver" onclick="history.back()">←Volver</button>
            <div class="grid"></div>
            <div id="poda">
                <div class="glow"></div>
                <div class="darkBorderBg"></div>
                <div class="darkBorderBg"></div>
                <div class="darkBorderBg"></div>

                <div class="white"></div>

                <div class="border"></div>

                <div id="main">
                    <input placeholder="Search..." type="text" name="text" class="input" />
                    <div id="input-mask"></div>
                    <div id="pink-mask"></div>
                    <div class="filterBorder"></div>
                    <div id="filter-icon">
                        <svg
                            preserveAspectRatio="none"
                            height="27"
                            width="27"
                            viewBox="4.8 4.56 14.832 15.408"
                            fill="none"
                            >
                        <path
                            d="M8.16 6.65002H15.83C16.47 6.65002 16.99 7.17002 16.99 7.81002V9.09002C16.99 9.56002 16.7 10.14 16.41 10.43L13.91 12.64C13.56 12.93 13.33 13.51 13.33 13.98V16.48C13.33 16.83 13.1 17.29 12.81 17.47L12 17.98C11.24 18.45 10.2 17.92 10.2 16.99V13.91C10.2 13.5 9.97 12.98 9.73 12.69L7.52 10.36C7.23 10.08 7 9.55002 7 9.20002V7.87002C7 7.17002 7.52 6.65002 8.16 6.65002Z"
                            stroke="#d6d6e6"
                            stroke-width="1"
                            stroke-miterlimit="10"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            ></path>
                        </svg>
                    </div>
                    <div id="search-icon">
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="24"
                            viewBox="0 0 24 24"
                            stroke-width="2"
                            stroke-linejoin="round"
                            stroke-linecap="round"
                            height="24"
                            fill="none"
                            class="feather feather-search"
                            >
                        <circle stroke="url(#search)" r="8" cy="11" cx="11"></circle>
                        <line
                            stroke="url(#searchl)"
                            y2="16.65"
                            y1="22"
                            x2="16.65"
                            x1="22"
                            ></line>
                        <defs>
                        <linearGradient gradientTransform="rotate(50)" id="search">
                        <stop stop-color="#f8e7f8" offset="0%"></stop>
                        <stop stop-color="#b6a9b7" offset="50%"></stop>
                        </linearGradient>
                        <linearGradient id="searchl">
                        <stop stop-color="#b6a9b7" offset="0%"></stop>
                        <stop stop-color="#837484" offset="50%"></stop>
                        </linearGradient>
                        </defs>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
        <div class="productos">
            <div class="card">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2ss7iQ90yvlwTKDgUGGxStwvKm3LZY7KLLA&s" alt="Suéter de Spiderman">
                <h3>Camisa semi formal</h3>
                <p>Camisa de algodon con lineas en azul</p>
            </div>
            <div class="card">
                <img src="https://leonisa.gt/cdn/shop/files/M3036_457_1200X1500_1_1024x1024.jpg?v=1722810009" alt="Sudadera Manga Larga">
                <h3>Camis manga larga</h3>
                <p>Camisa de algodon, manga larga</p>
            </div>
            <div class="card">
                <img src="https://m.media-amazon.com/images/I/81ObyhBUNAL._UY1000_.jpg" alt="Sudadera de Stitch">
                <h3>Camisa estilo playa</h3>
                <p>Camisa de lino, con detyalles en azul, para vacacionar</p>
            </div>
            <div class="card">
                <img src="https://s3-us-west-1.amazonaws.com/calzzapato/zoom/09GS3H-1.jpg" alt="Suéter de Dragon Ball">
                <h3>Camisa polo</h3>
                <p>Camisa polo muy ligera echa de algodón y polestireno</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/d3/47/69/d34769d78df2e872fbc2994be628c1b0.jpg" alt="Suéter Daisy y Yankees">
                <h3>Suéter de Daisy y Yankees</h3>
                <p>Suéter lila con diseño único</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/d9/f2/6f/d9f26f4016717e9d36a8abc6efef29c8.jpg" alt="Suéter Daisy y Yankees">
                <h3>Suéter de Rugrats</h3>
                <p>Suéter  de la serie Rugrats</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/6c/6f/6f/6c6f6f17b5fb5a090b0f3d6b9e6bec8e.jpg" alt="Suéter Daisy y Yankees">
                <h3>Suéter de carlitos rugrats</h3>
                <p>Suéter  de la serie Rugrats</p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/e4/98/cc/e498cc4bc14ba44a2b696f1d1fab9f46.jpg" alt="Suéter Daisy y Yankees">
                <h3>Suéter de  carro Toyota Supra</h3>
                <p>Suéter  de Toyota Supra  </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/55/c4/e4/55c4e457e051b552de3140ed04143386.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter  </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/55/e8/2f/55e82fe6ec5def4dd4d572fef98beb40.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter Ferrari </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/fa/73/36/fa733644ecbf16931a55857f9d374a0c.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter  Ktm </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/8f/49/ff/8f49ff4cfd1bfeba32b6e3877fd2b5af.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de one piece </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/1200x/3d/66/fa/3d66fac7da32baf0ebf0f8eb37a9f45f.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Nasa </h3>
                <p>Suéter  de Nasa    </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/91/1e/6c/911e6c28a10918cbbdb490e689debcf5.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Moto Kawasaki </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/f1/04/a0/f104a0aae3bc89f61bc6f03992187e09.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Yamaha  </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/3f/23/70/3f237063f047d025cedfd009cd79d8f3.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Moto Panigale </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/c4/a5/e7/c4a5e74eb95e04465254e7ee6c54e5b6.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Porshe </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/e9/55/8e/e9558ed36912254c84f083445c290d15.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Bmw M4 </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/00/5a/4b/005a4b652e8675eea9dd859281efc700.jpg"all="Suéter Daisy y Yankees">
                <h3>Suéter de Jeep  </h3>
                <p>Suéter      </p>
            </div>
            <div class="card">
                <img src="https://i.pinimg.com/736x/35/79/69/357969fc831ef8a9566b273f8e42fcb9.jpg"all="Suéter Daisy y Yankees">
                <h3>Sudadero Fox </h3>
                <p>Sudadero      </p>
            </div>
        </div>

    </body>
</html>
