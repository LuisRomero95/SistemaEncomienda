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
        <title>Insertar Encomienda</title>            
        <!--DATAPICKER -->        
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">        
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <!--BARRA DE NAVEGACIÓN -->
        <jsp:include page="navbar.jsp"/> 
        <!--DATAPICKER -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>                           
        <!--VALIDACIÓN -->     
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
                                <label for="des_id" class="control-label">DESCRIPCIÓN</label>
                                <input type="text" class="form-control" id="des_id" name="txtDescripcion" value="<c:out value="${encomienda.descripcion}" />"  >
                            </div> 
                            
                            <div class="form-group">
                                <label for="from" class="control-label">FECHA DE ENVIO</label>
                                <input type="text" class="form-control" id="from" name="txtFechaEnvio" value="<c:out value="${encomienda.fecha}" />"  >
                            </div>        
                                
                            <div class="form-group">
                                <label for="listarEncomienda" class="control-label">ESTADO</label>
                                <br>
                                <select name="txtTipo" id="listarEncomienda" class="form-control">
                                    <option value="" selected="selected">Seleccione un estado...</option>
                                    <c:forEach var="tipoencomienda" items="${tipoencomienda}" >
                                        <option value="${tipoencomienda.id}">
                                            ${tipoencomienda.nom}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="contenedor_estado_id" class="control-label">ESTADO SELECCIONADO</label>
                                <input type="text"  class="form-control" name="txtContenedorEstado" id="contenedor_estado_id"  readonly="" value="<c:out value="${encomienda.tipo}" />"  >
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
