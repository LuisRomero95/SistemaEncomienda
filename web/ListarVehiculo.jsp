<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <title>Lista de Vehiculo</title>          
        <jsp:include page="navbar.jsp"/>
    </head>    
    <body>  
        <div class="container">
            <h1>Lista de Vehiculos</h1>
            <hr>            
                <a class="btn btn-success btn-lg" href="SERVVehiculo?action=insert">Nuevo Registro</a>
                <a class="btn btn-primary btn-lg" href="SERVVehiculo?action=refresh">Actualizar Lista</a>                
            <br>
            <br>
            <form method="POST">
                 <table id="tableUser" class="display responsive nowrap" style="width:100%">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>                
                            <th class="text-center">PLACA</th>                                    
                            <th class="text-center">CONDUCTOR</th>      
                            <th class="text-center">AYUDANTE</th>      
                            <th class="text-center">AÑO</th>                            
                            <th class="text-center">MARCA</th>      
                            <th class="text-center">MODELO</th>
                            <th class="text-center">SERIE</th>                            
                            <th class="text-center">CAPACIDAD (Kg)</th>
                            <th class="text-center">PASAJEROS</th>
                            <th class="text-center">ACCIONES</th>
                        </tr>                        
                    </thead>
                    <tbody>
                        <c:forEach items="${vehiculo}" var="vehiculo">
                             <tr>
                                 <td>
                                     <c:out value="${vehiculo.id}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.placa}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.conductor}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.ayudante}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.año}"/>
                                 </td>                                 
                                 <td>
                                     <c:out value="${vehiculo.marca}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.modelo}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.serie}"/>
                                 </td>                                 
                                 <td>
                                     <c:out value="${vehiculo.capmax}"/>
                                 </td>
                                 <td>
                                     <c:out value="${vehiculo.pasmax}"/>
                                 </td>
                                 <td>
                                     <a href="SERVVehiculo?action=edit&id=<c:out value="${vehiculo.id}"/>" class="btn btn-warning btn-sm">Editar</a>
                                     <a href="SERVVehiculo?action=delete&id=<c:out value="${vehiculo.id}"/>" onclick="return confirm('¿Estás seguro que deseas eliminar el registro?')"  class="btn btn-danger btn-sm" id="boton" >Eliminar</a>
                                 </td>                        
                             </tr>
                         </c:forEach>                          
                    </tbody>                                  
                </table>                 
            </form>  
        </div>         
    </body>
</html>
