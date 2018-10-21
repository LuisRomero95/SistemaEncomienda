
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.TipoUsuario;

public class TipoUsuarioDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception{
        TipoUsuario tu = (TipoUsuario) obj;
        PreparedStatement pst;
        String sql="INSERT INTO tiposusuarios (nom) VALUES(?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, tu.getNom());
            pst.executeUpdate();          
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public void eliminar(Object obj) throws Exception{
        TipoUsuario tu = (TipoUsuario) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposusuarios set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, tu.getId());
            pst.executeUpdate();            
                  
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public void modificar(Object obj) throws Exception{
        TipoUsuario tp = (TipoUsuario) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposusuarios SET nom=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, tp.getNom());
            pst.setInt(2, tp.getId());
            pst.executeUpdate();            
                    
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }
    }            

    @Override
    public TipoUsuario BuscarPorId(int id) throws Exception{
           TipoUsuario tu = new TipoUsuario();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM tiposusuarios WHERE id =?";
           try {
            this.conectar();
               pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);  
               res = pst.executeQuery();                                    
                if (res.next()) {
                    tu.setNom(res.getString("nom"));
                    tu.setId(res.getInt("id"));
                }                        
            } catch (SQLException e) {
            }
            finally{
                this.cerrar();
            }
           return tu;
    }

    @Override
    public List consultar() throws Exception{
        List<TipoUsuario> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM tiposusuarios WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new TipoUsuario(
                        rs.getInt("id"),
                        rs.getString("nom")
                    )
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
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM tiposusuarios WHERE nom='"+nom+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }      
    
}
