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
                <h1>Lista de Tipos de Precios</h1>
                <hr>
                <a class="btn btn-success btn-lg" href="SERVTipoPrecio?action=insert">Nuevo Registro</a>
                <a class="btn btn-info btn-lg" href="SERVTipoPrecio?action=refresh">Actualizar Lista</a>
                <a class="btn btn-primary btn-lg" href="SERVTipoPrecio?action=refresh">Regresar a Lista de Precio</a>
                <br>
                <br>
            <form method="POST">
                <table class="table table-bordered" id="tableUser" class="display">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>                
                            <th class="text-center">TIPO</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tp}" var="tp">
                            <tr>
                                <td>
                                    <c:out value="${tp.id}"/>
                                </td>
                                <td>
                                    <c:out value="${tp.nom}"/>
                                </td>                        
                                <td class="text-center">
                                    <a href="SERVTipoPrecio?action=edit&id=<c:out value="${tp.id}" />" class="btn btn-warning btn-sm">Editar</a>                         
                                    <a href="SERVTipoPrecio?action=delete&id=<c:out value="${tp.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')"  class="btn btn-danger btn-sm">Eliminar</a>                            
                                </td>
                            </tr>
                        </c:forEach>                      
                    </tbody>                                             
                </table>                 
            </form> 
        </div>        
    </body>
</html>
