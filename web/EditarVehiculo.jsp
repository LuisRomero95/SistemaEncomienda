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
        <title>Editar Vehiculo</title>                
        <script type="text/javascript" src="http://www.carqueryapi.com/js/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.carqueryapi.com/js/carquery.0.3.4.js"></script>    
        <jsp:include page="navbar.jsp"/>
        <script src="js/ConsumirWebServiceAuto.js" type="text/javascript"></script>  
        <script src="js/validarEditarVehiculo.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <h1>Editar Vehiculo</h1>
            <hr>                 
            <form name="frmInsertarVehiculo" method="POST" action="SERVVehiculo"  autocomplete="off">
                <div class="container">
                    
                    <div class="row">
                        
                        <div class="col-md-6">
                            <div class="form-group"> <!-- Identificación-->
                                <label for="vehiculo_id" class="control-label">ID</label>
                                <input type="text" class="form-control" id="vehiculo_id" readonly  name="txtId"  value=<c:out value="${vehiculo.id}" /> >
                            </div>                              
                            
                            <div class="form-group"> 
                                <label for="placa_id" class="control-label">PLACA</label>
                                <input type="text" class="form-control" id="placa_id" name="txtPlaca" value=<c:out value="${vehiculo.placa}" /> >
                                <div id="ReportarPlaca" class="outputTextArea"></div> 
                                <input type="hidden" class="form-control" id="contenedorPlaca" value="<c:out value="${vehiculo.placa}" />"  >                                                  
                            </div>   
                                
                            <div class="form-group">
                                <label for="con_id" class="control-label">CONDUCTOR</label>
                                <br>
                                <select name="txtCon" id="con_id" class="form-control">
                                    <option value="" selected>Seleccione Conductor...</option>
                                    <c:forEach var="con" items="${conductor}" >
                                        <option value="${con.id}">
                                            ${con.nom}
                                        </option>
                                    </c:forEach>
                                </select>                                
                            </div>
                                        
                            <div class="form-group">
                                <label for="con_nom" class="control-label">CONDUCTOR SELECCIONADO</label>
                                <input type="text"  class="form-control" id="con_nom" readonly="" value=<c:out value="${vehiculo.conductor}" /> >                                                      
                            </div>                               
                                                            
                            <div class="form-group">
                                <label for="ayu_id" class="control-label">AYUDANTE</label>
                                <br>
                                <select name="txtAyu" id="ayu_id" class="form-control">
                                    <option value="" selected>Seleccione Ayudante...</option>
                                    <c:forEach var="ayu" items="${ayudante}" >
                                        <option value="${ayu.id}">
                                            ${ayu.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>   
                            
                            <div class="form-group">
                                <label for="ayu_nom" class="control-label">AYUDANTE SELECCIONADO</label>
                                <input type="text"  class="form-control" id="ayu_nom" readonly="" value=<c:out value="${vehiculo.ayudante}" /> >                                                      
                            </div>                               
                                        
                            <div class="form-group">
                                <label for="car-years" class="control-label">AÑO</label> 
                                <select name="Año" id="car-years" class="form-control"></select>
                                <br>
                                <div>                                    
                                    <label for="añoSelecionado" class="control-label">AÑO SELECCIONADO</label>       
                                    <input type="text" id="añoSelecionado" name="txtAño" readonly="" class="form-control"  value=<c:out value="${vehiculo.año}" /> >
                                </div>
                            </div>                                                                                                          
                           
                        </div>                        
                                                
                        <div class="col-md-6">
                            
                            <div class="form-group">
                                <label for="car-makes" class="control-label">MARCA</label> 
                                <select name="Marca" id="car-makes" class="form-control"></select>
                                <br>
                                <div>                                    
                                    <label for="marcaSelecionado" class="control-label">MARCA SELECCIONADA</label>       
                                    <input type="text" id="marcaSelecionado" name="txtMarca" readonly="" class="form-control"  value=<c:out value="${vehiculo.marca}" /> >                                                                    
                                </div>
                            </div>   
                                
                            <div class="form-group">
                                <label for="car-models" class="control-label">MODELO</label> 
                                <select name="Modelo" id="car-models" class="form-control"></select>
                                <br>
                                <div>                                    
                                    <label for="modeloSelecionado" class="control-label">MODELO SELECCIONADA</label>       
                                    <input type="text" id="modeloSelecionado" name="txtModelo" readonly="" class="form-control"  value=<c:out value="${vehiculo.modelo}" /> >                                                               
                                </div>
                            </div>  
                            
                            <div class="form-group">
                                <label for="car-model-trims" class="control-label">SERIE</label> 
                                <select name="Modelo" id="car-model-trims" class="form-control"></select>
                                <br>
                                <div>                                    
                                    <label for="serieSelecionada" class="control-label">SERIE SELECCIONADA</label>       
                                    <input type="text" id="serieSelecionada" name="txtSerie" readonly="" class="form-control"  value=<c:out value="${vehiculo.serie}" /> >
                                </div>
                            </div>    
                            
                            <div class="form-group"> 
                                <label for="cap_id" class="control-label">CAPACIDAD MAX</label>
                                <input type="text" class="form-control" id="cap_id" name="txtCapmax"  value=<c:out value="${vehiculo.capmax}" /> >
                            </div>  
                            
                            <div class="form-group">
                                <label for="pas_id" class="control-label">PASAJEROS MAX</label>
                                <input type="text" class="form-control" id="pas_id" name="txtPasmax" value=<c:out value="${vehiculo.pasmax}" /> >
                            </div>                              
                            
                        </div>
                        
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group"> <!-- Submit Insertar -->
                                <input type="submit" name="btnInsertar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                                <a href="SERVVehiculo?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                                <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                            </div>                             
                        </div>                          
                    </div>
                    
                </div>
            </form>
        </div>

    </body>
</html>
