<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Eliminar Historia</title>
</head>
<body>
	<%
		int cod = Integer.parseInt(request.getParameter("cod"));
        Historia he = new Historia();
        boolean f = he.eliminarHistoria(cod);
        if (f == true) {
        	response.sendRedirect("historias.jsp");
        } else {
        	%> 
    		<jsp:forward page="historias.jsp"> 
    		<jsp:param name="error" value="No se pudo eliminar la historia"/> 
    		</jsp:forward> 
    		<% 
	    }
	%>
</body>
</html>