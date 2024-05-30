package com.informacion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conexion.Conexion;

public class Recursos {
	
	private String nombre_rec;
	private String objetivo_rec;
	private String link_rec;
	
	
	public String getNombre_rec() {
		return nombre_rec;
	}

	public void setNombre_rec(String nombre_rec) {
		this.nombre_rec = nombre_rec;
	}

	public String getObjetivo_rec() {
		return objetivo_rec;
	}

	public void setObjetivo_rec(String objetivo_rec) {
		this.objetivo_rec = objetivo_rec;
	}

	public String getLink_rec() {
		return link_rec;
	}

	public void setLink_rec(String link_rec) {
		this.link_rec = link_rec;
	}

	public String ingresarRecurso(String nombreCap, String objetivo, String website) {
		
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_recursos (nombre_rec,"
				+ "objetivo_rec,link_rec) "
				+ "VALUES(?,?,?)";
		
		try {
			pr=con.getConexion().prepareStatement(sql);
			pr.setString(1,nombreCap);
			pr.setString(2, objetivo);
			pr.setString(3, website);
			
			if(pr.executeUpdate()==1) {
				result="Recurso guardado exitosamente";
			} else {
				result="Error al guardar el recurso";
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

	public List<Recursos> obtenerRecursos() {
		
	    String sql = "SELECT nombre_rec, objetivo_rec, link_rec FROM tb_recursos";
	    Conexion con = new Conexion();
	    ResultSet rs = null;
	    List<Recursos> recursos = new ArrayList<>();

	    try {
	        PreparedStatement ps = con.getConexion().prepareStatement(sql);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Recursos recurso = new Recursos();
	            recurso.setNombre_rec(rs.getString("nombre_rec"));
	            recurso.setObjetivo_rec(rs.getString("objetivo_rec"));
	            recurso.setLink_rec(rs.getString("link_rec"));
	            recursos.add(recurso);
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
	    return recursos;
	}

}
