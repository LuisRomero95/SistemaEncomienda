
package dao;

import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Acceso extends Conexion{

    String sql="";
    PreparedStatement st;
    ResultSet rs;
    
    public Acceso() {
    }
            
    public int validar(String usuario, String contra){
        int nivel = 0;
        try{
            this.conectar();
            sql = "SELECT id_nivel FROM usuarios WHERE nom='"+usuario+"' AND pass ='"+ contra +"'";
            st = (PreparedStatement) conexion.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                nivel =rs.getInt("id_nivel");
            }
            this.cerrar();
            rs.close();

        }
        catch (SQLException e){
            System.err.println("Algo ha salido mal en autentificar "+e);
        }
        return nivel;
    }
}
