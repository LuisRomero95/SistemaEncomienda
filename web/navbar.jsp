<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <!-- Versión compilada y comprimida del CSS de Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Tema opcional -->
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <!-- Versión compilada y comprimida del JavaScript de Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        
        <!-- Referencias para el DataTable -->
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>  
        <link href="css/responsive.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.dataTables.min.js" type="text/javascript"></script>   
        <script src="js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="js/dataTable.js" type="text/javascript"></script>    
        
        <title>JSP Page</title>    
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
          <!-- El logotipo y el icono que despliega el menú se agrupan
               para mostrarlos mejor en los dispositivos móviles -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
              <span class="sr-only">Desplegar navegación</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Logotipo</a>
          </div>

          <!-- Agrupar los enlaces de navegación, los formularios y cualquier
               otro elemento que se pueda ocultar al minimizar la barra -->
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  Modulos <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="SERVAyudante?action=refresh">Gestionar Ayudante</a></li>
                    <li><a href="SERVCliente?action=refresh">Gestionar Cliente</a></li>                          
                    <li><a href="SERVConductor?action=refresh">Gestionar Conductor</a></li>                                                      
                    <li><a href="SERVEncomienda?action=refresh">Gestionar Encomienda</a></li>
                    <li><a href="SERVPrecio?action=refresh">Gestionar Precio</a></li>                    
                    <li><a href="SERVVehiculo?action=refresh">Gestionar Vehiculo</a></li>
                    <li><a href="SERVUsuario?action=refresh">Gestionar Usuario</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  Reportes <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="ReporteCliente.jsp">Reporte de Clientes</a></li>
                    <li><a href="ReporteEncomienda.jsp">Reporte de Encomiendas</a></li>             
                    <li><a href="ReporteIngreso.jsp">Reporte de Ingresos</a></li>
                    <li><a href="ReporteVehiculo.jsp">Reporte de Vehiculos</a></li>              
                </ul>
              </li>              
            </ul>


            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Bienvenido : <%= sesion.getAttribute("nombre") %></a></li>                
                <li><a href="index.jsp?cerrar=true">Cerrar Sesión</a></li>
            </ul>
          </div>
        </nav>
    </body>
</html>
