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
        <jsp:include page="navbar.jsp"/>
        <title>JSP Page</title>        
    </head>    
    <body>
        <div class="container">
                <h1>Lista de Usuarios</h1>
                <hr>
                    <a class="btn btn-success btn-lg" href="SERVUsuario?action=insert">Nuevo Registro</a>
                    <a class="btn btn-info btn-lg" href="SERVUsuario?action=refresh">Actualizar Lista</a>
                    <a class="btn btn-primary btn-lg" href="SERVTipoUsuario?action=refresh">Tipo de Usuario</a>                    
                <br>
                <br>                
            <form method="POST">
                <table class="table table-bordered" id="tableUser" class="display" >
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>                
                            <th class="text-center">NOMBRES</th>      
                            <th class="text-center">CONTRASEÑA</th>
                            <th class="text-center">EMAIL</th>
                            <th class="text-center">NIVEL</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>                        
                    </thead>
                    <tbody>
                        <c:forEach items="${usuario}" var="usuario">
                            <tr>
                                <td>
                                        <c:out value="${usuario.id}"/>
                                </td>
                                <td>
                                        <c:out value="${usuario.nom}"/>
                                </td>
                                <td>
                                        <c:out value="${usuario.password}"/>
                                </td>                    
                                <td>
                                        <c:out value="${usuario.email}"/>
                                </td>                    
                                <td>
                                        <c:out value="${usuario.nivel}"/>
                                </td>                                                     
                                <td class="text-center">
                                    <a href="SERVUsuario?action=edit&id=<c:out value="${usuario.id}"/>"  class="btn btn-warning btn-sm">Editar</a>   
                                    <a href="SERVUsuario?action=delete&id=<c:out value="${usuario.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')" class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>                         
                    </tbody>                                               
                </table>                 
            </form>
        </div>        
    </body>
</html>
