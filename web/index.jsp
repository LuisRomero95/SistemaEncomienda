<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">        
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/validarLogin.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
	<div class="container">
            <div class="row main">
                <div class="panel-heading col-md-12">
                    <div class="panel-title text-center">
                         <h1 class="title">Sistema Mudanza</h1>
                         <hr/>
                    </div>
                </div> 
                <div class="main-login main-center col-md-6 col-md-offset-3" align="">
                    <form class="form-horizontal" method="POST" action="SERVLogin" autocomplete="off">
                        <div class="form-group">
                            <label for="username" class="cols-sm-2 control-label">Nombre de Usuario</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="txtUsuario" id="username"  placeholder="Ingrese su nombre de usuario"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="cols-sm-2 control-label">Contraseña</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="txtContra" id="password"  placeholder="Ingrese su contraseña"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group ">
                            <input type="submit" name="btnIniciar" value="Iniciar Sesion" class="btn btn-primary btn-lg btn-block login-button">
                        </div>
                    </form>
                </div>
            </div>
	</div>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
    <%
        HttpSession sesion = request.getSession();
        int nivel = 0;
        if(request.getAttribute("nivel")!=null){
            nivel = (Integer)request.getAttribute("nivel");
            if(!(nivel == 0)){
                sesion.setAttribute("nombre", request.getAttribute("nombre"));
                sesion.setAttribute("nivel", nivel);
                response.sendRedirect("navbar.jsp");
            }
        }
        if(request.getParameter("cerrar")!=null){
            session.invalidate();
        }
    %>      
    </body>
</html>
