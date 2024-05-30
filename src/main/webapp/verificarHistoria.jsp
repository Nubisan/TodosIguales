<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.informacion.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Verificar historia</title>
</head>
<body>


	<%
	    // Obtener el ID de la historia desde el parámetro
	    int id = Integer.parseInt(request.getParameter("cod"));
	    
	    // Crear instancia de la clase que tiene el método obtenerHistoria
	    Historia historia = new Historia();
	    boolean respuesta = historia.verificarHistoria(id);
	    
	    if(respuesta) {
	    	System.out.print("Historia publica");
	    } else {
	    	System.out.print("Historia no publica");
	    }
	%>
	
</body>
</html>