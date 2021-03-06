
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelado.ReporteVehiculo;
import modelado.Vehiculo;

public class VehiculoDAO extends Conexion implements DAO{    

    @Override
    public void insertar(Object obj) throws Exception{
        Vehiculo veh = (Vehiculo) obj;
        PreparedStatement pst;
        String sql="INSERT INTO vehiculos (placa, id_con, id_ayu, año, marca, modelo, serie, cap_max, pas_max, fech_ing) VALUES(?,?,?,?,?,?,?,?,?,CURDATE())";
        try {
            this.conectar();           
            pst = conexion.prepareStatement(sql);
            pst.setString(1, veh.getPlaca());
            pst.setString(2, veh.getConductor());
            pst.setString(3, veh.getAyudante());
            pst.setString(4, veh.getAño());
            pst.setString(5, veh.getMarca());            
            pst.setString(6, veh.getModelo());
            pst.setString(7, veh.getSerie());
            pst.setInt(8, veh.getCapmax());
            pst.setInt(9, veh.getPasmax());
            pst.executeUpdate();            
                               
        } catch ( SQLException e) {
            throw e;
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public void eliminar(Object obj) throws Exception{
        Vehiculo v = (Vehiculo) obj;
        PreparedStatement pst;
        String sql="UPDATE vehiculos set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, v.getId());
            pst.executeUpdate();            
            
        } catch ( SQLException e) {
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public void modificar(Object obj) throws Exception{
        Vehiculo veh = (Vehiculo) obj;
        PreparedStatement pst;
        String sql="UPDATE vehiculos SET placa=?, id_con=?, id_ayu=?, año=?, marca=?, modelo=?, serie=?, cap_max=?, pas_max=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, veh.getPlaca());
            pst.setString(2, veh.getConductor());
            pst.setString(3, veh.getAyudante());
            pst.setString(4, veh.getAño());
            pst.setString(5, veh.getMarca());            
            pst.setString(6, veh.getModelo());
            pst.setString(7, veh.getSerie());
            pst.setInt(8, veh.getCapmax());
            pst.setInt(9, veh.getPasmax());
            pst.setInt(10, veh.getId());
            pst.executeUpdate(); 
            
        } catch ( SQLException e) {
        }
        finally{
            this.cerrar();
        }
    }

    @Override
    public Vehiculo BuscarPorId(int id) throws Exception{
          Vehiculo c = new Vehiculo();
           PreparedStatement pst;
           ResultSet res;           
           String sql = "SELECT v.id, v.placa, c.nom, a.nom, v.año, v.marca, v.modelo, v.serie, v.cap_max, v.pas_max FROM vehiculos v, conductores c, ayudantes a WHERE v.id_con = c.id && v.id_ayu =a.id AND v.id=? AND v.estado = 1";
           try {
               this.conectar();
               pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);                 
               
               res = pst.executeQuery();                                    
                if (res.next()) {
                    c.setPlaca(res.getString("v.placa"));
                    c.setConductor(res.getString("c.nom"));            
                    c.setAyudante(res.getString("a.nom"));
                    c.setAño(res.getString("v.año"));
                    c.setMarca(res.getString("v.marca"));                    
                    c.setModelo(res.getString("v.modelo"));                    
                    c.setSerie(res.getString("v.serie"));
                    c.setCapmax(res.getInt("v.cap_max"));
                    c.setPasmax(res.getInt("v.pas_max"));
                    c.setId(res.getInt("v.id"));
                }                   
     
                } catch ( SQLException e) {
                }
                finally{
                    this.cerrar();
                }
           return c;
    }

    @Override
    public List<Vehiculo> consultar() throws Exception{
        List<Vehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT v.id, v.placa, c.nom, a.nom, v.año, v.marca, v.modelo, v.serie, v.cap_max, v.pas_max FROM vehiculos v, conductores c, ayudantes a WHERE v.id_con = c.id && v.id_ayu =a.id AND v.estado = 1";
        //String sql = "SELECT * FROM vehiculos WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Vehiculo(
                        rs.getInt("v.id"),
                        rs.getString("v.placa"),
                        rs.getString("c.nom"),
                        rs.getString("a.nom"),
                        rs.getString("v.año"),
                        rs.getString("v.marca"),                        
                        rs.getString("v.modelo"),
                        rs.getString("v.serie"),
                        rs.getInt("v.cap_max"),
                        rs.getInt("v.pas_max"))
                );
            }
            } catch ( SQLException e) {
            }
            finally{
                this.cerrar();
            }
        return datos;
    }

    @Override
    public boolean ConsultarNombre(String nom) throws SQLException {
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM vehiculos WHERE placa='"+nom+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();       
    }

    public List<ReporteVehiculo> consultarVehiculoPorAño() throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(v.fech_ing) AS marca, count(v.id) AS total FROM vehiculos v GROUP BY year(v.fech_ing) ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new ReporteVehiculo(
                        rs.getString("marca"),
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
    
    public List<ReporteVehiculo> consultarVehiculoPorMes(String año) throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "select v.marca as marca, COUNT(v.marca) as total from vehiculos v WHERE year(v.fech_ing)='"+año+"' AND v.estado =1 GROUP BY marca ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();  
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new ReporteVehiculo(
                        rs.getString("marca"),
                        rs.getInt("total")
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
    
    public List<ReporteVehiculo> consultarTipoVehiculoPorAño() throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(v.fech_ing) AS mes, SUM(CASE WHEN v.marca = 'acura' THEN v.estado ELSE 0 END) AS acura, SUM(CASE WHEN v.marca = 'audi' THEN v.estado ELSE 0 END) AS audi, SUM(CASE WHEN v.marca = 'honda' THEN v.estado ELSE 0 END) AS honda, SUM(CASE WHEN v.marca = 'cadillac' THEN v.estado ELSE 0 END) AS cadillac, SUM(CASE WHEN v.marca = 'ford' THEN v.estado ELSE 0 END) AS ford FROM vehiculos v GROUP BY mes ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new ReporteVehiculo(
                        rs.getString("mes"),
                        rs.getDouble("acura"),
                        rs.getDouble("audi"),
                        rs.getDouble("honda"),
                        rs.getDouble("cadillac"),
                        rs.getDouble("ford")
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
    
    public List<ReporteVehiculo> consultarTipoVehiculoPorMes(String año) throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(v.fech_ing) AS mes, SUM(CASE WHEN v.marca = 'acura' THEN v.estado ELSE 0 END) AS acura, SUM(CASE WHEN v.marca = 'audi' THEN v.estado ELSE 0 END) AS audi, SUM(CASE WHEN v.marca = 'honda' THEN v.estado ELSE 0 END) AS honda, SUM(CASE WHEN v.marca = 'cadillac' THEN v.estado ELSE 0 END) AS cadillac, SUM(CASE WHEN v.marca = 'ford' THEN v.estado ELSE 0 END) AS ford FROM vehiculos v WHERE year(v.fech_ing) ='"+año+"' GROUP BY mes ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();         
            while(rs.next()){
                datos.add(new ReporteVehiculo(
                        rs.getString("mes"),
                        rs.getDouble("acura"),
                        rs.getDouble("audi"),
                        rs.getDouble("honda"),
                        rs.getDouble("cadillac"),
                        rs.getDouble("ford")
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
    
    public List<ReporteVehiculo> consultarTipoVehiculoPorFecha(Date inicio, Date fin) throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(v.fech_ing) AS mes, SUM(CASE WHEN v.marca = 'acura' THEN v.estado ELSE 0 END) AS acura, SUM(CASE WHEN v.marca = 'audi' THEN v.estado ELSE 0 END) AS audi, SUM(CASE WHEN v.marca = 'honda' THEN v.estado ELSE 0 END) AS honda, SUM(CASE WHEN v.marca = 'cadillac' THEN v.estado ELSE 0 END) AS cadillac, SUM(CASE WHEN v.marca = 'ford' THEN v.estado ELSE 0 END) AS ford FROM vehiculos v WHERE v.fech_ing BETWEEN '"+inicio+"' AND '"+fin+"' AND v.estado=1 GROUP BY mes ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new ReporteVehiculo(
                        rs.getString("mes"),
                        rs.getDouble("acura"),
                        rs.getDouble("audi"),
                        rs.getDouble("honda"),
                        rs.getDouble("cadillac"),
                        rs.getDouble("ford")
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
    
    public List<ReporteVehiculo> consultarVehiculoPorFecha(Date inicio, Date fin) throws Exception  {
        List<ReporteVehiculo> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT v.fech_ing as mes, SUM(v.estado) as total from vehiculos v WHERE v.fech_ing BETWEEN '"+inicio+"' AND '"+fin+"' AND v.estado =1 GROUP BY mes ORDER BY v.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new ReporteVehiculo(
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
                
}
