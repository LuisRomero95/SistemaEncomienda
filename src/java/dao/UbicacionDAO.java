
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.Ubicacion;


public class UbicacionDAO extends Conexion implements DAO{

    @Override
    public void insertar(Object obj) throws Exception {
        Ubicacion u = (Ubicacion) obj;
        PreparedStatement pst;
        
        String sql="INSERT INTO ubicaciones (titulo, cx, cy) VALUES(?,?,?)";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getTitulo());
            pst.setString(2, u.getCx());
            pst.setString(3, u.getCy());
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
        Ubicacion u = (Ubicacion) obj;
        PreparedStatement pst;
        String sql="UPDATE ubicaciones SET estado = 0 WHERE id = ?";
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
        Ubicacion u = (Ubicacion) obj;
        PreparedStatement pst;        
        String sql = "UPDATE usuarios SET titulo=?, cx=?, cy=? WHERE id=? AND estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, u.getTitulo());
            pst.setString(2, u.getCx());            
            pst.setString(3, u.getCy());            
            pst.setInt(4, u.getId()); 
            pst.executeUpdate();            
        } catch ( SQLException e) {                     
        }
        finally{
            this.cerrar();            
        }
    }

    @Override
    public List<Ubicacion> consultar() throws Exception  {
        List<Ubicacion> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT * FROM ubicaciones WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Ubicacion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("cx"),
                        rs.getString("cy"))                    
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
    public Object BuscarPorId(int id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean ConsultarNombre(String nom) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public  List<Ubicacion> ConsultarTitulo(String find){
        List<Ubicacion> titulo = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM ubicaciones WHERE titulo LIKE '%"+find+"%'";
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                titulo.add(new Ubicacion(
                        rs.getInt("id"),
                        rs.getString("titulo"),
                        rs.getString("cx"),
                        rs.getString("cy")
                    )
                );                
            }
        } catch (Exception e) {
        }
        finally{
            try {
                this.cerrar();
            } catch (Exception e) {
            }
        }        
        return titulo;
    }    
    
}
