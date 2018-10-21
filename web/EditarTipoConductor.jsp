
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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/validarEditarTipoConductor.js" type="text/javascript"></script>
        <title>JSP Page</title>

    </head>
  
    <body>
        <div class="container">
            <div align="right">
                <br>
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>                
            <h1>Editar Tipo de Conductor</h1>
            <hr>     
            <form  method="POST" action="SERVTipoConductor" name="frmEditarTipoConductor" autocomplete="off">
            <div class="container">
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- Identificación-->
                        <label for="tipo_id" class="control-label">ID</label>
                        <input type="text" class="form-control" id="tipo_id" readonly  name="txtId"  value="<c:out value="${tp.id}" />" >
                    </div>

                    <div class="form-group"> <!-- Nombre de tipo del conductor -->
                        <label for="nom_id" class="control-label">TIPO</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" value="<c:out value="${tp.nom}" />" >
                        <div id="ReportarNombre" class="outputTextArea"></div> 
                        <input type="hidden" class="form-control" id="contenedorNombre" value="<c:out value="${tp.nom}" />"  >
                    </div>                          
                </div> 

                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnEditar" value="Actualizar" id="editar" class="btn btn-success btn-lg">
                        <a href="SERVTipoConductor?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir de la edición?')">Regresar</a>
                    </div>
                </div>                    
            </div>
            </form>
        </div>                    
    </body>
</html>
