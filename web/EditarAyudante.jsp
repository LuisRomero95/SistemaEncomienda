
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
        <script src="js/validarEditarAyudante.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    </head>  
    <body>
        <div class="container">
            <div align="right">
                <br>
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>                
            <h1>Editar Ayudante</h1>
            <hr>     
            <form  method="POST" action="SERVAyudante" name="frmEditarAyudante" autocomplete="off" >
               <div class="container">
                   
                    <div class="col-md-6">
                        
                        <div class="form-group"> <!-- Identificación-->
                            <label for="ayudante_id" class="control-label">ID</label>
                            <input type="text" class="form-control" id="ayudante_id" readonly  name="txtId"   value="<c:out value="${ayudante.id}" />" >
                        </div>

                        <div class="form-group"> <!-- Dni -->
                            <label for="dni_id" class="control-label">DNI</label>
                            <input type="text" class="form-control" id="dni_id" name="txtDni" value="<c:out value="${ayudante.dni}" />"   >
                            <div id="ReportarDni" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorDni" value="<c:out value="${ayudante.dni}" />"  >                                                                              
                        </div>                

                        <div class="form-group"> <!-- Nombres -->
                            <label for="nom_id" class="control-label">NOMBRE</label>
                            <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${ayudante.nom}" />" >
                        </div>

                        <div class="form-group"> <!-- Apellidos -->
                            <label for="ape_id" class="control-label">APELLIDOS</label>
                            <input type="text" class="form-control" id="ape_id" name="txtApe" value="<c:out value="${ayudante.ape}" />"  >
                        </div>  
                        
                    </div> 
                        
                    <div class="col-md-6">
                        
                        <div class="form-group"> <!-- Correo Electrónico-->
                            <label for="email_id" class="control-label">Email</label>
                            <input type="text" class="form-control" id="email_id" name="txtEmail" value="<c:out value="${ayudante.email}" />" >
                            <div id="ReportarEmail" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorEmail" value="<c:out value="${ayudante.email}" />"  >                                                    
                        </div> 
                        
                        <div class="form-group"> <!-- Teléfono corporativo-->
                            <label for="tel_id" class="control-label">TELÉFONO CELULAR</label>
                            <input type="text" class="form-control" id="tel_id" name="txtTel" value="<c:out value="${ayudante.email}" />" >
                        </div>   
                        
                       <div class="form-group"> <!-- Dirección-->
                            <label for="direc_id" class="control-label">DIRECCIÓN</label>
                            <input type="text" class="form-control" id="direc_id" name="txtDirec" value="<c:out value="${ayudante.direc}" />" >
                        </div>   
                        
                        <div class="form-group"> <!-- Distrito-->
                            <label for="dist_id" class="control-label" >DISTRITO</label>
                            <input type="text" class="form-control" id="dist_id" name="txtDistrito" style="text-transform:lowercase;" value="<c:out value="${ayudante.distr}" />" >
                        </div>   
                        
                    </div>                            
                        
                    <div class="col-md-12">
                        
                        <div class="form-group"> <!-- Submit Insertar -->
                            <input type="submit" name="btnInsertar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                            <a href="SERVAyudante?action=refresh" class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>
                        </div>   
                        
                    </div>
                        
                </div>        
            </form>
        </div>             
    </body>
</html>
