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
                <h1>Lista de Clientes</h1>
                <hr>
                    <a class="btn btn-success btn-lg" href="SERVCliente?action=insert">Nuevo Registro</a>
                    <a class="btn btn-primary btn-lg" href="SERVCliente?action=refresh">Actualizar Lista</a>
                <br>
                <br>
            <form method="POST">
                <table id="tableUser" class="display responsive nowrap" style="width:100%">
                    <thead>
                        <tr>
                           <th class="text-center">ID</th>                
                           <th class="text-center">NOMBRES</th>                                    
                           <th class="text-center">RUC_DNI</th>      
                           <th class="text-center">EMAIL</th>      
                           <th class="text-center">FIJO</th>      
                           <th class="text-center">CELULAR</th>      
                           <th class="text-center">DIRECCIÓN</th>
                           <th class="text-center">DISTRITO</th>
                           <th class="text-center">ACCIONES</th>
                       </tr>                       
                    </thead>
                    <tbody>
                        <c:forEach items="${cliente}" var="item">
                            <tr>
                                <td>
                                        <c:out value="${item.id}"/>
                                </td>
                                <td>
                                        <c:out value="${item.nom}"/>
                                </td>
                                <td>
                                        <c:out value="${item.ruc_dni}"/>
                                </td>                                                     
                                <td>
                                        <c:out value="${item.email}"/>
                                </td>                    
                                <td>
                                        <c:out value="${item.tel_fij}"/>
                                </td>                    
                                <td>
                                        <c:out value="${item.tel_cel}"/>
                                </td>                                        
                                <td>
                                        <c:out value="${item.direc}"/>
                                </td>                                                            
                                <td>
                                        <c:out value="${item.distr}"/>
                                </td>                                                                                            
                                <td class="text-center">
                                    <a href="SERVCliente?action=edit&id=<c:out value="${item.id}"/>"  class="btn btn-warning btn-sm" >Editar</a>   
                                    <a href="SERVCliente?action=delete&id=<c:out value="${item.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')"  class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>                         
                    </tbody>                                             
                </table>                 
            </form> 
        </div>        
    </body>
</html>
