<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		HttpSession sesion = request.getSession();
		int id = (Integer)sesion.getAttribute("id");
	
		int id_pers = id;
		String nombres = request.getParameter("consulNombres");
		String apellidos = request.getParameter("consulApellidos");
		int edad = Integer.parseInt(request.getParameter("consulEdad"));
		String mensaje = request.getParameter("mensaje");
		String verificada = "no";
		Historia h = new Historia();
		String ingreso = h.ingresarHistoria(id,nombres,apellidos,edad,mensaje,verificada);
		                  
		%> 
		<jsp:forward page="historias.jsp"> 
		<jsp:param name="validar" value="<%=ingreso %>"/> 
		</jsp:forward> 
		<% 
	%>
</body>
</html>