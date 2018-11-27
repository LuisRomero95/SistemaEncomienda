    
    var chart1, chart2;
    var dateToday = new Date(); 
    
    $(function() {
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            currentText: 'Hoy',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
            'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
            'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié;', 'Juv', 'Vie', 'Sáb'],
            dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
            weekHeader: 'Sm',
            dateFormat: 'yy-mm-dd',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
            };
        $.datepicker.setDefaults($.datepicker.regional["es"]);
        $("#from, #to").datepicker({ 
            numberOfMonths: 3, 
            showButtonPanel: true

        }); 
    });      
    
    $(document).ready(function(){
                       
        /*Ingreso Grafico de Barras*/  
        $('#btnGraficoBarraPastelGananciaIngresoPorAño').click(function () {
            
            getGraficoBarras1();
            //Luego ejecuta --> getGraficoPie1();
            
        });                
        $('#btnGraficoBarraPastelGananciaIngresoPorMes').click(function () {
            
            getGraficoBarras2();
        });
        
        $('#btnGraficoBarraLineaGananciaIngresoPorFecha').click(function () {     
            
            var from = $('#from').val();
            var to = $('#to').val();
            
            if( from === null || from.length === 0 || /^\s+$/.test(from) ) {
              alert('[ERROR] Ingrese fecha de inicio');
              return false;              
            }
            else if( to === null || to.length === 0 || /^\s+$/.test(to) ) {
              alert('[ERROR] Ingrese fecha final');
              return false;              
            }
            getGraficoBarrasFecha1();
                     
        });                    
        
        $('#btnExportChartsPDF').click(function (){                                     
            fc_export_pdf(); 
        });
//        $('#btnExportChartsExcel').click(function (){                                     
//            fc_export_excel(); 
//        });        
    });    
    
    
      getGraficoBarras1 = function () {
                
        $.ajax({
            type: "POST",            
            url: 'SERVReporte',
            data: "&action=listarIngresoPorAño",
            dataType: 'json',
            success: function (data) {
                console.log(data.mensaje);
               _private.setBarras1(data);
            },
            complete:function(){
                getGraficoPie1();
            }
        });
    };


    getGraficoBarras2 = function () {
        var año = $("#listarAño").val();
        $.ajax({
            type: "POST",            
            url: 'SERVReporte',
            data: "&action=listarIngresoPorMes&año="+año,
            dataType: 'json',
            success: function (data) {
                console.log(data.mensaje);
               _private.setBarras2(data);
            },
            complete:function(){
                getGraficoPie2();
            }
        });
    };
    
    getGraficoBarras3 = function () {
        $.ajax({
            type: "POST",
            url: 'SERVReporte',
            data: "&action=listarTipoIngresoPorAño",
            dataType: 'json',
            success: function (data) {
                console.log(data.mensaje);
               _private.setBarras3(data);
            }
        });
    };  
    
    getGraficoBarras4 = function () {
        var año = $("#listarAño").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoIngresoMes&año="+año,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setBarras4(data);
            }
        });
    };    
            
    getGraficoPie1 = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarIngresoPorAño",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setPie1(data);
            },
            complete:function(){
                getGraficoBarras3();
            }
        });
    };
    
    
        
    getGraficoPie2 = function () {
        var año = $("#listarAño").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarIngresoPorMes&año="+año,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setPie2(data);
            },
            complete:function(){
                getGraficoBarras4();
            }
        });
    };
    
    getGraficoPie3 = function () {
        var tipo = $("#listarTipo").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoIngresoPorAño&tipo="+tipo,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setPie3(data);
            }
        });
    };          
     
    getGraficoBarrasFecha1 = function () {
        var fecha_inicio = $("#from").val();
        var fecha_final = $("#to").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoIngresoPorFecha&fechaI="+fecha_inicio+"&fechaF="+fecha_final,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setBarrasFecha1(data);
            },
            complete:function(){
                getGraficoLineasFecha1();
            }
        });                
    };    
    
    getGraficoLineasFecha1 = function () {
        var fecha_inicio = $("#from").val();
        var fecha_final = $("#to").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarIngresoPorFecha&fechaI="+fecha_inicio+"&fechaF="+fecha_final,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setLineasFecha1(data);
            },
            complete:function(){
                getGraficoBarrasFecha2();
            }
        });                
    };        
    
    getGraficoBarrasFecha2 = function () {
        var fecha_inicio = $("#from").val();
        var fecha_final = $("#to").val();        
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoIngresoPorFecha&fechaI="+fecha_inicio+"&fechaF="+fecha_final,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setBarrasFecha2(data);
            }
        });                
    };   
    
    /*metodos, propiedades privadas*/
    var _private = {};

    _private.setBarras1 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);

        var chart = AmCharts.makeChart("chartdiv1", {
            "theme": "light",
            "type": "serial",
            "titles": [{
                    "text": "Reporte de ingresos según el año",
                    "size": 16
                }],            
            "startDuration": 2,
            "dataProvider": objeto,
            "valueAxes": [{
                    "position": "left",
                    "title": "Ingresos (S/.)"
                }],
            "graphs": [{
                    "balloonText": "[[category]]: <b>[[value]]</b>",
                    "fillColorsField": "color",
                    "fillAlphas": 1,
                    "lineAlpha": 0.1,
                    "type": "column",
                    "valueField": "total",
                    labelText: "[[value]]"
                }],
            "depth3D": 20,
            "angle": 30,
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "mes",
            "categoryAxis": {
                "gridPosition": "start",
                "labelRotation": 90,
                "title": "Años" 
//                "listeners": [{
//                  "event": "clickGraphItem",
//                  "method": exportXLSX
//                }]
            },
//            "listeners": [{
//              "event": "clickGraphItem",
//              "method": exportXLSX
//            }],
            "export": {
                "enabled": true,
                "menu": []                
            }

        });
    };

    _private.setBarras2 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        var año = $("#listarAño").val();
        
        var chart = AmCharts.makeChart("chartdiv1", {
            "theme": "light",
            "type": "serial",
            "titles": [{
                    "text": "Reporte de ingresos del "+año +" según el mes",
                    "size": 16
                }],            
            "startDuration": 2,
            "dataProvider": objeto,
            "valueAxes": [{
                    "position": "left",
                    "title": "Ingresos (S/.)"
                }],
            "graphs": [{
                    "balloonText": "[[category]]: <b>[[value]]</b>",
                    "fillColorsField": "color",
                    "fillAlphas": 1,
                    "lineAlpha": 0.1,
                    "type": "column",
                    "valueField": "total"
                }],
            "depth3D": 20,
            "angle": 30,
            "chartCursor": {
                "categoryBalloonEnabled": false,
                "cursorAlpha": 0,
                "zoomable": false
            },
            "categoryField": "mes",
            "categoryAxis": {
                "gridPosition": "start",
                "labelRotation": 90,
                "title": "Meses"
            },
            "export": {
                "enabled": true,
                "menu": []
            }

        });
    };
        
    _private.setBarras3 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "serial",            
            "theme": "light",          
            "categoryField": "mes",
            "rotate": true,
            "startDuration": 1,
            "categoryAxis": {
                    "gridPosition": "start",
                    "position": "left",
                    "title": "Años"
            },
            "trendLines": [],
            "graphs": [
                    {
                        "balloonText": "sobre:[[value]]",
                        "fillAlphas": 0.8,
                        "id": "AmGraph-1",
                        "lineAlpha": 0.2,
                        "title": "Sobre",
                        "type": "column",
                        "valueField": "sobre",
                        labelText: "sobre:[[value]]"
                    },
                    {
                        "balloonText": "paquete:[[value]]",
                        "fillAlphas": 0.8,
                        "id": "AmGraph-2",
                        "lineAlpha": 0.2,
                        "title": "Paquete",
                        "type": "column",
                        "valueField": "paquete",
                        labelText: "paquete:[[value]]"
                    }
            ],
            "guides": [],
            "valueAxes": [
                    {
                        "id": "ValueAxis-1",
                        "position": "left",
                        "axisAlpha": 0,
                        "title": "Ingresos (S/.)"
                    }
            ],
            "allLabels": [],
            "balloon": {},
            "titles": [
                {
                    "text": "Reporte de ingresos de sobres vs ingresos de paquetes según el año"
                }
            ],
            "dataProvider": objeto,
            "export": {
                "enabled": true,
                "menu": []
            }

        });            
    };    
        
    _private.setBarras4 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);        
        var año = $("#listarAño").val();        
        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "serial",            
            "theme": "light",          
            "categoryField": "mes",
            "rotate": true,
            "startDuration": 1,
            "categoryAxis": {
                    "gridPosition": "start",
                    "position": "left",
                    "title": "Meses"
            },
            "trendLines": [],
            "graphs": [
                    {
                        "balloonText": "sobre:[[value]]",
                        "fillAlphas": 0.8,
                        "id": "AmGraph-1",
                        "lineAlpha": 0.2,
                        "title": "Sobre",
                        "type": "column",
                        "valueField": "sobre"
                    },
                    {
                        "balloonText": "paquete:[[value]]",
                        "fillAlphas": 0.8,
                        "id": "AmGraph-2",
                        "lineAlpha": 0.2,
                        "title": "Paquete",
                        "type": "column",
                        "valueField": "paquete"
                    }
            ],
            "guides": [],
            "valueAxes": [
                    {
                        "id": "ValueAxis-1",
                        "position": "left",
                        "axisAlpha": 0,
                        "title": "Ingresos (S/.)"
                    }
            ],
            "allLabels": [],
            "balloon": {},
            "titles": [
                 {
                    "text": "Reporte de ingresos de sobres vs paquetes del "+año+" según el mes"
                }
            ],
            "dataProvider": objeto,
            "export": {
                "enabled": true,
                "menu": []
            }

        });            
    };    

    _private.setBarrasFecha1 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        var from = $('#from').val();
        var to = $('#to').val();                                
        
        var chart = AmCharts.makeChart("chartdiv1", {
            
            "type": "serial",
            "theme": "none",
            "titles": [{
                    "text": "Reporte de ingresos desde el "+from+" hasta el "+to,
                    "size": 16
                }],              
            "legend": {
                "horizontalGap": 10,
                "maxColumns": 1,
                "position": "right",
                "useGraphSettings": true,
                "markerSize": 10
            },
            "dataProvider": objeto,
            "graphs": [{
                "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                "fillAlphas": 0.8,
                "labelText": "[[value]]",
                "lineAlpha": 0.3,
                "title": "Sobres",
                "type": "column",
                "color": "#000000",
                "valueField": "sobre"
            }, {
                "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
                "fillAlphas": 0.8,
                "labelText": "[[value]]",
                "lineAlpha": 0.3,
                "title": "Paquetes",
                "type": "column",
                "color": "#000000",
                "valueField": "paquete"
            }],
            "categoryField": "mes",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "gridAlpha": 0,
                "position": "left",
                "title": "Fecha"
            },
            "valueAxes": [
                    {
                        "id": "ValueAxis-1",
                        "position": "left",
                        "axisAlpha": 0,
                        "title": " Ingresos (S/.)"
                    }                
            ],
            "export": {
                "enabled": true,
                "menu": []
             }
        });   
    };


    _private.setPie1 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv2", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Reporte % de ingresos según el año",
                    "size": 16
                }],
            "dataProvider": objeto,
            "valueField": "total",
            "titleField": "mes",
            "startEffect": "elastic",
            "startDuration": 2,
            "labelRadius": 15,
            "innerRadius": "50%",
            "depth3D": 10,
            "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
            "angle": 15,
            "export": {
                "enabled": true,
                "menu": []
            }
        });
    };

    _private.setPie2 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        var año = $("#listarAño").val();
        
        var chart = AmCharts.makeChart("chartdiv2", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Reporte % ingresos del "+año+" según el mes",
                    "size": 16
                }],
            "dataProvider": objeto,
            "valueField": "total",
            "titleField": "mes",
            "startEffect": "elastic",
            "startDuration": 2,
            "labelRadius": 15,
            "innerRadius": "50%",
            "depth3D": 10,
            "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
            "angle": 15,
            "export": {
                "enabled": true,
                "menu": []
            }
        });
    };
    
    _private.setPie3 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        var tipo = $("#listarTipo").val();
        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Reporte % de ingresos de "+tipo+" según el año",
                    "size": 16
                }],
            "dataProvider": objeto,
            "valueField": "total",
            "titleField": "mes",
            "startEffect": "elastic",
            "startDuration": 2,
            "labelRadius": 15,
            "innerRadius": "50%",
            "depth3D": 10,
            "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
            "angle": 15,
            "export": {
                "enabled": true,
                "menu": []
            }
        });                
    };        
    
    _private.setLineasFecha1 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);       

        var from = $('#from').val();
        var to = $('#to').val();
        
        var chart = AmCharts.makeChart("chartdiv2", {
        "type": "serial",
        "titles": [{
                "text": "Reporte de ingresos desde el "+from+" hasta el "+to,
                "size": 16
            }],           
        "theme": "light",
        "marginRight": 40,
        "marginLeft": 40,
        "autoMarginOffset": 20,
        "mouseWheelZoomEnabled":true,
        "dataDateFormat": "YYYY-MM-DD",
        "valueAxes": [{
            "id": "v1",
            "axisAlpha": 0,
            "position": "left",
            "ignoreAxisWidth":true,
            "title": "Ingresos (S/.)"
        }],
        "balloon": {
            "borderThickness": 1,
            "shadowAlpha": 0
        },
        "graphs": [{
            "id": "g1",
            "balloon":{
              "drop":true,
              "adjustBorderColor":false,
              "color":"#ffffff"
            },
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "bulletColor": "#FFFFFF",
            "bulletSize": 5,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "title": "red line",
            "useLineColorForBulletBorder": true,
            "valueField": "total",
            "balloonText": "<span style='font-size:18px;'>[[value]]</span>"
        }],
        "chartScrollbar": {
            "graph": "g1",
            "oppositeAxis":false,
            "offset":30,
            "scrollbarHeight": 80,
            "backgroundAlpha": 0,
            "selectedBackgroundAlpha": 0.1,
            "selectedBackgroundColor": "#888888",
            "graphFillAlpha": 0,
            "graphLineAlpha": 0.5,
            "selectedGraphFillAlpha": 0,
            "selectedGraphLineAlpha": 1,
            "autoGridCount":true,
            "color":"#AAAAAA"
        },
        "chartCursor": {
            "pan": true,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha":1,
            "cursorColor":"#258cbb",
            "limitToGraph":"g1",
            "valueLineAlpha":0.2,
            "valueZoomable":true
        },
        "valueScrollbar":{
          "oppositeAxis":false,
          "offset":50,
          "scrollbarHeight":10
        },
        "categoryField": "mes",
        "categoryAxis": {
            "parseDates": true,
            "dashLength": 1,
            "minorGridEnabled": true,
            "title": "Fechas"
        },
        "export": {
            "enabled": true,
                "menu": []
        },
        "dataProvider": objeto
    });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
        }
    };   
    
    _private.setBarrasFecha2 = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);       

        var from = $('#from').val();
        var to = $('#to').val();        
        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "serial",
            "titles": [{
                "text": "Reporte de tipos de ingresos desde el "+from+" hasta el "+to,
                "size": 16
            }],               
             "theme": "light",
             "marginRight":30,
             "legend": {
                 "equalWidths": false,
                 "periodValueText": "total: [[value.sum]]",
                 "position": "top",
                 "valueAlign": "left",
                 "valueWidth": 100
             },
             "dataProvider": objeto,
             "valueAxes": [{
                 "stackType": "regular",
                 "gridAlpha": 0.07,
                 "position": "left",
                 "title": "Ingresos (S/.)"
             }],
             "graphs": [{
                 "balloonText": "<img src='https://www.amcharts.com/lib/3/images/car.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>",
                 "fillAlphas": 0.6,
                 "hidden": true,
                 "lineAlpha": 0.4,
                 "title": "Otro",
                 "valueField": "Otro"
             }, {
                 "balloonText": "<img src='https://www.amcharts.com/lib/3/images/motorcycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>",
                 "fillAlphas": 0.6,
                 "lineAlpha": 0.4,
                 "title": "Paquetes",
                 "valueField": "paquete"
             }, {
                 "balloonText": "<img src='https://www.amcharts.com/lib/3/images/bicycle.png' style='vertical-align:bottom; margin-right: 10px; width:28px; height:21px;'><span style='font-size:14px; color:#000000;'><b>[[value]]</b></span>",
                 "fillAlphas": 0.6,
                 "lineAlpha": 0.4,
                 "title": "Sobres",
                 "valueField": "sobre"
             }],
             "plotAreaBorderAlpha": 0,
             "marginTop": 10,
             "marginLeft": 0,
             "marginBottom": 0,
             "chartScrollbar": {},
             "chartCursor": {
                 "cursorAlpha": 0
             },
             "categoryField": "mes",
             "categoryAxis": {
                 "startOnAxis": true,
                 "axisColor": "#DADADA",
                 "gridAlpha": 0.07,
                 "title": "Fecha",
                 "guides": [{
                     category: "2001",
                     toCategory: "2003",
                     lineColor: "#CC0000",
                     lineAlpha: 1,
                     fillAlpha: 0.2,
                     fillColor: "#CC0000",
                     dashLength: 2,
                     inside: true,
                     labelRotation: 90,
                     label: "fines for speeding increased"
                 }, {
                     category: "2007",
                     lineColor: "#CC0000",
                     lineAlpha: 1,
                     dashLength: 2,
                     inside: true,
                     labelRotation: 90,
                     label: "motorcycle fee introduced"
                 }]
             },
             "export": {
                 "enabled": true,
                "menu": []
              }
         });            
    };
    
