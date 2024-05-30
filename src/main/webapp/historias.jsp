<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.seguridad.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Formulario historias</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link rel="stylesheet" type="text/css" href="css/estilo_history.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<main>
		<header id="menu">
			<div class="contenedor">
				<a href= "#" class="logo">Todos somos <span>Iguales</span></a>
                    
				<nav class="navbar">
					<a href="#" class="active">Publicar historia</a>
                    <a href="cerrarSesion.jsp">Cerrar Sesión</a>
				</nav>
            </div>
		</header>
        
		<section id="history">
            <div class="contenedor">
                <article class="form">
                	<% 
                    	HttpSession sesion = request.getSession();
                    	int id = (Integer)sesion.getAttribute("id");
                    	
                    	Persona p = new Persona(); 
                        p.consulUsuario(id);
                        
                        String message = request.getParameter("validar");
                    %>
                    
                    <h2>Escriba su <span>historia</span></h2>
                    
                    <form name="historiaPersonal"action="ingresarHistoria.jsp" method="post">
                    
                    	<div class="datos">		
							<label for="consulNombres">Nombres: </label> 
		                    <input type="text" id="consulNombres" name="consulNombres" pattern="[a-zA-Z\s]+" title="Ingrese solo letras y espacios" 
		                    placeholder="Ingrese solo letras y espacios" value="<%=p.getNombres()%>" required />
		                            
		                    <label for="apellidos">Apellidos: </label>  
		                    <input type="text" id="apellidos" name="consulApellidos" pattern="[a-zA-Z\s]+" title="Ingrese solo letras y espacios" 
		                    placeholder="Ingrese solo letras y espacios" value="<%=p.getApellidos()%>" />
		                        
		                    <label for="edad">Edad: </label> 
		                    <input type="number" id="edad" name="consulEdad" min="20" max="65" title="Ingese números del 20 al 65"
		                     placeholder="Ingese números del 20 al 65" value="<%=p.getEdad()%>" required /> 
		                    
		                    <label for="mensaje">Mensaje: </label>
							<textarea rows="10" cols="30" id="mensaje" name="mensaje" placeholder="Escriba su historia" required></textarea>
						</div>
						   
                        <div class="button">
                            <input type="submit" class="btn-1" value="Enviar"/>
                            <input type="reset" class="btn-2" value="Borrar"/>
                        </div> 
                                                                         
					</form> 
					<% if (message != null) { %>
        				<div class="errorMessage"><%= message%> </div>
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