<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>        
        <script src="js/validarVehiculo.js" type="text/javascript"></script>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/ConsumirWebServiceAuto.js" type="text/javascript"></script>
        <title>JSP Page</title>        
    </head>
    <body>       
        <div class="container" >
            <div align="right">
                <br>                
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>
            <h1>Insertar Vehiculo</h1>
            <hr>            
            <form name="frmInsertarVehiculo" method="POST" action="SERVVehiculo" onsubmit="return validacion()" >
                <div class="container">                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group"> 
                                <label for="placa_id" class="control-label">PLACA</label>
                                <input type="text" class="form-control" id="placa_id" name="txtPlaca" placeholder="PE1324">
                            </div>      
                            <div class="form-group">
                                <label for="con_id" class="control-label">CONDUCTOR</label>
                                <br>
                                <select name="txtCon" id="con_id" class="form-control">
                                    <option value="">--Seleccione Conductor--</option>
                                    <c:forEach var="con" items="${conductor}" >
                                        <option value="${con.id}">
                                            ${con.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                            </div>
                            <div class="form-group">
                                <label for="ayu_id" class="control-label">AYUDANTE</label>
                                <br>
                                <select name="txtAyu" id="ayu_id" class="form-control">
                                    <option value="">--Seleccione Ayudante--</option>
                                    <c:forEach var="ayu" items="${ayudante}" >
                                        <option value="${ayu.id}">
                                            ${ayu.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                            </div>   
                            
                            <div class="form-group"> 
                                <label for="car-years" class="control-label">AÑO</label>    
                                
                                <select name="Año" id="car-years" class="form-control"></select>
                                <br>          
                                <div>
                                    <label for="añoSelecionado" class="control-label">AÑO SELECCIONADO</label>       
                                    <input  class="form-control" id="añoSelecionado" readonly="" name="txtAño" value="--Elija Año--" >
                                </div>                                                                
                            </div> 
                            
                            <div class="form-group">                                
                                <label for="car-makes" class="control-label">MARCA</label>       
                                <select name="Marca" id="car-makes" class="form-control"></select>
                                <br>                                                             
                                    <div>
                                        <label for="marcaSelecionado" class="control-label">MARCA SELECCIONADA</label>
                                        <input   class="form-control" id="marcaSelecionado" readonly="" name="txtMarca" value="--Elija Marca--" >                        
                                    </div>                                                                                            
                            </div>
                            
                        </div>
                        <div class="col-md-6">                            
                            <div class="form-group">                                                                
                                <label for="car-models" class="control-label">MODELO</label> 
                                <select name="Modelo" id="car-models" class="form-control"></select><br>
                                <br>
                                <div>
                                    <label for="modeloSelecionado" class="control-label">MODELO SELECCIONADO</label>        
                                    <input type="text" class="form-control" id="modeloSelecionado" readonly="" name="txtModelo" value="--Elija Modelo--" >                                    
                                </div>                                                                                                
                            </div>
                            
                            <div class="form-group">                                                                
                                <label for="car-model-trims" class="control-label">SEIRE</label> 
                                <select name="Serie" id="car-model-trims"></select> 
                                <br>
                                <div>
                                    <label for="serieSelecionada" class="control-label">SERIE SELECCIONADA</label>        
                                    <input type="text" class="form-control" id="serieSelecionada" readonly="" name="txtModelo" value="--Elija Modelo--" >                                    
                                </div>                                                                                                
                            </div>     
                            
                            <div class="form-group"> 
                                <label for="cap_id" class="control-label">CAPACIDAD MAX</label>
                                <input type="text" class="form-control" id="cap_id" name="txtCapmax" placeholder="5">
                            </div>          
                            <div class="form-group">
                                <label for="pas_id" class="control-label">PASAJEROS MAX</label>
                                <input type="text" class="form-control" id="pas_id" name="txtPasmax" placeholder="2">
                            </div>  
                        </div>                        
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group"> <!-- Submit Insertar -->
                                <input type="submit" name="btnInsertar" value="Insertar" class="btn btn-success btn-lg">
                                <a href="SERVVehiculo?action=refresh"  class="btn btn-danger btn-lg">Atrás</a>
                                <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg">
                            </div>                             
                        </div>                    
                    </div>                        
                </div>
            </form>           
        </div>
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
                document.getElementById("marca_id").value = marca;                
            } 
            
            document.getElementById("listarMarca").addEventListener("click", seleccionarAño);
            function seleccionarAño(){                
                var e = document.getElementById("listarAño");
                var year = e.options[e.selectedIndex].text;                               
                document.getElementById("año_id").value = year; //siempre envia 2016                
            }           
                
            document.getElementById("listarAño").addEventListener("click", llamarModelo);
            function llamarModelo() {
                var marca = document.getElementById("marca_id").value;
                var año = document.getElementById("año_id").value;
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
                var modelo = e.options[e.selectedIndex].text;
                document.getElementById("modelo_año").value = modelo;
            }                        
        </script>    
    </body>
</html>
