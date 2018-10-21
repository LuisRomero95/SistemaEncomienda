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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/validarUsuario.js" type="text/javascript"></script>
        <title>JSP Page</title>       
    </head>        
    <body>
        <div class="container">
            <div align="right">
                <br>
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>                
            <h1>Ingresar Usuarios</h1>
            <hr>
            <form name="frmInsertarUsuario" method="POST" action="SERVUsuario" autocomplete="off" >
            <div class="container">
                
                <div class="col-md-6">
                    
                    <div class="form-group"> <!-- Nombre -->
                        <label for="nom_id" class="control-label">NOMBRE</label>
                        <input type="text" class="form-control" id="nom_id" name="txtNombre" placeholder="luis">
                        <div id="ReportarNombre" class="outputTextArea"></div> 
                    </div> 

                    <div class="form-group"> <!-- Contraseña -->
                        <label for="contra_id" class="control-label">CONTRASEÑA</label>
                        <input type="text" class="form-control" id="contra_id" name="txtContra" placeholder="***" >
                    </div>         
                    
                    <div class="form-group"> <!-- Email -->
                        <label for="email_id" class="control-label">EMAIL</label>
                        <input type="text" class="form-control" id="email_id" name="txtEmail" placeholder="1510647@utp.edu.pe">
                        <div id="ReportarEmail" class="outputTextArea"></div> 
                    </div>                      
                </div>                                              
                
                <div class="col-md-6">                  
                    <div>
                        <label for="listarNivel" class="control-label">NIVEL</label>
                        <br>
                        <select name="txtNivel" id="listarNivel" class="form-control">
                            <option value="" selected="">Seleccione nivel...</option>
                            <c:forEach var="tu" items="${usuario}" >
                                <option value="${tu.id}">
                                    ${tu.nom}
                                </option>
                            </c:forEach>
                        </select>
                        <br>                        
                        <div class="form-group">
                            <label for="nivel_id" class="control-label">NIVEL SELECCIONADO</label>
                            <input type="text"  class="form-control" id="nivel_id" readonly="">
                        </div>                           
                    </div>                   
                </div>
                <br>
                <div class="col-md-12">
                    <div class="form-group"> <!-- Submit Insertar -->
                        <input type="submit" name="btnInsertar" value="Insertar" id="insertar" class="btn btn-success btn-lg" >
                        <a href="SERVUsuario?action=refresh"  class="btn btn-danger btn-lg" onclick="return confirm('¿Desea salir del registro?')">Regresar</a>
                        <input type="reset" name="btnLimpiar" value="Limpiar" class="btn btn-warning btn-lg" onclick="return confirm('¿Desea limpiar los datos a registrar?')">
                    </div>                    
                </div>
            </div>                 
            </form>          
        </div>
    </body>
</html>