var myObj = { firstname : "John", lastname : "Doe" };
console.log(myObj);

    var charts = {};
    
    function fc_export_pdf()
    {
        try
        {
            var images = [];
            var ids = ["chartdiv1", "chartdiv2", "chartdiv3"];
            var charts_remaining = ids.length;
            
            var pending = AmCharts.charts.length;
            
            for (var i = 0; i < ids.length; i++) {
                for (var x = 0; x < AmCharts.charts.length; x++) {
                    if (AmCharts.charts[x].div.id === ids[i])
                        charts[ids[i]] = AmCharts.charts[x];
                }
            }
            
            for (var x in charts) {
                if (charts.hasOwnProperty(x)) {
                    var chart = charts[x];
                    chart.export.capture( {}, function() {
                      this.toJPG( {
                        multiplier: 2
                      }, function( data ) {
                        images.push( {
                          "image": data,
                          "fit": [ 523.28, 769.89 ]
                        } );

                        charts_remaining--;

                            if ( charts_remaining === 0 ) {
                                // all done - construct PDF
                                chart.export.toPDF( {
                                  content: images
                                }, function( data ) {
                                  this.download( data, "application/pdf", "ReporteIngreso.pdf" );
                                } );
                            }
                        } );
                    } );
                }
            }
        }
        catch(err)
        {
            alert('Ocurrió un error al exportar.\nConsulte con el administrador.');
            console.log(err.message);
        }
    }

