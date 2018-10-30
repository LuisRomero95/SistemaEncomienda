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
            <form action="ReporteClienteGeneral.jsp" method="POST">
                <label>Reporte de Ubicación de Clientes  </label><br>                
                <input type="submit" name="btnReporteClienteGeneral" value="Ver Reporte 1">
            </form>
        </div>
    </body>
</html>
