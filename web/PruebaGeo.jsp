<%-- 
    Document   : PruebaGeo
    Created on : 08/10/2018, 11:55:16 PM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style>
            #map{
                width: 300px;
                height: 500px;
            }
        </style>
    </head>
    <body>
        <input type="button" onclick="findMe()" value="Mostrar Ubicación"></input>
        <div id="map"></div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDLXSTqGje9YBLx6MTpPgbzMm2GW3uEJ8">
            function findMe(){
                //Verificar si soporta geolocalización
                var output =document.getElementById('map');
                if(navigator.geolocation){
                    output.innerHTML = "<p>Tu Navegador Soporta Geolocalización</p>";
                }
                else{
                    output.innerHTML = "<p>Tu Navegador no Soporta Geolocalización</p>";
                }
                //obtenemos latitud y longitud
                function localizacion(posicion){
                    var latitud = posicion.coords.latitude;
                    var longitude = posicion.coords.longitude;
                    
                    output.innerHTML = "<p>Latitud: "+ latitud+"<br>Longitud: "+longitude+"</p>";
                    
                    var imgUrl = "https://maps.googleapis.com/maps/api/staticmap?center="+latitud+","+longitude+ "&size=600x300&markers=color:red%7("+latitud+","+longitude+"&key=AIzaSyBDLXSTqGje9YBLx6MTpPgbzMm2GW3uEJ8";
        
                    output.innerHTML = "<img src='"+imgUrl+"'>";
                }
                function error(){
                    output.innerHTML = "<p> No se puedo obtener tu ubicación</p>";
                }
                navigator.geolocation.getCurrentPosition(localizacion, error);
               

            }                        
        </script>
    </body>
</html>
