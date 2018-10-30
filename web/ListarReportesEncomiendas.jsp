<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="navbar.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h3>Reportes de Encomiendas</h3>  
            <br>
            <form action="ReporteEncomiendaGeneral.jsp" method="POST">
                <label>Reporte de Ganancias de Encomiendas Según el Año  </label><br>
                <select name="año" >                    
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select> 
                
                <input type="submit" name="btnReporteEncomiendaGeneral" value="Ver Reporte 1">
            </form>
            <br>
            <form action="ReporteEncomiendaTipoPrecio.jsp" method="POST">
                <label>Reporte de Ganancias de Tipos de Encomiendas Según Año  </label><br>
                <select name="año" >
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select> 
                
                <input type="submit" name="btnReporteEncomiendaTipoPrecio" value="Ver Reporte 2">
            </form>            
            <br>
            <form action="ReporteEncomiendaTipoPrecioMesAño.jsp" method="POST">
                <label>Reporte de Ganancias de Tipos de Encomiendas Según el Mes y el Año  </label><br>
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

                <select name="year" >
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                </select> 

                 <input type="submit" name="btnReporteEncomiendaTipoPrecioMesAño.jsp" value="Ver Reporte 3">          
                
            </form>
        </div>
    </body>
</html>
