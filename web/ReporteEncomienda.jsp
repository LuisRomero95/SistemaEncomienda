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
        <title>Reporte de Encomiendas</title>        
        <link href="css/reporte.css" rel="stylesheet" type="text/css"/>
        <!-- Barra, Pastel -->
        <script src="amcharts/amcharts.js" type="text/javascript"></script>
        <script src="amcharts/serial.js" type="text/javascript"></script>
        <script src="amcharts/pie.js" type="text/javascript"></script>
        <script src="amcharts/themes/light.js" type="text/javascript"></script>                       
        
        <script src="amcharts/plugins/export/export.min.js" type="text/javascript"></script>
        <link href="amcharts/plugins/export/export.css" rel="stylesheet" type="text/css"/>        
        <script src="amcharts/plugins/animate/animate.js" type="text/javascript"></script>
                             
        <!--DATAPICKER -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <!--BARRA DE NAVEGACIÓN -->
        <jsp:include page="navbar.jsp"/>
        <!--DATAPICKER -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
        <!--VALIDACIÓN -->
        <script src="js/validarReporteEncomienda.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <form  id="formulario">
                <h3>Reporte de Encomiendas Realizadas</h3>                
                <br>
                
            <div class="row">
                 <div class="col-md-12">
                     <div class="row" style=" padding: 5px 5px 5px; background-color: #E5E7E9">
                            <div class="col-md-2">
                                <input type="button" id="btnGraficoBarraPastelGananciaEncomiendaPorAño" class="btn btn-primary" value="Ver Según el Año">
                            </div>
                            <div class="col-md-2">                               
                                <input type="button" id="btnExportChartsPDF" class="btn btn-danger btn-block" value="Exportar a PDF">
                            </div>                         
                            <div class="col-md-2">
                                <a class="btn btn-warning" href="SERVEncomienda?action=refresh"> Salir</a>
                            </div>
                     </div>
                 </div>
             </div>  
                
            <br>                

            <div class="row">
                <div class="col-md-12">
                    <div class="row" style=" padding: 5px 5px 5px; background-color: #E5E7E9">
                        <div class="col-md-1">
                            <label class="control-label" for="listarAño">Año</label>
                        </div>
                        <div class="col-md-2">
                                <select name="txtAño" id="listarAño" class="form-control"> 
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                </select>     
                        </div>
                        <div class="col-md-2">
                            <input type="button" id="btnGraficoBarraPastelGananciaEncomiendaPorMes" class="btn btn-primary" value="Ver Por Mes">            
                        </div>                      
                    </div>
                </div>
            </div>
                
            <br>
                
            <div class="row">
                <div class="col-md-12">
                    <div class="row" style=" padding: 5px 5px 5px; background-color: #E5E7E9">
                        <div class="col-md-1">
                            <label class="control-label" for="from">Desde</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="from" name="txtFechaEnvio" class="form-control mask_date" placeholder="dd/mm/yyyy" autocomplete="off" maxlength="10" />
                        </div>
                        <div class="col-md-1">
                            <label class="control-label" for="to">Hasta</label>
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="to" name="txtFechaFinal" class="form-control mask_date" placeholder="dd/mm/yyyy" autocomplete="off" maxlength="10" />
                        </div>
                        <div class="col-md-2">
                            <input type="button" id="btnGraficoBarraLineaGananciaEncomiendaPorFecha" class="btn btn-primary" value="Ver Por Fecha" >                                
                        </div>                         
                    </div>
                </div>
            </div>
            
            <br>
                
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-body">
                            <div id="chartdiv1" class="chartdiv"></div><br>                                                  
                            <div id="chartdiv2" class="chartdiv"></div><br>      
                            <div id="chartdiv3" class="chartdiv"></div>
                        </div>
                    </div>
                </div>
            </div>
            
            </form>
    </body>
        
</html>
