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
        if(!nivel.equals("1")){
            response.sendRedirect("navbar.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>        
        <jsp:include page="navbar.jsp"/>      
        <script src="js/validarEditarUsuario.js" type="text/javascript"></script>
    </head>  
    <body>
        <div class="container">              
            <h1>Editar Usuario</h1>
            <hr>     
            <form  method="POST" action="SERVUsuario" name="frmEditarUsuario" autocomplete="off" >
            <div class="container">
                
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- Identificación-->
                        <label for="usuario_id" class="control-label">ID</label>
                        <input type="text" class="form-control" id="usuario_id" readonly  name="txtId"  value=<c:out value="${usuario.id}" /> >
                    </div>

                    <div class="form-group"> <!-- Nombre -->
                        <label for="nom_id" class="control-label">NOMBRE</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${usuario.nom}" />"  >
                        <div id="ReportarNombre" class="outputTextArea"></div> 
                        <input type="hidden" class="form-control" id="contenedorNombre" value="<c:out value="${usuario.nom}" />"  >                          
                    </div>

                    <div class="form-group"> <!-- Contraseña-->
                        <label for="contra_id" class="control-label">Contraseña</label>
                        <input type="text" class="form-control" id="contra_id" name="txtContra" value="<c:out value="${usuario.password}" />" >
                    </div>                    
                </div>
                    
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- Email -->
                        <label for="email_id" class="control-label">EMAIL</label>
                        <input type="text" class="form-control" id="email_id" name="txtEmail" value="<c:out value="${usuario.email}" />">                       
                        <div id="ReportarEmail" class="outputTextArea"></div> 
                        <input type="hidden" class="form-control" id="contenedorEmail" value="<c:out value="${usuario.email}" />"  >
                    </div>
                        
                    <div>
                        <label for="listarNivel" class="control-label">NIVEL</label>
                        <br>
                        <select name="txtNivel" id="listarNivel" class="form-control" >
                            <option value="" selected="">--Seleccionar--</option>
                            <c:forEach var="tu" items="${tipousuario}" >
                                <option value="${tu.id}">
                                    <c:out value="${tu.nom}" />
                                </option>
                            </c:forEach>
                        </select>
                        <br>
                        <div class="form-group">
                            <label for="nivel_id" class="control-label">NIVEL SELECCIONADO</label>
                            <input type="text"  class="form-control" id="nivel_id" readonly="" value=<c:out value="${usuario.nivel}" /> >
                        </div>                           
                    </div>                        
                </div>                
                
                <br>
                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnEditar" value="Actualizar" id="editar" class="btn btn-success btn-lg" style="margin-right: 10px">
                        <a href="SERVUsuario?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>
                    </div>                       
                </div>

            </div>            
            </form>
        </div>   
    </body>
</html>
