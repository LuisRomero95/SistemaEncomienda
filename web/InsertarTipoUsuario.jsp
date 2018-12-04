<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
    else{
        String nivel = sesion.getAttribute("nivel").toString();
        if(!nivel.equals("1")){
            response.sendRedirect("index.jsp");
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Tipo de Usuario</title>          
        <jsp:include page="navbar.jsp"/>
        <script src="js/validarTipoUsuario.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container">              
                <h1>Ingresar Tipo de Usuario</h1>
                <hr>     
            <form name="frmInsertarTipoUsuario" method="POST" action="SERVTipoUsuario" autocomplete="off" >
            <div class="container">
                <div class="col-md-6">
                    <div class="form-group"> <!-- Nombre -->
                        <label for="nom_id" class="control-label">TIPO</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" placeholder="administrador" >
                        <div id="ReportarNombre" class="outputTextArea"></div> 
                    </div>                     
                </div>
                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnInsertar" value="Insertar" id="insertar" class="btn btn-success btn-lg">
                        <a href="SERVTipoUsuario?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                        <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                    </div>                      
                </div>
            </div>
            </form>          
        </div>          
    </body>
</html>
