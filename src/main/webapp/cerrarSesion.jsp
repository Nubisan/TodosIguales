<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cerrar Sesión</title>
</head>
<body>
	<% 
		HttpSession sesionOk = request.getSession(false); // Obtiene la sesión existente
	    if (sesionOk != null) {
	    	sesionOk.invalidate(); // Invalida la sesión si existe
	    }
	    response.sendRedirect("login.jsp"); // Redirige a la página de inicio de sesión
	%>	
</body>
</html>