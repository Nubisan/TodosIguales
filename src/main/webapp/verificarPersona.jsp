<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true" import="com.seguridad.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Verificar usuario</title>
</head>
<body>
	<% 
		Persona usuario=new Persona(); 
		String nemail=request.getParameter("usuario"); 
		String nclave=request.getParameter("clave"); 
						 
		HttpSession sesion=request.getSession();  //Se crea la variable de sesión 
		boolean respuesta=usuario.verificarUsuario(nemail,nclave); 
						
		if (respuesta) { 
			sesion.setAttribute("usuario", usuario.getNombres()); //Se añade atributos 
			sesion.setAttribute("perfil", usuario.getPerfil());  //Se añade atributos
			sesion.setAttribute("id", usuario.getId());
			
			int perfil=(Integer)sesion.getAttribute("perfil");
			
			if(perfil == 2){
				response.sendRedirect("historias.jsp");  //Se redirecciona a una página del sitio personal del usuario 
			} else {
				response.sendRedirect("admin.jsp");  //Se redirecciona a una página del sitio personal del administrador 
			}
		} else { 
			%> 
				<jsp:forward page="login.jsp"> 
				<jsp:param name="error" value="Datos incorrectos.<br>Vuelva a intentarlo."/> 
				</jsp:forward> 
			<% 
		} 
	%>
</body>
</html>