<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        Marca <input type="text" id="nom_id" >
        Año    <input type="text" id="año_id" >
        <button id="cargaCatalogo">Visualizar Información</button>            
        </div>
        <table id="demo" border="1" align="center"></table>

<script type="text/javascript">
    document.getElementById("cargaCatalogo").addEventListener("click", cargaCatalogo);
    function cargaCatalogo(){
        var marca = document.getElementById("nom_id").value;
        var año = document.getElementById("año_id").value;
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (){
            if(this.readyState == 4 && this.status ==200){
                cargarXML(this);                
            }
        };
        xhr.open("GET","https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/"+marca+"/modelyear/"+año+"?format=xml", true);
        xhr.send();
    }
    
    function cargarXML(xml){
        var docXML = xml.responseXML;
        var tabla = "<tr><th>Marca</th><th>Modelo</th></tr>";
        var mar = "";
        var resultado = docXML.getElementsByTagName("MakeModels");
        for(var i = 0; i < resultado.length; i++){
            tabla += "<tr><td>";
            tabla += resultado[i].getElementsByTagName("Make_Name")[0].textContent;
            tabla += "</td><td>";
            tabla += resultado[i].getElementsByTagName("Model_Name")[0].textContent;
            tabla += "</td></tr>";            
        }
        document.getElementById("demo").innerHTML = tabla;
    }            
</script>       
    </body>   
</html>
