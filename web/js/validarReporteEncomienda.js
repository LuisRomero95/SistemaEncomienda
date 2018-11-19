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
    
    
    var reporte = $('#btnGraficoBarraGananciaEncomiendaPorMes').val();
    

    

var index_ = function () {
               
    /*metodos, propiedades privadas*/
    var _private = {};

    _private.setBarras = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);

        var chart = AmCharts.makeChart("chartdiv", {
            "theme": "light",
            "type": "serial",
            "titles": [{
                    "text": "Ingresos de encomiendas según el mes",
                    "size": 16
                }],            
            "startDuration": 2,
            "dataProvider": objeto,
            "valueAxes": [{
                    "position": "left",
                    "title": "Ingresos en soles"
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
                "labelRotation": 90
            },
            "export": {
                "enabled": true
            }

        });
    };

    _private.setPie = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Ingresos de encomiendas según el mes",
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
                "enabled": true
            }
        });
    };
    
    _private.setBarrasFecha = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv2", {
        "type": "serial",
        "titles": [{
                "text": "Ingresos de encomiendas según la fecha",
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
            "ignoreAxisWidth":true
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
            "minorGridEnabled": true
        },
        "export": {
            "enabled": true
        },
        "dataProvider": objeto
    });

        chart.addListener("rendered", zoomChart);

        zoomChart();

        function zoomChart() {
            chart.zoomToIndexes(chart.dataProvider.length - 40, chart.dataProvider.length - 1);
        }
    };    
    
    _private.setTipoBarras = function (data) {
        var objeto = JSON.parse(data.mensaje);  
        alert(objeto.length);        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "serial",            
            "theme": "light",          
            "categoryField": "mes",
            "rotate": true,
            "startDuration": 1,
            "categoryAxis": {
                    "gridPosition": "start",
                    "position": "left"
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
                        "position": "top",
                        "axisAlpha": 0,
                        "title": "Ingresos de tipos de encomienda según el mes"
                    }
            ],
            "allLabels": [],
            "balloon": {},
            "titles": [],
            "dataProvider": objeto,
            "export": {
                "enabled": true
            }

        });            
    };

    _private.setTipoPie = function (data) {
        var objeto = JSON.parse(data.mensaje);  
//        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Ingresos de Tipo de Encomiendas",
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
                "enabled": true
            }
        });        
        
    };

    /*metodos, propiedades publicas*/
    var _public = {};

    _public.init = function () {
        
        /*Encomienda*/
        $('#btnGraficoBarraGananciaEncomiendaPorMes').click(function () {
            index.getGraficoBarras();
        });
        $('#btnGraficoPastelGananciaEncomiendaPorMes').click(function () {
            index.getGraficoPie();
        });
        $('#btnGraficoPastelGananciaEncomiendaPorFecha').click(function () {
            
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
            index.getGraficoBarrasFecha();
        });
        
        /*Tipo de Encomienda*/
        $('#btnGraficoBarraGananciaTipoEncomiendaPorMes').click(function () {
            index.getGraficoTipoBarras();
        });
        $('#btnGraficoPastelGananciaTipoEncomiendaPorMes').click(function () {
            index.getGraficoTipoPie();
        });
        $('#btnGraficoPastelGananciaTipoEncomiendaPorIntervalo').click(function () {
            index.getGraficoTipoBarrasIntervalo();
        });        
        
    };
    
var myObj = { firstname : "John", lastname : "Doe" };
console.log(myObj);

    _public.getGraficoBarras = function () {
        $.ajax({
            type: "POST",            
            url: 'SERVReporte',
            data: "&action=listarEncomiendaPorMes",
            dataType: 'json',
            success: function (data) {
                console.log(data.mensaje);
               _private.setBarras(data);
            }
        });
    };
    _public.getGraficoPie = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarEncomiendaPorMes",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setPie(data);
            }
        });
    };
    
    _public.getGraficoBarrasFecha = function () {
        var fecha_inicio = $("#from").val();
        var fecha_final = $("#to").val();
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarEncomiendaPorFecha&fechaI="+fecha_inicio+"&fechaF="+fecha_final,
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setBarrasFecha(data);
            }
        });        
        
    };    
    
    _public.getGraficoTipoBarras = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoEncomiendaMes",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setTipoBarras(data);
            }
        });

    };
    _public.getGraficoTipoPie = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarTipoEncomienda",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setTipoPie(data);
            }
        });
    };
    
    _public.getGraficoTipoBarrasIntervalo = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarEncomiendaPorFecha",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setTipoBarrasIntervalo(data);
            }
        });        
        
    };      

    return _public;          

};

var index = new index_();
