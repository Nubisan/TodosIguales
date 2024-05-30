<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.seguridad.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar usuario</title>
</head>
<body>
	<%
		// Recuperar los datos del formulario
		String nombres = request.getParameter("nombres");
		String apellidos = request.getParameter("apellidos");
		int edad = Integer.parseInt(request.getParameter("edad"));
		String email = request.getParameter("email");
		String clave = request.getParameter("clave");
						
		// Crear un objeto Usuario y establecer sus atributos
		Persona usuario = new Persona();
		usuario.setPerfil(2);
		usuario.setNombres(nombres);
		usuario.setApellidos(apellidos);
		usuario.setEdad(edad);
		usuario.setEmail(email);
		usuario.setClave(clave);
						
		// Llamar al método ingresarUsuario para insertar los datos en la base de datos
		String resultado = usuario.ingresarUsuario();
					
		// Mostrar el resultado de la operación
		%> 
			<jsp:forward page="login.jsp"> 
			<jsp:param name="error" value="<%= resultado %>"/> 
			</jsp:forward> 
		<% 
	%>
</body>
</html>