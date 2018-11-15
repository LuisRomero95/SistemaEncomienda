
package dao;

import java.util.List;
import java.sql.*;
import java.util.*;
import modelado.Usuario;

public class UsuarioDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception{
        Usuario u = (Usuario) obj;
        PreparedStatement pst;
        String sql="INSERT INTO usuarios (nom, pass, email, id_nivel) VALUES(?,?,?,?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getNom());
            pst.setString(2, u.getPassword());
            pst.setString(3, u.getEmail());
            pst.setString(4, u.getNivel());
            pst.executeUpdate();            
           
        }
        catch ( SQLException e) {
            throw e;
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public void eliminar(Object obj) throws Exception {
        Usuario u = (Usuario) obj;
        PreparedStatement pst;
        String sql="UPDATE usuarios SET estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, u.getId());
            pst.executeUpdate();            
                 
        } catch (SQLException e) {
            throw e;            
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public void modificar(Object obj) throws Exception  {
        Usuario u = (Usuario) obj;
        PreparedStatement pst;        
        String sql = "UPDATE usuarios SET nom=?, pass=?, email=?, id_nivel=? WHERE id=? AND estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getNom());
            pst.setString(2, u.getPassword());            
            pst.setString(3, u.getEmail());
            pst.setString(4, u.getNivel());            
            pst.setInt(5, u.getId()); 
            pst.executeUpdate();            
        } catch ( SQLException e) {                     
        }
        finally{
            this.cerrar();            
        }
    }
    
    @Override
    public List<Usuario> consultar() throws Exception  {
        List<Usuario> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT u.id, u.nom, u.pass, u.email, tp.nom FROM usuarios u, tiposusuarios tp WHERE u.id_nivel = tp.id AND u.estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Usuario(
                        rs.getInt("u.id"),
                        rs.getString("u.nom"),
                        rs.getString("u.pass"),
                        rs.getString("u.email"),
                        rs.getString("tp.nom"))                    
                );
            }
        } catch (SQLException e ) {
            throw e;
        }
        finally{
            this.cerrar();
        }
        return datos;
    }
    
    @Override
    public Usuario BuscarPorId(int id) throws Exception  {        
        Usuario usuario = new Usuario();
        PreparedStatement pst;
        ResultSet res;
        String sql = "SELECT u.id, u.nom, u.pass, u.email, tp.nom FROM usuarios u, tiposusuarios tp WHERE u.id_nivel = tp.id AND u.id=? AND u.estado = 1";
        try {
           this.conectar();
           pst = conexion.prepareStatement(sql);
           pst.setInt(1,id);  

           res = pst.executeQuery();                                    
            if (res.next()) {
                usuario.setNom(res.getString("u.nom"));
                usuario.setPassword(res.getString("u.pass"));
                usuario.setEmail(res.getString("u.email"));
                usuario.setNivel(res.getString("tp.nom"));
                usuario.setId(res.getInt("u.id"));
            }                       

        } catch ( SQLException e ) {
        }
        finally{
           this.cerrar();
        }
        return usuario;
    }     
    
    public boolean ConsultarEmail(String email) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM usuarios WHERE email='"+email+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }  
    
    @Override
    public boolean ConsultarNombre(String nom) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM usuarios WHERE nom='"+nom+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }           
}
