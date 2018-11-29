
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.Precio;
import modelado.Reporte;

public class PrecioDAO extends Conexion implements DAO{    

    @Override
    public void insertar(Object obj) throws Exception {
        Precio u = (Precio) obj;
        PreparedStatement pst;
        String sql="INSERT INTO precios (id_enc, tipo, cant, peso, result) VALUES(?,?,?,?,?)";
        //conectarse a la bd
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, u.getEncomienda());
            pst.setString(2, u.getTipo());
            pst.setInt(3, u.getCantidad());
            pst.setDouble(4, u.getPeso());
            pst.setDouble(5, u.getResultado());
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
        String sql = "UPDATE precios SET id_enc=?, tipo=?, cant=?, peso=?, result=? WHERE id=? AND estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, u.getEncomienda());
            pst.setString(2, u.getTipo());
            pst.setInt(3, u.getCantidad());
            pst.setDouble(4, u.getPeso());
            pst.setDouble(5, u.getResultado());         
            pst.setInt(6, u.getId()); 
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
        String sql = "SELECT id, id_enc, tipo, cant, peso, result FROM precios WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            //ejecutar mi consulta y recuperar los resultados en rs
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Precio(
                        rs.getInt("id"),
                        rs.getInt("id_enc"),
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
        String sql = "SELECT id, id_enc, tipo, cant, peso, result FROM precios WHERE estado = 1 AND id=?";
        try {
           this.conectar();
           pst = conexion.prepareStatement(sql);
           pst.setInt(1,id);  

           res = pst.executeQuery();                                    
            if (res.next()) {
                usuario.setEncomienda(res.getInt("id_enc"));
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

    
    public List<Reporte> consultarIngresoPorAño() throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(e.fech_env) AS mes, SUM(p.result) AS total FROM encomiendas e, precios p WHERE e.id = p.id_enc AND e.id_tipo='2' GROUP BY mes ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();         
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("total")
                    )                    
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
    
    public List<Reporte> consultarIngresoPorMes(String año) throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(e.fech_env) AS mes, SUM(p.result) AS total FROM encomiendas e, precios p WHERE e.id = p.id_enc AND year(e.fech_env)='"+año+"' AND e.id_tipo='2' GROUP BY mes ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("total")
                    )                    
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
        
    public List<Reporte> consultarIngresoPorFecha(Date inicio, Date fin) throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT e.fech_env as mes, SUM(p.result) AS total FROM encomiendas e, precios p WHERE e.id = p.id_enc AND e.fech_env BETWEEN '"+inicio+"' AND '"+fin+"' AND e.estado =1 AND e.id_tipo='2' GROUP by mes";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("total")
                    )                    
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
    
    public List<Reporte> consultarTipoIngresoPorAño() throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(e.fech_env) AS mes, SUM(CASE WHEN p.tipo = 'sobre' THEN p.result ELSE 0 END) AS sobre, SUM(CASE WHEN p.tipo = 'paquete' THEN p.result ELSE 0 END) AS paquete FROM encomiendas e INNER JOIN precios p ON e.id = p.id_enc WHERE e.id_tipo='2' GROUP BY mes ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("sobre"),
                        rs.getDouble("paquete")
                    )                    
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
    
    public List<Reporte> consultarTipoIngresoPorAño(String tipo) throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(e.fech_env) AS mes, SUM(p.result) AS tipo FROM encomiendas e, precios p WHERE e.id = p.id_enc AND e.id_tipo='2' AND p.tipo='"+tipo+"' GROUP BY mes ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("tipo")
                    )                    
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
    
    public List<Reporte> consultarTipoIngresoPorMes(String año) throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(e.fech_env) AS mes, SUM(CASE WHEN p.tipo = 'sobre' THEN p.result ELSE 0 END) AS sobre, SUM(CASE WHEN p.tipo = 'paquete' THEN p.result ELSE 0 END) AS paquete FROM encomiendas e INNER JOIN precios p ON e.id = p.id_enc WHERE year(e.fech_env) ='"+año+"' GROUP BY mes  ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();         
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("sobre"),
                        rs.getDouble("paquete")
                    )                    
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
        
    public List<Reporte> consultarTipoIngresoPorFecha(Date inicio, Date fin) throws Exception  {
        List<Reporte> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(e.fech_env) AS mes, SUM(CASE WHEN p.tipo = 'sobre' THEN p.result ELSE 0 END) AS sobre, SUM(CASE WHEN p.tipo = 'paquete' THEN p.result ELSE 0 END) AS paquete FROM encomiendas e INNER JOIN precios p ON e.id = p.id_enc WHERE e.fech_env BETWEEN '"+inicio+"' AND '"+fin+"' GROUP BY mes ORDER BY e.fech_env";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Reporte(
                        rs.getString("mes"),
                        rs.getDouble("sobre"),
                        rs.getDouble("paquete")
                    )                    
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
    
}
