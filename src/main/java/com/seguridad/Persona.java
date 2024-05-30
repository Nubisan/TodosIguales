package com.seguridad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.conexion.Conexion;

public class Persona {
	
	private int id;
	private int perfil;
	private String nombres;
	private String apellidos;
	private int edad;
	private String email;
	private String clave;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPerfil() {
		return perfil;
	}

	public void setPerfil(int perfil) {
		this.perfil = perfil;
	}

	public String getNombres() {
		return nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public String ingresarUsuario() { 
		
		 String result=""; 
		 Conexion con=new Conexion(); 
		 PreparedStatement pr=null; 
		 String sql="INSERT INTO tb_persona (id_perf, nombres_pers, apellidos_pers, edad_pers," 
		   + "email_pers, clave_pers) " 
		   + "VALUES(?,?,?,?,?,?)"; 
		 
		 try{ 
			 pr=con.getConexion().prepareStatement(sql); 
			 pr.setInt(1,this.getPerfil());     
			 pr.setString(2, this.getNombres()); 
			 pr.setString(3, this.getApellidos());
			 pr.setInt(4, this.getEdad());
			 pr.setString(5, this.getEmail()); 
			 pr.setString(6, this.getClave()); 
			   
			 if(pr.executeUpdate()==1) { 
				 result="El usuario ha sido registrado"; 
			 } else { 
				 result="No se pudo registrar al usuario"; 
			 } 
			 
		  } catch(Exception ex) { 
			   result=ex.getMessage(); 
			   System.out.print(result); 
		  } finally { 
			  try { 
				  pr.close(); 
			      con.getConexion().close(); 
			  } catch(Exception ex) { 
				  System.out.print(ex.getMessage()); 
			  } 
		  } 
		  return result; 
	} 
	
	public boolean verificarUsuario(String nemail, String nclave) { 
		boolean respuesta=false; 
		String sentencia= "Select * from tb_persona where email_pers='"+nemail+ 
	    "' and clave_pers='"+nclave+"';"; 
		//System.out.print(sentencia); 
		
		try {
			ResultSet rs; 
			Conexion con=new Conexion(); 
			rs=con.Consulta(sentencia); 
				   
			if(rs.next()) { 
				respuesta=true; 
				this.setEmail(nemail); 
				this.setClave(nclave); 
				this.setId(rs.getInt(1));
				this.setPerfil(rs.getInt(2));  
				this.setNombres(rs.getString(3)); 
			} else { 
				respuesta=false; 
				rs.close(); 
			} 
		} catch(Exception ex) { 
			System.out.println( ex.getMessage()); 
		} 
		return respuesta; 
	}
	
	public void consulUsuario(int id) {
		
	    Conexion con = new Conexion(); 
	    ResultSet rs = null; 
	    String sql = "SELECT nombres_pers, apellidos_pers, edad_pers FROM tb_persona WHERE id_pers = ?";

	    try (PreparedStatement ps = con.getConexion().prepareStatement(sql)) {
	        ps.setInt(1, id);
	        rs = ps.executeQuery();
	        if (rs.next()) { 
	            setNombres(rs.getString("nombres_pers"));
	            setApellidos(rs.getString("apellidos_pers"));
	            setEdad(rs.getInt("edad_pers"));
	        } else {
	            // Manejar el caso en que no se encuentra un usuario con el id dado
	            System.out.println("Usuario no encontrado.");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.print(e.getMessage());
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	                con.getConexion().close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}

}
