<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html>
<html>
    <head>

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>      
        <!--https://www.youtube.com/watch?v=FDcNhR0Pzm8&app=desktop-->        
        
        <a href="Admin/admin.jsp">Volver</a><br>
        
        <label for="listarMarca" class="control-label">MARCA</label>       
        <select id="listarMarca" onchange="seleccionarMarca()" class="form-control">
            <option>  Cargando marca...</option>
        </select><br>
       
        <label for="text1" class="control-label">Marca Seleccionada:</label>
        <input type="text" name="txtMarca" id="text1" value="--Elija Marca--" readonly="" class="form-control"><br>
    
        <label for="listarAño" class="control-label">AÑO</label>       
        <select id="listarAño" onchange="seleccionarAño()" class="form-control">
            <option>--Seleccione un año--</option>
            <option>2010</option>
            <option>2011</option>
            <option>2012</option>
            <option>2013</option>
            <option>2014</option>
            <option>2015</option>
            <option>2016</option>
            <option>2017</option>
            <option>2018</option>
        </select><br>
        
        <label for="text2" class="control-label">Año Seleccionado:</label>       
        <input type="text" name="txtAño" id="text2" value="--Elija Año--" readonly="" class="form-control"><br>         

        <label for="listarModelo" class="control-label">MODELO</label> 
        <select id="listarModelo" onchange="modeloSeleccionada()"  class="form-control">
        </select><br> 
        <label>Modelo Seleccionado:</label>        
        <input type="text" name="txtModelo" id="text3" value="--Elija Modelo--"><br>  
        
        
        <script type="text/javascript">            
            function llamarMarca() {
                if(window.XMLHttpRequest){
                    xmlhttp = new XMLHttpRequest();
                }else{
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                xmlhttp.onreadystatechange = function (){
                    if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
                        if(xmlhttp.responseXML !== null){
                            ejecutarMarca(this);
                        }
                    }
                };
                xmlhttp.open("GET","https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=XML", true);
                xmlhttp.send();
            }
            function ejecutarMarca(xmlhttp){
                var resultado = document.getElementById("listarMarca");
                var xmlDoc = xmlhttp.responseXML;
                var marcas = "";
                var vehiculo = xmlDoc.getElementsByTagName("AllVehicleMakes");

                for(var i = 0; i < vehiculo.length; i++){                   
                    marcas += "<option>" +
                            vehiculo[i].getElementsByTagName("Make_Name")[0].childNodes[0].nodeValue +
                            "</option>";                    
                }
                resultado.innerHTML = marcas;
            }
            
            llamarMarca();
            function seleccionarMarca(){
                var e = document.getElementById("listarMarca");
                var marca = e.options[e.selectedIndex].text;                               
                document.getElementById("text1").value = marca;                
            } 
            
            document.getElementById("listarMarca").addEventListener("click", seleccionarAño);
            function seleccionarAño(){
                var e = document.getElementById("listarAño");
                var year = e.options[e.selectedIndex].text;                               
                document.getElementById("text2").value = year;                 
            }           
                
            document.getElementById("listarAño").addEventListener("click", llamarModelo);
            function llamarModelo() {
                var marca = document.getElementById("text1").value;
                var año = document.getElementById("text2").value;
                if(window.XMLHttpRequest){
                    xmlhttp = new XMLHttpRequest();
                }else{
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                
                xmlhttp.onreadystatechange = function (){
                    if(xmlhttp.readyState === 4 && xmlhttp.status === 200){
                        if(xmlhttp.responseXML !== null){
                            ejecutarModelo(this);
                        }
                    }
                };
                xmlhttp.open("GET","https://vpic.nhtsa.dot.gov/api/vehicles/getmodelsformakeyear/make/"+marca+"/modelyear/"+año+"?format=xml", true);
                xmlhttp.send();
            }
            function ejecutarModelo(xmlhttp){
                var resultado = document.getElementById("listarModelo");
                var xmlDoc = xmlhttp.responseXML;
                var marcas = "<option>--Seleccione Modelo</option>";
                var vehiculo = xmlDoc.getElementsByTagName("MakeModels");

                for(var i = 0; i < vehiculo.length; i++){                   
                    marcas += "<option>" +
                            vehiculo[i].getElementsByTagName("Model_Name")[0].childNodes[0].nodeValue +
                            "</option>";                    
                }
                resultado.innerHTML = marcas;
            }
            
            llamarModelo();
            function modeloSeleccionada(){
                var e = document.getElementById("listarModelo");
                var marca = e.options[e.selectedIndex].text;
                document.getElementById("text3").value = marca;
            }            
            
        </script>

     
    </body>   
</html>
