
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.Precio;

public class PrecioDAO extends Conexion implements DAO{    

    @Override
    public void insertar(Object obj) throws Exception {
        Precio u = (Precio) obj;
        PreparedStatement pst;
        String sql="INSERT INTO precios (tipo, cant, peso, result) VALUES(?,?,?,?)";
        //conectarse a la bd
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getTipo());
            pst.setInt(2, u.getCantidad());
            pst.setDouble(3, u.getPeso());
            pst.setDouble(4, u.getResultado());
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
        Precio u = (Precio) obj;
        PreparedStatement pst;
        String sql="UPDATE precios SET estado = 0 WHERE id = ?";
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
    public void modificar(Object obj) throws Exception {
        Precio u = (Precio) obj;
        PreparedStatement pst;        
        String sql = "UPDATE precios SET tipo=?, cant=?, peso=?, result=? WHERE id=? AND estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getTipo());
            pst.setInt(2, u.getCantidad());
            pst.setDouble(3, u.getPeso());
            pst.setDouble(4, u.getResultado());         
            pst.setInt(5, u.getId()); 
            pst.executeUpdate();            
        } catch ( SQLException e) {                     
        }
        finally{
            this.cerrar();            
        }        
    }

    @Override
    public List consultar() throws Exception {
        List<Precio> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT id, tipo, cant, peso, result FROM precios WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            //ejecutar mi consulta y recuperar los resultados en rs
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Precio(
                        rs.getInt("id"),
                        rs.getString("tipo"),
                        rs.getInt("cant"),
                        rs.getDouble("peso"),
                        rs.getDouble("result")
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
    public Precio BuscarPorId(int id) throws Exception {
        Precio usuario = new Precio();
        PreparedStatement pst;
        ResultSet res;
        String sql = "SELECT id, tipo, cant, peso, result FROM precios WHERE estado = 1 AND id=?";
        try {
           this.conectar();
           pst = conexion.prepareStatement(sql);
           pst.setInt(1,id);  

           res = pst.executeQuery();                                    
            if (res.next()) {
                usuario.setTipo(res.getString("tipo"));
                usuario.setCantidad(res.getInt("cant"));
                usuario.setPeso(res.getDouble("peso"));                
                usuario.setResultado(res.getDouble("result"));
                usuario.setId(res.getInt("id"));
            }                       

        } catch ( SQLException e ) {
        }
        finally{
           this.cerrar();
        }
        return usuario;        
    }

    @Override
    public boolean ConsultarNombre(String nom) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
