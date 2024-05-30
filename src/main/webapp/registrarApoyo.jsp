<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar Apoyo</title>
</head>
<body>
	<%
		// Recuperar los datos del formulario
		String tipo = request.getParameter("tipoApoyo");
		String name = request.getParameter("nombre");
		String contact = request.getParameter("phone");
		String sitio = request.getParameter("site");
						
		// Crear un objeto Recursos
		Apoyo a = new Apoyo();
		
		// Llamar al método para insertar los datos en la base de datos
		String respuesta = a.ingresarApoyo(tipo,name,contact,sitio);
					
		// Mostrar el resultado de la operación
		%> 
			<jsp:forward page="ingresarRecursos.jsp"> 
			<jsp:param name="error" value="<%= respuesta %>"/> 
			</jsp:forward> 
		<% 	
	%>
</body>
</html>