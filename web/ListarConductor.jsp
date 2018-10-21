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
                <h1>Lista de Conductores</h1>
                <hr>
                    <a class="btn btn-success btn-lg" href="SERVConductor?action=insert">Nuevo Registro</a>
                    <a class="btn btn-info btn-lg" href="SERVConductor?action=refresh">Actualizar Lista</a>
                    <a class="btn btn-primary btn-lg" href="SERVTipoConductor?action=refresh">Tipo de Conductores</a>                    
                <br>
                <br>
            <form method="POST">
                <table class="table table-bordered" id="tableUser" class="display" >
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">NOMBRES</th>
                            <th class="text-center">APELLIDOS</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">LICENCIA</th>                            
                            <th class="text-center">EMAIL</th>                    
                            <th class="text-center">TELÉFONO</th>
                            <th class="text-center">DIRECCIÓN</th>
                            <th class="text-center">ID TIPO</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>                       
                    </thead>
                    <tbody>
                        <c:forEach items="${conductor}" var="conductor">
                            <tr>
                                <td>
                                    <c:out value="${conductor.id}"/>
                                </td>                                
                                <td>
                                    <c:out value="${conductor.nom}"/>
                                </td>
                                <td>
                                    <c:out value="${conductor.ape}"/>
                                </td>
                                <td>
                                    <c:out value="${conductor.dni}"/>
                                </td>
                                <td>
                                    <c:out value="${conductor.lic}"/>
                                </td>                                
                                <td>
                                    <c:out value="${conductor.email}"/>
                                </td>                        
                                <td>
                                    <c:out value="${conductor.tel}"/>
                                </td>
                                <td>
                                    <c:out value="${conductor.direc}"/>
                                </td>
                                <td>
                                    <c:out value="${conductor.tipo}"/>
                                </td>
                                <td class="text-center">
                                    <a href="SERVConductor?action=edit&id=<c:out value="${conductor.id}"/>" class="btn btn-warning btn-sm">Editar</a>
                                    <a href="SERVConductor?action=delete&id=<c:out value="${conductor.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')"  class="btn btn-danger btn-sm">Eliminar</a>
                                </td>                        
                            </tr>
                        </c:forEach>                  
                    </tbody>                                 
                </table>                 
            </form>
        </div>
    </body>
</html>
