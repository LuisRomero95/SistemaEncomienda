<%-- 
    Document   : matos
    Created on : 24/11/2018, 03:04:29 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
<section class="content">
    <div class="row">
	<div class="col-md-12">
            <h1><i class='glyphicon glyphicon-user'></i> Reporte Citas Atendidas</h1>
            <div class="row">
                <div class="col-md-1">
                    <label class="control-label" for="attention_date_start">Desde</label>
                </div>
                <div class="col-md-2">
                    <input type="text" id="attention_date_start" name="attention_date_start" class="form-control mask_date" placeholder="dd/MM/yyyy" autocomplete="off" maxlength="10" />
                </div>
                <div class="col-md-1">
                    <label class="control-label" for="attention_date_end">Hasta</label>
                </div>
                <div class="col-md-2">
                    <input type="text" id="attention_date_end" name="attention_date_end" class="form-control mask_date" placeholder="dd/MM/yyyy" autocomplete="off" maxlength="10" />
                </div>
                <div class="col-md-1">
                    <button type="button" id="btnSearch" title="Buscar" class="btn btn-primary btn-block"><i class="fa fa-search"></i></button>
                </div>
                <div class="col-md-1">
                    <button type="button" id="btnCleanFilters" title="Limpiar" class="btn btn-primary btn-block"><i class="fa fa-eraser"></i></button>
                </div>
                <div class="col-md-1">
                    <button type="button" id="btnExportChartsPDF" title="Exportar a PDF" class="btn btn-primary btn-block"><i class="fa fa-download"></i></button>
                </div>
            </div>
	</div>
    </div>
    
    <br>
    
    <div class="row">
	<div class="col-md-12">
            <div class="box box-primary">
                <div class="box-body">
                    <div id="chartdiv1" class="chartdiv"></div>
                    <div id="chartdiv2" class="chartdiv"></div>
                </div>
            </div>
	</div>
    </div>
</section>
    </body>
</html>
