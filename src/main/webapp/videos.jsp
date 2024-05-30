<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Videos</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
		<header id="menu">
			<div class="contenedor">
				<a href= "#" class="logo">Todos somos <span>Iguales</span></a>
                    
				<nav class="navbar">
					<a href="home.jsp" >Home</a>
					<a href="publicarHistoria.jsp">Historias personales</a>
                    <a href="recursos.jsp">Recursos y apoyo</a>
                    <a href="#" class="active">Sensibilización</a>
                    <a href="login.jsp">Iniciar Sesión</a>
				</nav>
            </div>
		</header>
		
		<section id="introduccion">
			<h2>Galeria de Videos</h2>
			<div class="container">
			
			  <div class="video-container">
			    
			    <iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/OjYolgiMk2I?si=t3s0r-xVx5H7uwlc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			    <iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/6LGqtdPEDyM?si=Jsq2ugKbEl3zb_0V" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			    <iframe class="video" width="560" height="315" src="https://www.youtube.com/embed/aMpMPj0mDdY?si=c_KB12AH7psQt7bO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			 
			  </div>
			</div>
		</section>

		<footer id="footer">
            <div class="contenedor">
                <div class="social_icon">         	
                    <a href="https://www.facebook.com/RomeoSantosOfficial" target="_blank"><i class='bx bxl-facebook-circle'></i></a>
                    <a href="https://www.youtube.com/user/romeo" target="_blank"><i class='bx bxl-youtube'></i></a>
                    <a href="https://www.linkedin.com/in/nubia-araujo-9b3646308/" target="_blank"><i class='bx bxl-linkedin-square'></i></a>
                </div> 
                
                <p>© 2024 Todos somos Iguales | Todos los derechos reservados</p>
            </div>
        </footer>
</body>
</html>