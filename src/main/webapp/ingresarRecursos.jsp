<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Ingresar Recursos y apoyo</title>
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
                    <a href="admin.jsp">Verificar Historias</a>
                    <a href="#" class="active">Publicar recursos</a>
				</nav>
            </div>
		</header>
        
		<section id="login">
            <div class="contenedor">
                <article class="form">
                	<%String message = request.getParameter("error");%> 
                	<h2>Añadir nuevo Recurso</h2>
                	
                	<form action="registrarRecursos.jsp" method="post">
                	               
                    	<div class="datos">               		
	                    	<label for="nombreCap">Título: </label> 
	                        <input type="text" id="nombreCap" name="nombreCap" pattern="[a-zA-ZÀ-ÿ\s]+" title="Ingrese solo letras y espacios" required />
	                        
	                        <label for="objetivoCap">Objetivo: </label>
							<textarea rows="10" cols="10" id="objetivoCap" name="objetivoCap" required></textarea>
							
	                        <label for="website">URL:</label>
							<input type="url" id="website" name="website" placeholder="https://example.com" required>                           
						</div>
						
                        <div class="button">
                            <input type="submit" class="btn-1" value="Publicar"/>
                            <input type="reset" class="btn-2" value="Borrar"/>
                        </div>  
                                                                               
					</form> 
					
					<% if (message != null) { %>
        				<div class="errorMessage"><%= message %></div>
    				<% } %>
                </article>
                
                <article class="form">
                	<%String errorMessage = request.getParameter("error");%> 
                    <h2>Añadir nueva Ayuda</h2>
                    
                    <form action="registrarApoyo.jsp" method="post">
                    
                    	<div class="datos">                  		
	                    	<label for="tipoApoyo">Tipo de apoyo: </label> 
	                        <input type="text" id="tipoApoyo" name="tipoApoyo" pattern="[a-zA-ZÀ-ÿ\s]+" title="Ingrese solo letras y espacios" required />
	                            
	                        <label for="nombre">Nombre: </label>  
	                        <input type="text" id="nombre" name="nombre" pattern="[a-zA-ZÀ-ÿ\s]+" placeholder="Persona u Organización" title="Ingrese solo letras y espacios" required />
	                        
	                        <label for="phone">Contacto:</label>
							<input type="tel" id="phone" name="phone" pattern="[0-9]{10}" placeholder="0989999999">

	                        <label for="site">Sitio web:</label>
							<input type="url" id="site" name="site" placeholder="https://example.com">
						</div>
						
                        <div class="button">
                            <input type="submit" class="btn-1" value="Publicar"/>
                            <input type="reset" class="btn-2" value="Borrar"/>
                        </div> 
                                                                            
					</form> 
					
					<% if (errorMessage != null) { %>
        				<div class="errorMessage"><%= errorMessage %></div>
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