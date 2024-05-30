<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.informacion.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Administrador</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<main>
		<header id="menu">
			<div class="contenedor">
				<a href= "#" class="logo">Todos somos <span>Iguales</span></a>
                    
				<nav class="navbar">
					<a href="#" class="active">Verificar Historias</a>
                    <a href="ingresarRecursos.jsp">Publicar recursos</a>
                    <a href="cerrarSesion.jsp">Cerrar Sesión</a>
				</nav>
            </div>
		</header>
        
		<section id="introduccion">
            <div class="contenedor">
                <article class="texto-video">
                	<h2><span>Verificación</span> historias personales </h2>
                	<% 
                		String eliminar = request.getParameter("error");
	                	Historia h = new Historia();
	                    String tabla = h.consultarHistorias();
	                    out.print(tabla);
                    %> 
                    <% if (eliminar != null) { %>
        				<div class="errorMessage"><%= eliminar%> </div>
    				<% } %>
                </article>
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