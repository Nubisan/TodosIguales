<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*" import = "java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Recursos y apoyo</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<%  
	    // Crear instancia de la clase que tiene el método
	    Recursos recurso = new Recursos();
		List<Recursos> recursos = recurso.obtenerRecursos();
		boolean recursosPublicados = (recursos != null && !recursos.isEmpty());
		
		Apoyo apoyo = new Apoyo();
		List<Apoyo> apoyos = apoyo.obtenerApoyos();
		boolean apoyosPublicados = (apoyos != null && !apoyos.isEmpty());
	%>
	
	<main>
		<header id="menu">
			<div class="contenedor">
				<a href= "#" class="logo">Todos somos <span>Iguales</span></a>
                    
				<nav class="navbar">
					<a href="home.jsp">Home</a>
					<a href="publicarHistoria.jsp">Historias personales</a>
                    <a href="#" class="active">Recursos y apoyo</a>
                    <a href="videos.jsp">Sensibilización</a>
                    <a href="login.jsp">Iniciar Sesión</a>
				</nav>
            </div>
		</header>
	
        
		<section id="introduccion">
            <div class="contenedor">
            <h2>APOYO</h2>
                <article class="apoyo">
                	<% if (apoyosPublicados) { %>
                        <% for (Apoyo apoyoIndividual : apoyos) { %>
                            <p><%= apoyoIndividual.getTipo() %></p>
                            <p><strong>Nombre:</strong> <%= apoyoIndividual.getNombre() %></p>
                            <p><strong>Contacto:</strong> <%= apoyoIndividual.getContacto() %></p>
                            <p><strong>Sitio web:</strong> <a href="<%= apoyoIndividual.getLink() %>"><%= apoyoIndividual.getLink() %></a> </p>
                        <% } %>
                    <% } else { %>
                        <p>No se ha publicado ningún apoyo todavía.</p>
                    <% } %>
                </article>
            </div>
        </section>
        
        <section id="recursos">
            <div class="contenedor">
            <h2>RECURSOS</h2>
            <% if (recursosPublicados) { %>
            	<div id="carouselExample" class="carousel carousel-dark slide">
				  <div class="carousel-inner">
				    <% for (int i = 0; i < recursos.size(); i++) { %>
					    <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
					      <div class="cards-wrapper">
					      	<div class="card">
					      	  <div class="image-wrapper">
					      	    <img src="imagenes/capacitacion.png" alt="Imagen capacitación">
					      	  </div>
							  <div class="card-body">
							    <h5 class="card-title"><%= recursos.get(i).getNombre_rec() %></h5>
							    <p class="card-text"><strong>Objetivo:</strong> <%= recursos.get(i).getObjetivo_rec() %>.</p>
							    <a href="<%= recursos.get(i).getLink_rec() %>" target="_blank" class="btn btn-primary">Continuar</a>
							  </div>
							</div>
					      </div>
					    </div>
				    <% } %>
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Anterior</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Siguiente</span>
				  </button>
				</div>
			<% } else { %>
                <p>No se ha publicado ningún recurso todavía.</p>
            <% } %> 
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
