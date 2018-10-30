<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3307/bdmudanza6","root","");
            
            File reporteFile = new File(application.getRealPath("Reportes/rptClienteGeneral.jasper"));
            Map parametros = new HashMap();
            
            byte[] bytes = JasperRunManager.runReportToPdf(reporteFile.getPath(), parametros, con);
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            
            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytes,0,bytes.length);
            output.flush();
            output.close();
        %>
        <h1>Hello World!</h1>
    </body>
</html>
