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
    <script src="js/Chart.bundle.min.js" type="text/javascript"></script>
    <title>JSP Page</title>

    </head>
    <body>
        <%
        //Instanciar un objeto que corresponde al tipo de gráfico 
        //cargaremos la data para las series
        
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        data.setValue(1,"acura", "Octubre");
        data.setValue(1,"alpina", "Octubre");
        data.setValue(3,"bmw", "Octubre");
        data.setValue(4,"cadillac", "Octubre");
        //Generar el gráfico
        JFreeChart grafico = ChartFactory.createBarChart("vehiculos según su uso", "Meses","Cantidad",data, PlotOrientation.VERTICAL, true,true,true);
        //orientacioon, leyenda, letreros emergentes, activado los enlaces
        //El medio donde se va a ver el gráfico
        response.setContentType("image/JPEG");
        //OutputStream sa = response.getOutputStream(out, chart, width, height);
        OutputStream sa = response.getOutputStream();
        ChartUtilities.writeChartAsJPEG(sa, grafico, 500, 500);
        //Impresion del gráfico
        %>
    </body>
    </html>                              