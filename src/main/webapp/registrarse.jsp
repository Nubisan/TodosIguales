<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Registrarse</title>
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
					<a href="home.jsp" >Home</a>
					<a href="publicarHistoria.jsp">Historias personales</a>
                    <a href="recursos.jsp">Recursos y apoyo</a>
                    <a href="videos.jsp">Sensibilización</a>
                    <a href="login.jsp">Iniciar Sesión</a>
				</nav>
            </div>
		</header>
        
		<section id="login">
            <div class="contenedor">
                <article class="form">
                    <h2>Formulario de Registro</h2>
                    <form action="registrarPersona.jsp" method="post">
                    
                    	<fieldset class="datos">
                    		<legend>Datos del usuario</legend>
                    		
	                    	<label for="nombres">Nombres: </label> 
	                        <input type="text" id="nombres" name="nombres" pattern="^([a-zA-ZÀ-ÿ]+(\s[a-zA-ZÀ-ÿ]+){1,2})$" title="Ingrese hasta 3 nombres, separados por espacios" required />
	                            
	                        <label for="apellidos">Apellidos: </label>  
	                        <input type="text" id="apellidos" name="apellidos" pattern="^([a-zA-ZÀ-ÿ]+(\s[a-zA-ZÀ-ÿ]+){0,1})$" title="Ingrese 2 apellidos, separados por espacios"  required />
	                        
	                        <label for="edad">Edad: </label>  
	                        <input type="number" id="edad" name="edad" min="20" max="65" placeholder="Edad requerida de 20 a 65" title="Ingrese solo números del 20 al 65" required>
	                        
	                        <label for="email">Email: </label> 
	                        <input type="email" id="email" name="email" placeholder="usuario@nombreProveedor.dominio" required/> 
	                        
	                        <label for="clave">Contraseña: </label> 
	                        <input type="password" id="clave" name="clave" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}" title="Debe contener al menos 8 caracteres, incluyendo mayúsculas, minúsculas, un número y un carácter especial" required>
						</fieldset>
						
                        <div class="button">
                            <input type="submit" class="btn-1" value="Registrarse"/>
                            <input type="reset" class="btn-2" value="Borrar"/>
                        </div> 
                                                                            
					</form> 
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