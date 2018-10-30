    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="org.jfree.chart.*"%>
    <%@ page import="org.jfree.chart.plot.*"%>
    <%@ page import="org.jfree.data.category.*"%>
         <!DOCTYPE HTML>
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/Chart.min.js" type="text/javascript"></script>
    <title>JSP Page</title>

    </head>
    <body>
        <%
        //Conexión con la bd    
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3307/bdmudanza6","root","");
        Statement cmd = cn.createStatement();
        String sql = "select v.marca, count(v.marca) as cantidad from vehiculos v, encomiendas e WHERE v.id = e.id_veh AND MONTHNAME(e.fech_env)='November' AND v.estado =1  group by v.marca";
        ResultSet rs =  cmd.executeQuery(sql);
        
        //Instanciar un objeto que corresponde al tipo de gráfico 
        //cargaremos la data para las series
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        while(rs.next()){
            data.setValue(
                   rs.getInt(2),
                   "Usados" ,
                   rs.getString(1)
            );
        }
        
        //Generar el gráfico
        JFreeChart grafico = ChartFactory.createBarChart("vehiculos Usados", "Vehiculos","Cantidad",data, PlotOrientation.VERTICAL, true,true,true);
        //orientacioon, leyenda, letreros emergentes, activado los enlaces
        //El medio donde se va a ver el gráfico
        response.setContentType("image/JPEG");
        //OutputStream sa = response.getOutputStream(out, chart, width, height);
        OutputStream sa = response.getOutputStream();
        ChartUtilities.writeChartAsJPEG(sa, grafico, 800, 500);
        //Impresion del gráfico
        %>
    </body>
    </html>                              