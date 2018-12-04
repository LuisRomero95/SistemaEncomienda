<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Insertar Tipo de Conductor</title>  
        <jsp:include page="navbar.jsp"/>
        <script src="js/validarTipoConductor.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">              
                <h1>Ingresar Tipo de Conductor</h1>
                <hr>     
                <form name="frmInsertarTipoConductor" method="POST" action="SERVTipoConductor" autocomplete="off">
            <div class="container">
                <div class="col-md-6"> 
                    
                   <div class="form-group"> <!-- Nombre -->
                       <label for="nom_id" class="control-label">TIPO</label>
                       <input type="text" class="form-control" id="nom_id" name="txtNombre" placeholder="a1">
                       <div id="ReportarNombre" class="outputTextArea"></div> 
                   </div>                    
                </div>
                
                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnInsertar" value="Insertar" id="insertar" class="btn btn-success btn-lg">
                        <a href="SERVTipoConductor?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                        <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                    </div>                    
                </div>
            </div>        
            </form>          
        </div>                
    </body>
</html>
