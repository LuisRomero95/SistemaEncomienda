<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("../index.jsp");
    }
    else{
        String nivel = sesion.getAttribute("nivel").toString();
        if(!nivel.equals("1") ){
            response.sendRedirect("../index.jsp");
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
          <li><a href="../SERVUsuario?action=refresh">Gestionar Usuario</a></li>        
          <li><a href="../SERVCliente?action=refresh">Gestionar Cliente</a></li>       
          <li><a href="../SERVAyudante?action=refresh">Gestionar Ayudante</a></li>       
          <li><a href="../SERVConductor?action=refresh">Gestionar Conductor</a></li>
          <li><a href="../SERVVehiculo?action=refresh">Gestionar Vehiculo</a></li>
          <li><a href="../PruebaGeo3.jsp">Pag Prueba</a></li>
          <li><a href="../DataTable.jsp">Data Table</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">Bienvenido : <%= sesion.getAttribute("nombre") %></a></li>
          <li>
            <a href="../index.jsp?cerrar=true">
              Cerrar Sesion
            </a>
          </li>
        </ul>
      </div>
    </nav>

    </body>
</html>