//    function fc_export_excel()
//    {
//        try
//        {
//            
//            var ids = ["chartdiv1", "chartdiv2", "chartdiv3"];
//            var charts_remaining = ids.length;
//            
//            var pending = AmCharts.charts.length;
//            
//            for (var i = 0; i < ids.length; i++) {
//                for (var x = 0; x < AmCharts.charts.length; x++) {
//                    if (AmCharts.charts[x].div.id === ids[i])
//                        charts[ids[i]] = AmCharts.charts[x];
//                }
//            }
//            
//            for (var x in charts) {
//                if (charts.hasOwnProperty(x)) {
//                    var chart = charts[x];
//                    
//                        charts_remaining--;
//
//                        if ( charts_remaining === 0 ) {
//                          // all done - construct PDF
//                          chart["export"].toXLSX( {
//                            data: chart.dataProvider
//                          }, function( data ) {
//                             this.download(data, this.defaults.formats.XLSX.mimeType, "amCharts.xlsx");
//                          } );
//                        }
//                    
//   
//                }
//            }
//        }
//        catch(err)
//        {
//            alert('Ocurrió un error al exportar.\nConsulte con el administrador.');
//            console.log(err.message);
//        }
//    }
//    
//    function exportXLSX() {
//    var chart = {};
//    chart["export"].toXLSX({
//      data: chart.dataProvider
//    }, function(data) {
//      this.download(data, this.defaults.formats.XLSX.mimeType, "amCharts.xlsx");
//    });
//}
