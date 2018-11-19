
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        
        <!-- Barra -->
        <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
        <script src="https://www.amcharts.com/lib/3/serial.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

        <!-- Pastel -->
        <script src="https://www.amcharts.com/lib/3/pie.js"></script>
        <script src="https://www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
        <script src="js/jquery.js" type="text/javascript"></script>
             
        <!--DATAPICKER -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>        
   
        <script src="js/validarReporteVehiculo.js" type="text/javascript"></script>
        

        <title>Reporte</title>
    </head>
    <body>
        <div class="container">
            <form>
                <h3>Cantidad de Vehículos Usados del 2018</h3>
                <input type="button" id="btnGraficoBarraGananciaVehiculoPorMes" class="btn btn-primary" value="Por Mes">            
                <input type="button" id="btnGraficoPastelGananciaVehiculoPorFecha" class="btn btn-success" value="Por Fecha" >
                <input type="button" id="btnGraficoPastelGananciaVehiculoPorMes" class="btn btn-primary" value="Por Mes (%)">
                <a class="btn btn-warning" href="SERVVehiculo?action=refresh"> Salir</a>
                <br><br>
                <div id="chartdiv" style="width: 800px;height: 400px"></div>
                <br>
                    <div class="form-group">
                        <label for="from" class="control-label">FECHA DE ENVIO</label>
                        <input type="text" class="form-control" id="from" name="txtFechaEnvio" >                                           
                    </div> 
                    <div class="form-group">
                        <label for="to" class="control-label">FECHA DE FINAL</label>
                        <input type="text" class="form-control" id="to" name="txtFechaFinal">                                           
                    </div> 
                <div id="chartdiv2" style="width: 900px;height: 400px"></div>     
            </form>
            <!--
            <form>
                <h3>Ingresos  de Encomiendas Según el Tipo en el 2018</h3>
                <input type="button" id="btnGraficoBarraGananciaTipoEncomiendaPorMes" class="btn btn-primary" value="Por Mes">            
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorIntervalo" class="btn btn-success" value="Por Fecha" >
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorMes" class="btn btn-primary" value="Por Mes (%)">
                <br><br>
                <div id="chartdiv3" style="width: 800px;height: 400px"></div>
                <div id="chartdiv4" style="width: 800px;height: 400px"></div>                  
            </form>
            -->
        </div>
       
    </body>
    
    <script>
        index.init();
    </script>
    
</html>
