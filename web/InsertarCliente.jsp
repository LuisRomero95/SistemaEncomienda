<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Insertar Cliente</title>                
        <script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
        <jsp:include page="navbar.jsp"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>        
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />        
        <script src="js/validarCliente.js" type="text/javascript"></script>     
    </head>
    <body>       
        <div class="container" >
            <h1>Insertar Clientes</h1>
            <hr>            
            <form name="frmInsertarCliente" method="POST" action="SERVCliente" autocomplete="off">
            <div class="container">
                    
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- RUC o DNI -->
                        <div>
                            <label class="radio-inline"><input type="radio" name="optradio" value="1" > RUC</label>
                            <label class="radio-inline"><input type="radio" name="optradio" value="2" > DNI</label>                
                        </div>
                        <input type="text" class="form-control" id="ruc_dni_id" name="txtRuc_Dni" placeholder="73095001" >
                        <div id="ReportarRucDni" class="outputTextArea"></div> 
                    </div> 
                    
                    <div class="form-group"> <!-- Nombre -->
                        <label for="nom_id" class="control-label">NOMBRE</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" placeholder="Luis Alonso Romero Costilla" >
                    </div>
                    
                    <div class="form-group"> <!-- Email-->
                        <label for="email_id" class="control-label">EMAIL</label>
                        <input type="text" class="form-control" id="email_id" name="txtEmail" placeholder="larcroco@gmail.com" >
                        <div id="ReportarEmail" class="outputTextArea"></div> 
                    </div>
                    
                    <div class="form-group"> <!-- Telefono Fijo-->
                        <label for="tel_fij_id" class="control-label">TELÉFONO FIJO</label>
                        <input type="text" class="form-control" id="tel_fij_id" name="txtTel_fij" placeholder="3257618" >
                    </div>                       
                    
                </div>    
                    
                <div class="col-md-6">                          
                    
                    <div class="form-group"> <!-- Telefono Celular-->
                        <label for="tel_cel_id" class="control-label">TELÉFONO CELULAR</label>
                        <input type="text" class="form-control" id="tel_cel_id" name="txtTel_cel" placeholder="979527707">
                    </div>
                    
                    <div class="form-group"> <!-- Dirección-->
                        <label for="direc_id" class="control-label">DIRECCIÓN</label>
                        <input type="text" class="form-control" id="direc_id" name="txtDirec" placeholder="jr fin del mundo 321">
                    </div> 
                    
                    <div class="form-group"> <!-- Distrito-->
                        <label for="dist_id" class="control-label" >DISTRITO</label>
                        <input type="text" class="form-control" id="dist_id" name="txtDistrito" style="text-transform:lowercase;" placeholder="san juan de miraflores">
                    </div>                       
                </div>              

                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnInsertar" value="Insertar" id="insertar" class="btn btn-success btn-lg">
                        <a href="SERVCliente?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>                         
                        <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                    </div>   
                </div>       
                
            </div>
            </form>
        </div>
    </body>
</html>
