<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
    else{
        String nivel = sesion.getAttribute("nivel").toString();
        if(!(nivel.equals("1") || nivel.equals("2"))){
            response.sendRedirect("navbar.jsp");
        }
    }    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC4Pta07pYlzbICVniGLYta4MLCrUrXrHE&sensor=false&libraries=geometry&v=3.4"></script>
    <jsp:include page="navbar.jsp"/>             
   <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin:0; padding:0; font-size:10px; }
      #map_canvas { height: 100% }
      #log { position:absolute; height:90px; width:100%; bottom:0px; background-color:#000; overflow:auto; color: #20FF02; font: normal 12px 'courier'; }
      #location_button_map { position: absolute; bottom: 100px; font-weight: bold; text-align: center; }
      .active { background-color: #C50707 !important; color:#fff; border:1px solid yellow; }
    </style>
  </head>
  
  <body onload="initialize()">
    <div id="map_canvas" style="width:300px; height: 500px"></div>
    <button id="location_button_map" type="button">Iniciar geolocalizacion</button>
    <div id="log"></div>
    <script type="text/javascript">    
    var dragActive = true;
      var mapa = null;
      var marker = null;
      var circle = null;
      var watcher = null;
      var lastPosition = null;
      var currentPosition = null;
 
      $(document).ready(function() {
        $('#location_button_map').on('click', function() {
          if (!$(this).hasClass('active')) {
            $(this).addClass('active').empty().html('Detener');
            if (navigator.geolocation) {
              dragActive = false;
              watcher = navigator.geolocation.watchPosition(function(position){
                var date = new Date();
                var hour = date.getHours();
                var minutes = date.getMinutes();
                var seconds = date.getSeconds();
                var datetime = hour+':'+minutes+':'+seconds;
                var distance = 0;
 
                $('#log').append('<div>Geolocation - '+dragActive+' ('+datetime+')</div>');
 
                currentPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
 
                // Establecer la distancia si lastPosition existe (validacion de primera vez)
                if (lastPosition !== null) {
                  distance = google.maps.geometry.spherical.computeDistanceBetween(lastPosition, currentPosition);
                }
                else {
                  lastPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                }
 
                // Si la distancia supera los 20 mts actualizar la posicion de la marca
                if (distance >= 20) {
                 	$('#log').append('<div>Actualizando posicion</div>');
                 	lastPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                 	$('#log').append('<div>'+lastPosition+'</div>');
                }
 
                marker.setPosition(currentPosition);
 
                // Desactivar el seguimiento cuando se activa el drag
                if (!dragActive) {
                  mapa.setZoom(17);
                  circle.setVisible(true);
                  mapa.setCenter(currentPosition);
                }
              }, function(error){
                circle.setVisible(false);
              }, {
                enableHighAccuracy:true, 
                maximumAge: 0, 
                timeout: 1000
              });
            }
            else {
              alert('Su dispositivo no permite la geolización');
            }
          }
          else {
          $(this).removeClass('active').empty().html('Iniciar geolocalizacion');
          if ((navigator.geolocation) && (watcher !== null)) {
            navigator.geolocation.clearWatch(watcher);
            circle.setVisible(false);
            dragActive = true;
          }
          }
        });
      });
 
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-34.397, 150.644),
          zoom: 17,
          disableDoubleClickZoom: false,
          disableDefaultUI: true,
          zoomControl: false,
          mapTypeControl: false,
          zoomControlOptions: {
            style: google.maps.ZoomControlStyle.LARGE,
            position: google.maps.ControlPosition.TOP_LEFT
          },
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
 
        mapa = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
 
        marker = new google.maps.Marker({
          title: 'conductor 1',
          map: mapa
        });
 
        circle = new google.maps.Circle({
          map: mapa,
          radius: 100,
          strokeWeight: 0,
          strokePosition: google.maps.StrokePosition.CENTER,
          fillColor: '#137900'
        });
 
        circle.bindTo('center', marker, 'position');
 
        // mapa.dragend
        google.maps.event.addListener(mapa, 'dragend', function(){
          var center = mapa.getCenter();
          if (!dragActive) {
            dragActive = true;
            circle.setVisible(false);
          }
 
          $('#log').append('<div>Drag event end</div>');
        });
      }
    </script>

</html>
