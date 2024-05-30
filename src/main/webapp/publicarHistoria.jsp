<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"  import = "java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historias publicadas</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

    <%
        // Crear una lista que contenga todas las historias
        List<Historia> historias = Historia.obtenerHistorias();
    %>

    <main>
        <header id="menu">
            <div class="contenedor">
                <a href="#" class="logo">Todos somos <span>Iguales</span></a>
                    
                <nav class="navbar">
                    <a href="home.jsp">Home</a>
                    <a href="#" class="active">Historias personales</a>
                    <a href="recursos.jsp">Recursos y apoyo</a>
                    <a href="videos.jsp">Sensibilización</a>
                    <a href="login.jsp">Iniciar Sesión</a>
                </nav>
            </div>
        </header>
        
        <section id="introduccion">
            <div class="contenedor">
                <h2><span>"Triunfos y Desafíos:</span> Historias Personales"</h2>
                <% if (historias != null) { %>
                    <% for (Historia historia : historias) { %>
                        <article class="historia">
                            <p><strong>Historia de</strong> <%= historia.getNombres() %> <%= historia.getApellidos() %></p>
                            <p><strong>Edad:</strong> <%= historia.getEdad() %></p>
                            <p><%= historia.getMensaje() %></p>
                        </article>
                    <% } %>
                <% } else { %>
                    <p>No se encontró ninguna historia.</p>
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
</body>
</html>
