var index_ = function () {

    /*metodos, propiedades privadas*/
    var _private = {};

    _private.setBarras = function (data) {
        var objeto = JSON.parse(data.mensaje);  
        alert(objeto.length);

        var chart = AmCharts.makeChart("chartdiv", {
            "theme": "light",
            "type": "serial",
            "titles": [{
                    "text": "Ingresos de Encomiendas por Mes",
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
        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv", {
            "type": "pie",
            "theme": "light",
            "titles": [{
                    "text": "Ingresos de Encomiendas por Mes",
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
    
    _private.setBarrasIntervalo = function (data) {
        var objeto = JSON.parse(data.mensaje);  
        alert(objeto.length);
        
        var chart = AmCharts.makeChart("chartdiv2", {
        "type": "serial",
        "titles": [{
                "text": "Ingresos de Encomiendas por Fecha",
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
        var chart = AmCharts.makeChart("chartdiv3", {
            "type": "serial",
            "theme": "light",
                "categoryField": "year",
                "rotate": true,
                "startDuration": 1,
                "categoryAxis": {
                        "gridPosition": "start",
                        "position": "left"
                },
                "trendLines": [],
                "graphs": [
                        {
                            "balloonText": "Income:[[value]]",
                            "fillAlphas": 0.8,
                            "id": "AmGraph-1",
                            "lineAlpha": 0.2,
                            "title": "Income",
                            "type": "column",
                            "valueField": "income"
                        },
                        {
                            "balloonText": "Expenses:[[value]]",
                            "fillAlphas": 0.8,
                            "id": "AmGraph-2",
                            "lineAlpha": 0.2,
                            "title": "Expenses",
                            "type": "column",
                            "valueField": "expenses"
                        }
                ],
                "guides": [],
                "valueAxes": [
                        {
                            "id": "ValueAxis-1",
                            "position": "top",
                            "axisAlpha": 0
                        }
                ],
                "allLabels": [],
                "balloon": {},
                "titles": [],
                "dataProvider": [
                        {
                                "year": 2005,
                                "income": 23.5,
                                "expenses": 18.1
                        },
                        {
                                "year": 2006,
                                "income": 26.2,
                                "expenses": 22.8
                        },
                        {
                                "year": 2007,
                                "income": 30.1,
                                "expenses": 23.9
                        },
                        {
                                "year": 2008,
                                "income": 29.5,
                                "expenses": 25.1
                        },
                        {
                                "year": 2009,
                                "income": 24.6,
                                "expenses": 25
                        }
                ],
            "export": {
                "enabled": true
            }

        });            
    };

    _private.setTipoPie = function (data) {
        var objeto = JSON.parse(data.mensaje);  
        alert(objeto.length);
        
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
        $('#btnGraficoPastelGananciaEncomiendaPorIntervalo').click(function () {
            index.getGraficoBarrasIntervalo();
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
    
    _public.getGraficoBarrasIntervalo = function () {
        $.ajax({
            type: "POST",           
            url: 'SERVReporte',
            data: "&action=listarEncomiendaPorFecha",
            dataType: 'json',
            success: function (data) {
                 console.log(data.mensaje);
                _private.setBarrasIntervalo(data);
            }
        });        
        
    };    
    
    _public.getGraficoTipoBarras = function () {
        _private.setTipoBarras();

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
