
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelado.Cliente;

public class ClienteDAO extends Conexion implements DAO{
    
    @Override
    public void insertar(Object obj) throws Exception {
        Cliente c = (Cliente) obj;
        PreparedStatement pst = null;
        String sql="INSERT INTO clientes (ruc_dni, nom, email, tel_fij, tel_cel, direc, distr, fech_ing) VALUES(?,?,?,?,?,?,?, CURDATE())";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getRuc_dni());
            pst.setString(2, c.getNom());
            pst.setString(3, c.getEmail());
            pst.setString(4, c.getTel_fij());
            pst.setString(5, c.getTel_cel());
            pst.setString(6, c.getDirec());
            pst.setString(7, c.getDistr());
            pst.executeUpdate();            
                      
        } catch ( SQLException e) {           
        }
        finally{
                this.cerrar();
        }
    }

    @Override
    public void eliminar(Object obj) throws Exception {
        Cliente c = (Cliente) obj;
        PreparedStatement pst;
        String sql="UPDATE clientes set estado = 0 WHERE id = ?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setInt(1, c.getId());
            pst.executeUpdate();            
                      
        } catch (SQLException e) {
        }
        finally{
                this.cerrar();
        }
        
    }

    @Override
    public void modificar(Object obj) throws Exception{
        Cliente c = (Cliente) obj;
        PreparedStatement pst;
        String sql="UPDATE clientes SET ruc_dni=?, nom=?, email=?, tel_fij=?, tel_cel=?, direc=?, distr=? WHERE id=?";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            pst.setString(1, c.getRuc_dni());
            pst.setString(2, c.getNom());
            pst.setString(3, c.getEmail());
            pst.setString(4, c.getTel_fij());
            pst.setString(5, c.getTel_cel());
            pst.setString(6, c.getDirec());
            pst.setString(7, c.getDistr());
            pst.setInt(8, c.getId());

             pst.executeUpdate();            
                       
        } catch (SQLException e) {
        }
        finally{
            this.cerrar();
        }

    }

    @Override
    public List<Cliente> consultar() throws Exception{
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        ResultSet rs;
        String sql = "SELECT id, nom, ruc_dni, email, tel_fij, tel_cel, direc, distr FROM clientes WHERE estado = 1";
        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getInt("id"),
                        rs.getString("nom"),
                        rs.getString("ruc_dni"),
                        rs.getString("email"),
                        rs.getString("tel_fij"),
                        rs.getString("tel_cel"),
                        rs.getString("direc"),
                        rs.getString("distr")
                    )
                );
            }
        } catch (SQLException e ) {            
        }
        finally{
            this.cerrar();
        }
        return datos;
    }

    @Override
    public Cliente BuscarPorId(int id) throws Exception{        
           Cliente c = new Cliente();
           PreparedStatement pst;
           ResultSet res;
           String sql = "SELECT * FROM clientes WHERE id =?";
           try {
               this.conectar();
               pst = conexion.prepareStatement(sql);
               pst.setInt(1,id);                                
               res = pst.executeQuery();               
                if (res.next()) {
                    c.setRuc_dni(res.getString("ruc_dni"));
                    c.setNom(res.getString("nom"));            
                    c.setEmail(res.getString("email"));
                    c.setTel_fij(res.getString("tel_fij"));
                    c.setTel_cel(res.getString("tel_cel"));
                    c.setDirec(res.getString("direc"));
                    c.setDistr(res.getString("distr"));
                    c.setId(res.getInt("id"));
                }                   
     
           } catch ( SQLException e ) {
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

    public boolean ConsultarRUCDNI(String nombre) throws SQLException{
        PreparedStatement pst;
        ResultSet res = null;
        String sql = "SELECT * FROM clientes WHERE ruc_dni='"+nombre+"'";

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
        String sql = "SELECT * FROM clientes WHERE email='"+email+"'";

        try {
            this.conectar();
            pst = conexion.prepareStatement(sql);
            res = pst.executeQuery();
        } catch (Exception e) {
        }
         return res.next();
    }
    public  List<String> ConsultarCliente(String find){
        List<String> cliente = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM clientes WHERE nom LIKE '%"+find+"%' AND estado = 1";
            this.conectar();
            pst = conexion.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                cliente.add(  
                        rs.getString("nom")                       
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
        return cliente;
    }    
    
    public List<Cliente> consultarClientePorAño() throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(c.fech_ing) AS mes, count(c.id) AS total FROM clientes c GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();         
            while(rs.next()){
                datos.add(new Cliente(
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
    
    public List<Cliente> consultarClientePorMes(String año) throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(c.fech_ing) AS mes, SUM(c.estado) AS total FROM clientes c WHERE year(c.fech_ing)='"+año+"' GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Cliente(
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
    
    public List<Cliente> consultarClientePorFecha(Date inicio, Date fin) throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT c.fech_ing AS mes, SUM(c.estado) AS total FROM clientes c WHERE c.fech_ing BETWEEN '"+inicio+"' AND '"+fin+"' GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Cliente(
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
    
    public List<Cliente> consultarTipoClientePorAño() throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(c.fech_ing) AS mes, SUM(CASE WHEN LENGTH(c.ruc_dni)=11 THEN c.estado ELSE 0 END) AS empresa, SUM(CASE WHEN LENGTH(c.ruc_dni)=8 THEN c.estado ELSE 0 END) AS persona FROM clientes c GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getString("mes"),
                        rs.getDouble("empresa"),
                        rs.getDouble("persona")
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
       
    
    public List<Cliente> consultarTipoClientePorAño(String tipo) throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(c.fech_ing) AS mes, SUM(CASE WHEN LENGTH(c.ruc_dni)=11 THEN c.estado ELSE 0 END) AS empresa, SUM(CASE WHEN LENGTH(c.ruc_dni)=8 THEN c.estado ELSE 0 END) AS persona FROM clientes c GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();      
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getString("mes"),
                        rs.getDouble("empresa"),
                        rs.getDouble("persona")
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
    
    public List<Cliente> consultarTipoClientePorMes(String año) throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT year(c.fech_ing) AS mes, SUM(CASE WHEN LENGTH(c.ruc_dni)=11 THEN c.estado ELSE 0 END) AS empresa, SUM(CASE WHEN LENGTH(c.ruc_dni)=8 THEN c.estado ELSE 0 END) AS persona FROM clientes c WHERE year(c.fech_ing) ='"+año+"' GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();         
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getString("mes"),
                        rs.getDouble("empresa"),
                        rs.getDouble("persona")
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
    
    public List<Cliente> consultarTipoClientePorFecha(Date inicio, Date fin) throws Exception  {
        List<Cliente> datos = new ArrayList<>();
        PreparedStatement pst;
        PreparedStatement pst1;
        ResultSet rs;
        ResultSet rs1;
        String sqlTrac = "SET lc_time_names = 'es_ES' ";
        String sql = "SELECT monthname(c.fech_ing) AS mes, SUM(CASE WHEN LENGTH(c.ruc_dni)=11 THEN c.estado ELSE 0 END) AS empresa, SUM(CASE WHEN LENGTH(c.ruc_dni)=8 THEN c.estado ELSE 0 END) AS persona FROM clientes c WHERE c.fech_ing BETWEEN '"+inicio+"' AND '"+fin+"' GROUP BY mes ORDER BY c.fech_ing";
        try {
            this.conectar();
            pst1 = conexion.prepareStatement(sqlTrac);
            pst = conexion.prepareStatement(sql);
            rs1 = pst1.executeQuery();             
            rs = pst.executeQuery();       
            while(rs.next()){
                datos.add(new Cliente(
                        rs.getString("mes"),
                        rs.getDouble("empresa"),
                        rs.getDouble("persona")
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
