
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
        
        <script src="js/validarReporteEncomienda.js" type="text/javascript"></script>
        
        <title>Reporte</title>
    </head>
    <body>
        <div class="container">            
            <form>                
                <h3>Ingresos de Tipos de Encomiendas</h3>                
                <br>
                <input type="button" id="btnGraficoBarraGananciaTipoEncomiendaPorAño" class="btn btn-primary" value="Ver Según el Año">
                <a class="btn btn-info" href="ReporteEncomienda.jsp"> Regresar </a>
                <a class="btn btn-warning" href="SERVEncomienda?action=refresh"> Salir</a>
                <br>
                <div class="form-group">
                    <label for="listarTipo" class="control-label">TIPO</label>
                    <select name="txtTipo" id="listarTipo" class="form-control"> 
                        <option value="sobre">sobre</option>
                        <option value="paquete">paquete</option>
                    </select>                                            
                </div>                   
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorAño" class="btn btn-primary" value="Ver Por Año (%)">            
                
                <div id="chartdiv3" style="width: 900px;height: 400px"></div> 
                <br>                
                <div class="form-group">
                    <label for="listarAño" class="control-label">AÑO</label>
                    <select name="txtAño" id="listarAño" class="form-control"> 
                        <option value="2017">2017</option>
                        <option value="2018">2018</option>
                    </select>                                            
                </div>       
                
                <input type="button" id="btnGraficoBarraGananciaTipoEncomiendaPorMes" class="btn btn-primary" value="Ver Por Mes">            
                <input type="button" id="btnGraficoPastelGananciaTipoEncomiendaPorFecha" class="btn btn-success" value="Ver Por Fecha" >                
                <br>
                    <div class="form-group">
                        <label for="from" class="control-label">FECHA DE ENVIO</label>
                        <input type="text" class="form-control" id="from" name="txtFechaEnvio" >                                           
                    </div> 
                    <div class="form-group">
                        <label for="to" class="control-label">FECHA DE FINAL</label>
                        <input type="text" class="form-control" id="to" name="txtFechaFinal">                                           
                    </div>                
                <br>
                <div id="chartdiv4" style="width: 800px;height: 400px"></div>               
            </form>

        </div>
       
    </body>
    
    <script>
        index1.init();
    </script>
    
</html>
