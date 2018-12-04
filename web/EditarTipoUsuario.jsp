
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
        <title>Editar Tipo de Usuario</title>        
        <jsp:include page="navbar.jsp"/>
        <script src="js/validarEditarTipoUsuario.js" type="text/javascript"></script>
    </head>  
    <body>
        <div class="container">           
            <h1>Editar Tipo de Usuario</h1>
            <hr>     
            <form  method="POST" action="SERVTipoUsuario" name="frmEditarTipoUsuario" autocomplete="off" >
            <div class="container">
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- Identificación-->
                        <label for="tipo_id" class="control-label">ID</label>
                        <input type="text" class="form-control" id="tipo_id" readonly  name="txtId"  value=<c:out value="${tu.id}" /> >
                    </div>

                    <div class="form-group"> <!-- Nombre de nivel del usuario -->
                        <label for="nom_id" class="control-label">TIPO</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${tu.nom}" />" >
                        <div id="ReportarNombre" class="outputTextArea"></div> 
                        <input type="hidden" class="form-control" id="contenedorNombre" value="<c:out value="${tu.nom}" />"  >
                    </div>                      
                </div> 
                        
                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnEditar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                        <a href="SERVTipoUsuario?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>                        
                    </div>                      
                </div>                    
            </div>                             
            </form>
        </div>                 
    </body>
</html>
