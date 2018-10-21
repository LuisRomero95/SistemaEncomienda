<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script src="js/validarEditarCliente.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>  
    <body>
        <div class="container">
            <div align="right">
                <br>                
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>
            <h1>Editar Clientes</h1>
            <hr>                              
            <form  method="POST" action="SERVCliente" name="frmEditarCliente" >
                <div class="container">

                    <div class="col-md-6">
                        
                        <div class="form-group"> <!-- Identificación-->
                            <label for="cliente_id" class="control-label">ID</label>
                            <input type="text" class="form-control" id="cliente_id" readonly  name="txtId" value="<c:out value="${cliente.id}" />" >
                        </div>
                        
                        <div class="form-group"> <!-- RUC o DNI -->
                            <label for="ruc_dni_id" class="control-label">RUC / DNI</label>
                            <div>
                                <label class="radio-inline"><input type="radio" name="optradio" value="1" > RUC</label>
                                <label class="radio-inline"><input type="radio" name="optradio" value ="2" > DNI</label>                
                            </div>
                            <input type="text" class="form-control" id="ruc_dni_id" name="txtRuc_Dni" value="<c:out value="${cliente.ruc_dni}" />" >
                            <div id="ReportarRucDni" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorRucDni" value="<c:out value="${cliente.ruc_dni}" />"  >                                                  
                        </div>
                        
                        <div class="form-group"> <!-- Nombre -->
                            <label for="nom_id" class="control-label">NOMBRE</label>
                            <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${cliente.nom}" />" >
                        </div>
                        
                        <div class="form-group"> <!-- Email-->
                            <label for="email_id" class="control-label">EMAIL</label>
                            <input type="text" class="form-control" id="email_id" name="txtEmail" value="<c:out value="${cliente.email}" />">
                            <div id="ReportarEmail" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorEmail" value="<c:out value="${cliente.email}" />"  >                                                  
                        </div>                    
                    </div>

                    <div class="col-md-6">
                        
                        <div class="form-group"> <!-- Telefono Fijo-->
                            <label for="tel_fij_id" class="control-label">TELÉFONO FIJO</label>
                            <input type="text" class="form-control" id="tel_fij_id" name="txtTel_fij" value="<c:out value="${cliente.tel_fij}" />" >
                        </div>   
                        
                        <div class="form-group"> <!-- Telefono Celular-->
                            <label for="tel_cel_id" class="control-label">TELÉFONO CELULAR</label>
                            <input type="text" class="form-control" id="tel_cel_id" name="txtTel_cel"  value="<c:out value="${cliente.tel_cel}" />" >
                        </div>
                        
                        <div class="form-group"> <!-- Dirección-->
                            <label for="direc_id" class="control-label">DIRECCIÓN</label>
                            <input type="text" class="form-control" id="direc_id" name="txtDirec"  value="<c:out value="${cliente.direc}" />" >
                        </div>             
                    </div>                

                    <div class="col-md-12">
                        <div class="form-group"> <!-- Submit Insertar -->
                            <input type="submit" name="btnInsertar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                            <a href="SERVCliente?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>
                        </div>   
                    </div>
                        
                </div>               
            </form>
        </div>                
    </body>
</html>
