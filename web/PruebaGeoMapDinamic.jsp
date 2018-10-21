<%-- 
    Document   : PruebaGeo
    Created on : 08/10/2018, 11:55:16 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="x-ua-compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDLXSTqGje9YBLx6MTpPgbzMm2GW3uEJ8&callback=initMap"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mapa Interactivo</h1>
        <div id="mapa" style="width: 700px; height: 500px;">
            --Aca se va a ver el mapa--
        </div>
        <script type="text/javascript">
            //NAMESPAC --> googlr.maps.ALGO MAPA COORDENADAS CHINCHES
            var divMapa = document.getElementById('mapa');
            navigator.geolocation.getCurrentPosition(fn_ok, fn_mal);
            function fn_mal(){}
            function fn_ok(rta){
                var lat = rta.coords.latitude;
                var lon = rta.coords.longitude;
                
                var gLatLon = new google.maps.LatLng(lat,lon);
                var objConfig = {
                    zoom: 17,
                    center: gLatLon                    
                };
                
                var gMapa = new google.maps.Map(divMapa, objConfig);
                var objConfigMarker = {
                    position : gLatLon,
                    map:gMapa,
                    title: "Usted esta aquí"
                };
                
                var gMarker = new google.maps.Marker( objConfigMarker);
                
                var gCoder = new google.maps.Geocoder();
                var objInformacion = {
                    address: 'Pje Wacaypata San Luis 15021'
                };
                
                gCoder.geocode(objInformacion, fn_coder);
                
                function fn_coder(datos){
                    var coordenadas = datos[0].geometry.location;
                    //LatLong
                    var config = {
                        map: gMapa,
                        position: coordenadas,
                        title: "Casa"
                    };
                    var gMarkerDV = new google.maps.Marker(config);
                   
                }
            }
        </script>
    </body>
</html>
