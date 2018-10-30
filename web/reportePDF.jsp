<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <%
        //Conexión con la bd    
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bdmudanza6","root","");
            Statement cmd = cn.createStatement();
            out.print("Conexión en Linea");
            String sql = "select v.marca, count(v.marca) as cantidad from vehiculos v, encomiendas e WHERE v.id = e.id_veh AND MONTHNAME(e.fech_env)='November' AND v.estado =1  group by v.marca";
        ResultSet rs =  cmd.executeQuery(sql);
            } catch (Exception e) {
                out.print("Error"+e.getMessage());
            }
        
        

        %>
        
    </body>
</html>
