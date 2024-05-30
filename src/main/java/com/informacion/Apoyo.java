package com.informacion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conexion.Conexion;

public class Apoyo {
	
	private String tipo;
	private String nombre;
	private String contacto;
	private String link;
	
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getContacto() {
		return contacto;
	}
	public void setContacto(String contacto) {
		this.contacto = contacto;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	public String ingresarApoyo(String tipo, String name, String contact, String sitio) {
		
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_apoyo(tipo, nombre, contacto, link) VALUES(?,?,?,?)";
		
		try {
			pr=con.getConexion().prepareStatement(sql);
			pr.setString(1,tipo);
			pr.setString(2,name);
			pr.setString(3, contact);
			pr.setString(4, sitio);
			
			if(pr.executeUpdate()==1) {
				result="Apoyo guardado exitosamente";
			} else {
				result="Error al guardar";
			}
		}
		catch(Exception ex) {
			result=ex.getMessage();
		}
		finally {
			try {
				pr.close();
				con.getConexion().close();
			}
			catch(Exception ex) {
				System.out.print(ex.getMessage());
			}
		}
		return result;
	}

	public List<Apoyo> obtenerApoyos() {
	    String sql = "SELECT tipo, nombre, contacto, link FROM tb_apoyo";
	    Conexion con = new Conexion();
	    ResultSet rs = null;
	    List<Apoyo> apoyos = new ArrayList<>();

	    try {
	        PreparedStatement ps = con.getConexion().prepareStatement(sql);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Apoyo apoyo = new Apoyo();
	            apoyo.setTipo(rs.getString("tipo"));
	            apoyo.setNombre(rs.getString("nombre"));
	            apoyo.setContacto(rs.getString("contacto"));
	            apoyo.setLink(rs.getString("link"));
	            apoyos.add(apoyo);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            con.getConexion().close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return apoyos;
	}

}
