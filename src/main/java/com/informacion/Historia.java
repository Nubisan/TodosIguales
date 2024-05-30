package com.informacion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.conexion.Conexion;

public class Historia {
	
	private int id;
	private String nombres;
	private String apellidos;
	private int edad;
	private String mensaje;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String ingresarHistoria(int id_pers, String nombres, String apellidos, int edad, String mensaje, String verificada) {
		
		String result="";
		Conexion con=new Conexion();
		PreparedStatement pr=null;
		String sql="INSERT INTO tb_historias (id_pers,"
				+ "nombres,apellidos,edad,mensaje,verificada) "
				+ "VALUES(?,?,?,?,?,?)";
		
		try {
			pr=con.getConexion().prepareStatement(sql);
			pr.setInt(1,id_pers);
			pr.setString(2, nombres);
			pr.setString(3, apellidos);
			pr.setInt(4, edad);
			pr.setString(5, mensaje);
			pr.setString(6, verificada);
			
			if(pr.executeUpdate()==1) {
				result="Historia entra a verificación";
			} else {
				result="Error al enviar la historia";
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
	
	public String consultarHistorias() { 
		
		String aceptada = "no";
		String sql="SELECT * FROM tb_historias WHERE verificada='"+aceptada+"' ORDER BY id_hist"; 
		Conexion con=new Conexion(); 
		String tabla="<table border=2><th>ID</th><th>NOMBRES</th><th>APELLIDOS</th><th>EDAD</th><th>MENSAJE</th>"; 
		ResultSet rs=null; 
		rs=con.Consulta(sql); 
		
		try { 
			while(rs.next()) { 
				tabla+="<tr><td>"+rs.getInt(1)+"</td>" 
						+ "<td>"+rs.getString(3)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>" 
						+ "<td>"+rs.getInt(5)+"</td>" 
						+ "<td>"+rs.getString(6)+"</td>" 
						+ "<td>"+rs.getString(7)+"</td>" 
						+ "<td> <a href= verificarHistoria.jsp?cod=" + rs.getInt(1) + "><pre style=\"text-align:center\">Publicar</pre></a></td>"
						+ "<td> <a href= eliminarHistoria.jsp?cod=" + rs.getInt(1) + " \"><pre style=\"text-align:center\">Eliminar</pre></a></td>"
						+ "</tr>";
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
			System.out.print(e.getMessage()); 
		} 
		tabla+="</table>"; 
		return tabla; 
	}
	
	public boolean verificarHistoria(int id) {
		
		boolean agregado = false;
		Conexion con=new Conexion();
		String aceptada= "si";
		String sql = "UPDATE tb_historias SET verificada = '"+aceptada+"' WHERE id_hist ='"+id+ "'";
		
		try {
			con.Ejecutar(sql);
			agregado = true;
		} catch (Exception e) {
			agregado = false;
		}
		
		return agregado;
	}
	
	public static List<Historia> obtenerHistorias() {
        String aceptada = "si";
        String sql = "SELECT id_hist, nombres, apellidos, edad, mensaje FROM tb_historias WHERE verificada = ?";
        List<Historia> historias = new ArrayList<>();
        Conexion con = new Conexion();
        ResultSet rs = null;

        try {
            PreparedStatement ps = con.getConexion().prepareStatement(sql);
            ps.setString(1, aceptada);
            rs = ps.executeQuery();

            while (rs.next()) {
                Historia historia = new Historia();
                historia.setId(rs.getInt("id_hist"));
                historia.setNombres(rs.getString("nombres"));
                historia.setApellidos(rs.getString("apellidos"));
                historia.setEdad(rs.getInt("edad"));
                historia.setMensaje(rs.getString("mensaje"));
                historias.add(historia);
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
        return historias.isEmpty() ? null : historias;
    }

	public boolean eliminarHistoria(int cod) {
		
		boolean eliminado = false;
		Conexion con=new Conexion();
		String sql = "DELETE FROM tb_historias WHERE id_hist ='" + cod + "'";
		
		try {
			con.Ejecutar(sql);
			eliminado = true;
		} catch (Exception e) {
			eliminado = false;
		}
		
		return eliminado;
	}
}
