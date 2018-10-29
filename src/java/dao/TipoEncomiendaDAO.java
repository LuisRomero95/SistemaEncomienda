
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.TipoEncomienda;


public class TipoEncomiendaDAO extends Conexion implements DAO{

    @Override
    public void insertar(Object obj) throws Exception {
        TipoEncomienda te = (TipoEncomienda) obj;
        PreparedStatement pst;
        String sql="INSERT INTO tiposencomiendas (nom) VALUES(?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, te.getNom());
            pst.executeUpdate();          
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }           
    }

    @Override
    public void eliminar(Object obj) throws Exception {
        TipoEncomienda te = (TipoEncomienda) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposencomiendas set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, te.getId());
            pst.executeUpdate();            
                  
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }     
    }

    @Override
    public void modificar(Object obj) throws Exception {
        TipoEncomienda te = (TipoEncomienda) obj;
        PreparedStatement pst;
        String sql="UPDATE tiposencomiendas SET nom=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, te.getNom());
            pst.setInt(2, te.getId());
            pst.executeUpdate();            
                    
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }        
    }

    @Override
    public List consultar() throws Exception {
        List<TipoEncomienda> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM tiposencomiendas WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new TipoEncomienda(
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
    public TipoEncomienda BuscarPorId(int id) throws Exception {
           TipoEncomienda tu = new TipoEncomienda();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM tiposencomiendas WHERE id =?";
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
    public boolean ConsultarNombre(String nom) throws Exception {
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM tiposencomiendas WHERE nom='"+nom+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();        
    }
    
}
