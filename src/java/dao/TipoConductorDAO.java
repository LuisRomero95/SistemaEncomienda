
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.TipoConductor;

public class TipoConductorDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception{
        TipoConductor tp = (TipoConductor) obj;
        PreparedStatement pst;
        String sql="INSERT INTO tiposconductores (nom) VALUES(?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, tp.getNom());
            pst.executeUpdate();            

        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public void eliminar(Object obj) throws Exception{
        TipoConductor tp = (TipoConductor) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposconductores SET estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, tp.getId());
            pst.executeUpdate();            

        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
    }

    @Override
    public void modificar(Object obj) throws Exception{
        TipoConductor tp = (TipoConductor) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposconductores SET nom=? WHERE id=?";
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
    public TipoConductor BuscarPorId(int id) throws Exception{
           TipoConductor tp = new TipoConductor();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM tiposconductores WHERE id =?";
           try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);  
               res = pst.executeQuery();                                    
                if (res.next()) {
                    tp.setNom(res.getString("nom"));
                    tp.setId(res.getInt("id"));
                }                   
     
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
           return tp;
    }

    @Override
    public List consultar() throws Exception{
        List<TipoConductor> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM tiposconductores WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            //ejecutar mi consulta y recuperar los resultados en rs
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new TipoConductor(
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
        String sql = "SELECT * FROM tiposconductores WHERE nom='"+nom+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }           
    
}
