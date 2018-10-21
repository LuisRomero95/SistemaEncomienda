<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/validarPrecio.js" type="text/javascript"></script>       
        <script src="js/jquery.numeric.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">            
                       <h1>Ingresar Precio</h1>
                       <hr> 
               <form name="frmInsertarPrecio" method="POST" action="SERVPrecio" autocomplete="off" align="center">
                                       
    
                   <div id="radios">

                       <div class="col-md-6 col-md-offset-3 opciones">

                           <div class="radio-inline">
                               <input type="radio" name="txtTipoEnvio" id="sobres" value="sobre" checked="" >
                               <label for="sobres" class="material-icons">
                                   <p class="qoutnua">Sobres</p>
                                   <span><img src="https://www.olvacourier.com/wp-content/uploads/2017/08/asdasd.png" alt="box" style="width: 50px;height: 50px;"></span>
                               </label>                        
                           </div>

                           <div class="radio-inline">                        
                               <input name="txtTipoEnvio" id="paquetes" value="paquete" type="radio"><label for="paquetes" class="material-icons">
                                    <p class="qoutnua">Paquetes</p>
                                    <span><img src="https://www.olvacourier.com/wp-content/uploads/2017/08/cajadea.png" alt="box" style="width: 50px;height: 50px;"></span>
                                </label>
                           </div>  
                           <input type="hidden" name="txtContenedorEnvio" id="contenedorEnvio">
                       </div>

                   </div>

                   <div class="col-md-6 col-md-offset-3">

                       <div class="form-group">
                           <label for="cantidadSobres" class="control-label">Cantidad</label>
                           <input class="form-control" name="txtcantidadSobres" id="cantidadSobres" placeholder="Ingrese cantidad" type="text">
                           <br>
                           <label for="peso" class="control-label">Peso</label>
                           <input class="form-control" name="txtPeso" id="peso" name="peso"  placeholder="Ingrese el Peso" type="text">                           
                       </div>    

                       <div class="form-group">

                           <span id="gr-type" style="display: inline-block;" hidden="">GRAMOS (GR)</span><br>
                           <label for="unit" class="control-label" id="letreroConvertir">Seleccionar :</label>
                           <select id="unit" name="unit" style="display: none;" class="form-control">
                               <option value="KG">KILOGRAMOS (KG)</option>
                               <option value="GR">GRAMOS (GR)</option>
                           </select>      
                           <br>
                           <input class="form-control" id="convertido" name="convertido" readonly="" type="hidden">    
                       </div>

                   </div>

                   <div class="col-md-6 col-md-offset-3">

                       <div class="form-group">

                           <div id="measures" style="display: none;">                        

                               <div class="divmed form-group col-md-3" >
                                   <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/ancho.png" alt="ancho-caja">
                                   <input class="medan form-control col-md-3" id="width" name="width" step="0.01" min="1" value="" placeholder="Ingrese el Ancho (cm)" type="number">
                               </div>

                               <div class="divmed col-md-3" align="center">
                                   <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/largo.png" alt="largo-caja">
                                   <input class="medla form-control col-md-3" id="large" name="large" step="0.01" min="1" value="" placeholder="Ingrese el Largo (cm)" type="number">
                               </div>

                               <div class="divmed col-md-3" align="center">
                                   <img class="imgbox" src="https://www.olvacourier.com/nuevcalc/assets/images/misc/alto.png" alt="alto-caja">
                                   <input class="medal form-control col-md-3" id="height" name="height" step="0.01" min="1" value="" placeholder="Ingrese el Alto (cm)" type="number">
                               </div>

                               <div id="alert2"></div>                        
                           </div>

                       </div>               

                   </div>

                   <br>
                   <div class="col-md-6 col-md-offset-3">
                       <div class="form-group">
                           <div class="separnta"></div>                                            
                           <span id="price-label" class="font-size-20 grey-800">PRECIO ESTIMADO: </span>  <span id="result" class="font-weight-600 grey-800 font-size-30">S/.0.00</span>                   
                           <input type="hidden" name="txtResultado" id="resultado">                       
                       </div>  
                       <br>
                       <div class="form-group">
                           <div align="center">
                               <input type="submit" name="btnInsertar" value="Insertar" id="insertar" class="btn btn-success btn-lg" onclick="return confirm('¿Desea registrar este precio?')">
                               <input type="button" id="doAction" value="Estimar" class="btn btn-success btn-lg">
                               <a href="SERVPrecio?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                               <input type="reset" name="btnLimpiar" value="Limpiar" id="limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                           </div>                    
                       </div>  
                   </div>             

               </form>            
        </div>           
</body>
</html>