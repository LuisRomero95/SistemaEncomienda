<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>

<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="navbar.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h3>Reportes de Vehículos</h3>          
            <br>
            <form action="ReporteVehiculoGeneral.jsp" method="POST">
                <label>Reporte de Vehiculos Usados Según el Año  </label><br>
                <select name="año" >
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select> 
                
                <input type="submit" name="btnReporteVehiculoGeneral" value="Ver Reporte 1"> 
            </form>
            <br>
            <form action="ReporteVehiculoEspecifico.jsp" method="POST">
                <label>Reporte de Vehiculos Usados Según el Mes y el Año  </label><br>
                <select name="parametros" >
                    <option value="January">Enero</option>
                    <option value="February">Febrero</option>
                    <option value="March">Marzo</option>
                    <option value="April">Abril</option>
                    <option value="May">Mayo</option>
                    <option value="June">Junio</option>
                    <option value="July">Julio</option>
                    <option value="August">Agosto</option>
                    <option value="September">Septiembre</option>
                    <option value="October">Octubre</option>
                    <option value="November">Noviembre</option>
                    <option value="December">Diciembre</option>
                </select>

                <select name="año" >
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select> 

                 <input type="submit" name="btnReporteVehiculoEspecifico" value="Ver Reporte 2">
                
            </form>
        </div>
    </body>
</html>
