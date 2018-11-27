
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.Encomienda;


public class EncomiendaDAO extends Conexion implements DAO{ 

    @Override
    public void insertar(Object obj) throws Exception {
        Encomienda c = (Encomienda) obj;
        PreparedStatement pst;
        String sql="INSERT INTO encomiendas ( id_cli, id_usu, id_veh, receptor, descrip, fech_env, id_tipo ) VALUES(?,?,?,?,?,?,?)";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getEmisor());
            pst.setString(2, c.getUsuario());            
            pst.setString(3, c.getVehiculo());           
            pst.setString(4, c.getReceptor());
            pst.setString(5, c.getDescripcion());
            pst.setDate(6, c.getFecha());
            pst.setString(7, c.getTipo());
            pst.executeUpdate();            

        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }          
    }

    @Override
    public void eliminar(Object obj) throws Exception {
        Encomienda c = (Encomienda) obj;
        PreparedStatement pst;
        String sql="UPDATE encomiendas SET estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, c.getId());
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
        Encomienda c = (Encomienda) obj;
        PreparedStatement pst;
        String sql="UPDATE encomiendas SET id_cli=?, id_usu=?, id_veh=?, receptor=?, descrip=?, fech_env=?, id_tipo=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getEmisor());
            pst.setString(2, c.getUsuario());            
            pst.setString(3, c.getVehiculo());
            pst.setString(4, c.getReceptor());
            pst.setString(5, c.getDescripcion());
            pst.setDate(6, c.getFecha());
            pst.setString(7, c.getTipo());
            pst.setInt(8, c.getId()); 
            pst.executeUpdate();      
            
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }     
    }

    @Override
    public List consultar() throws Exception {
        List<Encomienda> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT e.id, c.nom, u.nom, v.placa, e.receptor, e.descrip, e.fech_env , te.nom FROM clientes c, usuarios u, vehiculos v, encomiendas e, tiposencomiendas te WHERE e.id_cli = c.id AND e.id_usu = u.id AND e.id_veh = v.id AND e.id_tipo = te.id AND e.estado = 1 ORDER BY e.id";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Encomienda(
                        rs.getInt("e.id"),
                        rs.getString("c.nom"),
                        rs.getString("u.nom"),
                        rs.getString("v.placa"),                                              
                        rs.getString("e.receptor"),
                        rs.getString("e.descrip"),
                        rs.getDate("e.fech_env"),                        
                        rs.getString("te.nom")
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
    public Encomienda BuscarPorId(int id) throws Exception {
           Encomienda c = new Encomienda();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT e.id, c.nom, u.nom, v.placa, e.receptor, e.descrip, e.fech_env, te.nom FROM clientes c, usuarios u, vehiculos v, encomiendas e, tiposencomiendas te WHERE e.id_cli = c.id AND e.id_usu = u.id AND e.id_veh = v.id AND e.id_tipo = te.id AND e.estado = 1 AND e.id=? ORDER BY e.id";
           try {
            this.conectar();
               pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);                 
               res = pst.executeQuery();                                    
                if (res.next()) {                                     
                    c.setEmisor(res.getString("c.nom"));            
                    c.setUsuario(res.getString("u.nom"));                               
                    c.setVehiculo(res.getString("v.placa"));   
                    c.setReceptor(res.getString("e.receptor")); 
                    c.setDescripcion(res.getString("e.descrip"));
                    c.setFecha(res.getDate("e.fech_env"));
                    c.setTipo(res.getString("te.nom"));
                    c.setId(res.getInt("e.id"));
                }                   
     
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }   
           return c;        
    }

    @Override
    public boolean ConsultarNombre(String nom) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
  
}
