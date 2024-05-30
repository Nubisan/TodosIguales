<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Iniciar Sesión</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link rel="stylesheet" type="text/css" href="css/estilo_form.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	</head>
<body>
	<main>
		<header id="menu">
			<div class="contenedor">
				<a href= "#" class="logo">Todos somos <span>Iguales</span></a>
                    
				<nav class="navbar">
					<a href="home.jsp">Home</a>
					<a href="publicarHistoria.jsp">Historias personales</a>
                    <a href="recursos.jsp">Recursos y apoyo</a>
                    <a href="videos.jsp">Sensibilización</a>
                    <a href="#" class="active">Iniciar Sesión</a>
				</nav>
            </div>
		</header>
        
		<section id="login">
            <div class="contenedor">
                <article class="form">
                	<%String errorMessage = request.getParameter("error");%>      	
                	
                    <h2>Iniciar Sesión</h2>
                    <form action="verificarPersona.jsp" method="post">
                    	<div class="datos">
                    		<label for="usuario">Email: </label>
                    		<input type="email" id="usuario" name="usuario" placeholder="usuario@nombreProveedor.dominio">
                    	
                    		<label for="clave">Contraseña: </label>
                        	<input type="password" id="clave" name="clave">
                    	</div>
                        
                        <div class="button">
                            <input type="submit" class="btn-1" value="Iniciar Sesión"/>
                            <input type="reset" class="btn-2" value="Borrar"/>
                        </div> 
                        
                        <a href="registrarse.jsp">Registrarse</a>
                    </form>
                        
                        <% if (errorMessage != null) { %>
        				<div class="errorMessage"><%= errorMessage %></div>
    					<% } %>
                </article>
                
                <div class="imagen">
                	<img alt="Imagen de personas animadas con discapacidades" src="imagenes/logo.png">
                </div>
                
            </div>
        </section>
        
        <footer id="footer">
            <div class="contenedor">
                <div class="social_icon">         	
                    <a href="https://www.facebook.com/RomeoSantosOfficial" target="_blank"><i class='bx bxl-facebook-circle'></i></a>
                    <a href="https://www.youtube.com/user/romeo" target="_blank"><i class='bx bxl-youtube'></i></a>
                </div> 
                
                <p>© 2024 Todos somos Iguales | Todos los derechos reservados</p>
            </div>
        </footer>
	</main>
</body>
</html>