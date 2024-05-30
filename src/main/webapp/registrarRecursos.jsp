<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrar recursos</title>
</head>
<body>
	<%
		// Recuperar los datos del formulario
		String title = request.getParameter("nombreCap");
		String obj = request.getParameter("objetivoCap");
		String url = request.getParameter("website");
						
		// Crear un objeto Recursos
		Recursos r = new Recursos();
						
		// Llamar al método para insertar los datos en la base de datos
		String resultado = r.ingresarRecurso(title,obj,url);
					
		// Mostrar el resultado de la operación
		%> 
			<jsp:forward page="ingresarRecursos.jsp"> 
			<jsp:param name="error" value="<%= resultado %>"/> 
			</jsp:forward> 
		<% 
	%>
</body>
</html>