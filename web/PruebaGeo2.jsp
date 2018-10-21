<%-- 
    Document   : PruebaGeo2
    Created on : 09/10/2018, 02:28:13 AM
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <title>JSP Page</title>

    </head>
    <body>
        <a href="Admin/admin.jsp">Volver</a><br>
        <input type="button" onclick="detener()" value="Detener"/>
        Lalitud: <input input id="campoLatitud"/><br>
        Longitud: <input input id="campoLongitud"/><br>
        Altitud: <input input id="campoAltitud"/><br>
    </body>

    <script>
        window.addEventListener("load",inicio);
        var observador; 
        function inicio(){
            //navigator.geolocation.getCurrentPosition(alExito, alError);
            observador = navigator.geolocation.watchPosition(alExito, alError);
        }
        function alExito(info){
            campoLatitud.value = info.coords.latitude;
            campoLongitud.value = info.coords.longitude;
            campoAltitud.value = info.coords.altitud;
        }
        function alError(error){
            alert("Hubo un error");
        }
        function detener(){
            navigator.geolocation.clearWatch(observador);
        }
    </script>

</html>
