package dao;

import java.sql.*;
import java.util.*;
import modelado.Ayudante;

public class AyudanteDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception{
        Ayudante ayudante = (Ayudante) obj;
        PreparedStatement pst;
        String sql="INSERT INTO ayudantes (dni, nom, ape, direc, tel, email) VALUES(?,?,?,?,?,?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, ayudante.getDni());            
            pst.setString(2, ayudante.getNom());
            pst.setString(3, ayudante.getApe());
            pst.setString(4, ayudante.getDirec());            
            pst.setString(5, ayudante.getTel());            
            pst.setString(6, ayudante.getEmail());
            pst.executeUpdate();           
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public void eliminar(Object obj) throws Exception{
        Ayudante ayudante = (Ayudante) obj;
        PreparedStatement pst;
        String sql="UPDATE ayudantes set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, ayudante.getId());
            pst.executeUpdate();         
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public void modificar(Object obj) throws Exception{
        Ayudante ayudante = (Ayudante) obj;
        PreparedStatement pst;
        String sql="UPDATE ayudantes SET dni=?, nom=?, ape=?, direc=?, tel=?, email=? WHERE id=?";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, ayudante.getDni());
            pst.setString(2, ayudante.getNom());
            pst.setString(3, ayudante.getApe());
            pst.setString(4, ayudante.getDirec());
            pst.setString(5, ayudante.getTel());
            pst.setString(6, ayudante.getEmail());            
            pst.setInt(7, ayudante.getId());
            pst.executeUpdate();       
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public Ayudante BuscarPorId(int id) throws Exception{
           Ayudante ayudante = new Ayudante();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM ayudantes WHERE id = ?";
           try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);  
               res = pst.executeQuery();                                    
                if (res.next()) {
                    ayudante.setNom(res.getString("nom"));            
                    ayudante.setApe(res.getString("ape"));      
                    ayudante.setDni(res.getString("dni"));                    
                    ayudante.setDirec(res.getString("direc"));
                    ayudante.setTel(res.getString("tel"));                    
                    ayudante.setEmail(res.getString("email"));                   
                    ayudante.setId(res.getInt("id"));
                }                   
     
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
           return ayudante;
    }

    @Override
    public List<Ayudante> consultar() throws Exception{
        List<Ayudante> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM ayudantes WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Ayudante(
                        rs.getInt("id"),                       
                        rs.getString("nom"),
                        rs.getString("ape"),
                        rs.getString("dni"),
                        rs.getString("direc"),
                        rs.getString("tel"),
                        rs.getString("email"))
                );
            }
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
        return datos;
    }

    @Override
    public boolean ConsultarNombre(String nom) throws SQLException{
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }    
    public boolean ConsultarDNI(String nombre) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM ayudantes WHERE dni='"+nombre+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }       

    public boolean ConsultarEmail(String email) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM ayudantes WHERE email='"+email+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }     
}
