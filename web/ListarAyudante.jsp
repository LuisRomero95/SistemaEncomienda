<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="navbar.jsp"/>        
        <title>JSP Page</title>
    </head>
        <body> 
        <div class="container">
                <h1>Lista de Ayudantes</h1>
                <hr>
                    <a class="btn btn-success btn-lg" href="SERVAyudante?action=insert">Nuevo Registro</a>
                    <a class="btn btn-primary btn-lg" href="SERVAyudante?action=refresh">Actualizar Lista</a>
                <br>
                <br>
            <form method="POST">
                <table class="table table-bordered" id="tableUser" class="display">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>                            
                            <th class="text-center">NOMBRES</th>
                            <th class="text-center">APELLIDOS</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">EMAIL</th>
                            <th class="text-center">TELÉFONO</th>
                            <th class="text-center">DIRECCIÓN</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>                        
                    </thead>
                    <tbody>
                        <c:forEach items="${ayudante}" var="ayudante" >
                            <tr>
                                <td>
                                        <c:out value="${ayudante.id}"/>
                                </td>
                                <td>
                                        <c:out value="${ayudante.nom}"/>
                                </td>                                                     
                                <td>
                                        <c:out value="${ayudante.ape}"/>
                                </td>   
                                <td>
                                        <c:out value="${ayudante.dni}"/>
                                </td>                                
                                <td>
                                        <c:out value="${ayudante.email}"/>
                                </td>                                     
                                <td>
                                        <c:out value="${ayudante.tel}"/>
                                </td>                                                         
                                <td>
                                        <c:out value="${ayudante.direc}"/>
                                </td>                                                               
                                <td class="text-center">
                                    <a href="SERVAyudante?action=edit&id=<c:out value="${ayudante.id}"/>"   class="btn btn-warning btn-sm">Editar</a>   
                                    <a href="SERVAyudante?action=delete&id=<c:out value="${ayudante.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')"  class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>                          
                    </tbody>
                </table>                 
            </form>
        </div>        
    </body>
</html>
