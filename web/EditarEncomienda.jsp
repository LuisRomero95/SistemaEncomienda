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
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/jquery.numeric.js" type="text/javascript"></script>
        <script src="js/validarEditarEncomienda.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">
            <div align="right">
                <br>                
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>
            <h1>Editar Encomienda</h1>
            <hr>                 
            <form name="frmEditarEncomienda" method="POST" action="SERVEncomienda"  autocomplete="off">
                <div class="container">
                    
                    <div class="row">
                        
                        <div class="col-md-6">       
                            
                            <div class="form-group"> <!-- Identificación-->
                                <label for="encomienda_id" class="control-label">ID</label>
                                <input type="text" class="form-control" id="encomienda_id" readonly  name="txtId"  value=<c:out value="${encomienda.id}" /> >
                            </div>                                
                            
                            <div class="form-group">
                                <label for="listarEmisor" class="control-label">EMISOR</label>
                                <br>
                                <select name="txtEmisor" id="listarEmisor" class="form-control">
                                    <option value="" selected>Seleccione un cliente...</option>
                                    <c:forEach var="cliente" items="${cliente}" >
                                        <option value="${cliente.id}">
                                            ${cliente.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-group">
                                    <label for="contenedor_receptor_id" class="control-label">EMISOR SELECCIONADO</label>
                                    <input type="text"  class="form-control" name="txtContenedoreEmisor" id="contenedor_emisor_id"  readonly=""  value="<c:out value="${encomienda.emisor}" />"  >
                                </div>                                  
                            </div>
                            
                            <div class="form-group">
                                <label for="listarReceptor" class="control-label">RECEPTOR</label>
                                <br>
                                <select name="cli_id" id="listarReceptor" class="form-control">
                                    <option value="" selected>Seleccione un cliente...</option>
                                    <c:forEach var="cliente" items="${cliente}" >
                                        <option value="${cliente.id}">
                                            ${cliente.nom}
                                        </option>
                                    </c:forEach>
                                </select>  
                                <br>
                                <div class="form-group">
                                    <label for="contenedor_receptor_id" class="control-label">RECEPTOR SELECCIONADO</label>
                                    <input type="text"  class="form-control" name="txtReceptor" id="contenedor_receptor_id"  readonly="" value="<c:out value="${encomienda.receptor}" />"  >
                                </div>                                 
                            </div>                            
                                        
                            <div class="form-group">
                                <label for="listarUsuario" class="control-label">Usuario</label>
                                <br>
                                <select name="txtUsuario" id="listarUsuario" class="form-control">
                                    <option value="" selected="selected">Seleccione un usuario...</option>
                                    <c:forEach var="usuario" items="${usuario}" >
                                        <option value="${usuario.id}">
                                            ${usuario.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>  
                            <div class="form-group">
                                <label for="contenedor_receptor_id" class="control-label">USUARIO SELECCIONADO</label>
                                <input type="text"  class="form-control" name="txtReceptor" id="contenedor_usuario_id"  readonly="" value="<c:out value="${encomienda.usuario}" />"  >
                            </div>                                   
                           
                        </div>                        
                                                
                        <div class="col-md-6">
                                                                    
                            <div class="form-group">
                                <label for="listarVehiculo" class="control-label">VEHICULO</label>
                                <br>
                                <select name="txtVehiculo" id="listarVehiculo" class="form-control">
                                    <option value="" selected="selected">Seleccione un vehiculo...</option>
                                    <c:forEach var="vehiculo" items="${vehiculo}" >
                                        <option value="${vehiculo.id}">
                                            ${vehiculo.placa}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                                <div class="form-group">
                                    <label for="contenedor_receptor_id" class="control-label">VEHICULO SELECCIONADO</label>
                                    <input type="text"  class="form-control" name="txtContenedorVehiculo" id="contenedor_vehiculo_id"  readonly="" value="<c:out value="${encomienda.vehiculo}" />"  >
                                </div>                                   
                            </div>  

                            <div class="form-group">
                                <label for="precio_id" class="control-label radio-inline"><input type="radio" id="calcular_precio" name="txtCalcularPrecio" >Precio</label>                               
                                <br>
                                <input type="text" class="form-control" id="precio_id" name="txtPrecio" value="<c:out value="${encomienda.precio}" />"  >
                              
                            </div>
                                                        
                            
                            <div class="form-group">
                                <label for="des_id" class="control-label">Descripcion</label>
                                <input type="text" class="form-control" id="des_id" name="txtDescripcion"  value="<c:out value="${encomienda.descripcion}" />"  >
                            </div>                                                       
                            
                        </div>                       
                    </div>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group"> <!-- Submit Insertar -->
                                <input type="submit" name="btnEditar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                                <a href="SERVEncomienda?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                                <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                            </div>                             
                        </div>                          
                    </div>
                    
                </div>
            </form>
        </div>

    </body>
</html>
