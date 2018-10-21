
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <div id="texto">
        <button id="cargaCatalogo">Visualizar Información</button>            
        </div>
        <table id="demo" border="1" align="center"></table>   
<script type="text/javascript">
    document.getElementById("cargaCatalogo").addEventListener("click", cargaCatalogo);
    function cargaCatalogo(){
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (){
            if(this.readyState == 4 && this.status ==200){
                cargarXML(this);                
            }
        };
        xhr.open("GET","https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=XML", true);
        xhr.send();
    }
    
    function cargarXML(xml){
        var docXML = xml.responseXML;
        var tabla = "<tr><th>Código</th><th>Nombre</th></tr>";
        var resultado = docXML.getElementsByTagName("AllVehicleMakes");
        for(var i = 0; i < resultado.length; i++){
            tabla += "<tr><td>";
            tabla += resultado[i].getElementsByTagName("Make_ID")[0].textContent;
            tabla += "</td><td>";
            tabla += resultado[i].getElementsByTagName("Make_Name")[0].textContent;
            tabla += "</td></tr>";            
        }
        document.getElementById("demo").innerHTML = tabla;
    }            
</script>       
    </body>   
</html>
