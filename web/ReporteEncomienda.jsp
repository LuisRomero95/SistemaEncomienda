
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
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
        <script src="js/validarReporteEncomienda.js" type="text/javascript"></script>
        <jsp:include page="navbar.jsp"/>
        <title>Reporte</title>
    </head>
    <body>
        <div class="container">
            <form>
                <h3>Ingresos de Encomiendas del 2018</h3>
                <input type="button" id="btnGraficoBarraGananciaEncomiendaPorMes" class="btn btn-primary" value="Por Mes">            
                <input type="button" id="btnGraficoPastelGananciaEncomiendaPorIntervalo" class="btn btn-success" value="Por Fecha" >
                <input type="button" id="btnGraficoPastelGananciaEncomiendaPorMes" class="btn btn-primary" value="Por Mes (%)">
                <br><br>
                <div id="chartdiv" style="width: 800px;height: 400px"></div>
                <div id="chartdiv2" style="width: 800px;height: 400px"></div>     
            </form>
            <form>
                <h3>Ingresos  de Encomiendas Según el Tipo en el 2018</h3>
                <input type="button" id="btnGraficoBarraGananciaTipoEncomiendaPorMes" class="btn btn-primary" value="Por Mes">            
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorIntervalo" class="btn btn-success" value="Por Fecha" >
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorMes" class="btn btn-primary" value="Por Mes (%)">
                <br><br>
                <div id="chartdiv3" style="width: 800px;height: 400px"></div>
                <div id="chartdiv4" style="width: 800px;height: 400px"></div>                  
            </form>
        </div>
       
    </body>
    
    <script>
        index.init();
    </script>
    
</html>
