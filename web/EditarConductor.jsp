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
        <script src="js/validarEditarConductor.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div align="right">
                <br>
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>                
            <h1>Editar Conductor</h1>
            <hr>     
            <form  method="POST" action="SERVConductor" name="frmEditarConductor"  autocomplete="off">
                <div class="container">
                    
                    <div class="col-md-6">

                        <div class="form-group"> <!-- Identificación-->
                            <label for="ayudante_id" class="control-label">ID</label>
                            <input type="text" class="form-control" id="ayudante_id" readonly  name="txtId"  value="<c:out value="${conductor.id}" />" >
                        </div>

                        <div class="form-group"> <!-- Nombres -->
                            <label for="nom_id" class="control-label">NOMBRE</label>
                            <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${conductor.nom}" />" >
                        </div>
                        <div class="form-group"> <!-- Apellidos -->
                            <label for="ape_id" class="control-label">APELLIDOS</label>
                            <input type="text" class="form-control" id="ape_id" name="txtApe" value="<c:out value="${conductor.ape}" />" >
                        </div>                      

                        <div class="form-group"> <!-- Dni -->
                            <label for="dni_id" class="control-label">DNI</label>
                            <input type="text" class="form-control" id="dni_id" name="txtDni" value="<c:out value="${conductor.dni}" />" >
                            <div id="ReportarDni" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorDni" value="<c:out value="${conductor.dni}" />"  >                                                  
                        </div>   

                        <div class="form-group"> <!-- Licencia -->
                            <label for="lic_id" class="control-label">LICENCIA</label>
                            <input type="text" class="form-control" id="lic_id" name="txtLic" value="<c:out value="${conductor.lic}" />" >
                            <div id="ReportarLicencia" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorLicencia" value="<c:out value="${conductor.lic}" />"  >                                                                          
                        </div> 

                    </div>  

                    <div class="col-md-6">
                        <div class="form-group"> <!-- Correo Electrónico-->
                            <label for="email_id" class="control-label">Email</label>
                            <input type="text" class="form-control" id="email_id" name="txtEmail" value="<c:out value="${conductor.email}" />" >
                            <div id="ReportarEmail" class="outputTextArea"></div> 
                            <input type="hidden" class="form-control" id="contenedorEmail" value="<c:out value="${conductor.email}" />"  >                        
                        </div> 

                        <div class="form-group"> <!-- Teléfono corporativo-->
                            <label for="tel_id" class="control-label">TELÉFONO</label>
                            <input type="text" class="form-control" id="tel_id" name="txtTel" value="<c:out value="${conductor.tel}" />" >
                        </div>    

                        <div class="form-group"> <!-- Dirección-->
                            <label for="direc_id" class="control-label">DIRECCIÓN</label>
                            <input type="text" class="form-control" id="direc_id" name="txtDirec" value="<c:out value="${conductor.direc}" />" >
                        </div>   

                        <div>
                            <label for="listarNivel" class="control-label">TIPO</label>
                            <br>
                            <select name="txtTipo" id="listarNivel" class="form-control">
                                <option value="" selected="">Seleccione nivel...</option>
                                <c:forEach var="tc" items="${tipoconductor}" >
                                    <option value="${tc.id}">
                                        ${tc.nom}
                                    </option>
                                </c:forEach>
                            </select>                                                
                            <br>
                            <div class="form-group">
                                <label for="nivel_id" class="control-label">TIPO SELECCIONADO</label>
                                <input type="text"  class="form-control" id="nivel_id"  readonly="" value="<c:out value="${conductor.tipo}" />" >
                            </div>                           
                        </div>                     
                    </div>                  

                    <div class="col-md-12">
                        <div class="form-group"> <!-- Submit Insertar -->
                            <input type="submit" name="btnInsertar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                            <a href="SERVConductor?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>
                        </div>                      
                    </div>
                            
                </div>        
            </form>
        </div>
    </body>
</html>
