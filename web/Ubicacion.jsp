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
        
        <script type='text/javascript' src='https://maps.googleapis.com/maps/api/js?key=AIzaSyC4Pta07pYlzbICVniGLYta4MLCrUrXrHE&sensor=false&libraries=geometry&v=3.4'></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js" ></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <link href="css/ubicacion.css" rel="stylesheet" type="text/css"/>
        <script src="js/validarUbicacion.js" type="text/javascript"></script>        
        <title>JSP Page</title>

  </head>
    <body>
    <a href="navbar.jsp">Volver</a></li>     
    <br>
    <div id="mapa">
        <h2>Aquí ira el mapa!</h2>
    </div>
    <div id="infor">
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                  Agregar
                </a>
              </div>
              <div id="collapseOne" class="accordion-body collapse in">
                <div class="accordion-inner">
                    <form id="formulario">
                        <table>
                            <tr>
                                <td>Título</td>
                                <td><input type="text" class="form-control"  name="titulo" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Coordenada X</td>
                                <td><input type="text" class="form-control" readonly  name="cx" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Coordenada Y</td>
                                <td><input type="text" class="form-control"  readonly name="cy" autocomplete="off"/></td>
                            </tr>
                            <!-- Aqui estar� se colocaran los mensajes para el usuario -->
                            <tr>
                                <td></td>
                                <td><span id="loader_grabar" class=""></span></td>
                            </tr>
                            <tr>
                                <td><button type="button" id="btn_grabar" class="btn btn-success btn-sm">Grabar</button></td>
                                <td><button type="button" class="btn btn-danger btn-sm">Cancelar</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                  Eliminar
                </a>
              </div>
              <div id="collapseTwo" class="accordion-body collapse">
                <div class="accordion-inner">
                  <form id="formulario_eliminar">
                      <input type="hidden" class="form-control"  name="id"/>
                        <table>
                            <tr>
                                <td>Título</td>
                                <td><input type="text" class="form-control"  name="titulo" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Coordenada X</td>
                                <td><input type="text" class="form-control" readonly  name="cx" autocomplete="off"/></td>
                            </tr>
                            <tr>
                                <td>Coordenada Y</td>
                                <td><input type="text" class="form-control"  readonly name="cy" autocomplete="off"/></td>
                            </tr>
                            <!-- Aqui estar� se colocaran los mensajes para el usuario -->
                            <tr>
                                <td></td>
                                <td><span id="loader_grabar" class=""></span></td>
                            </tr>
                            <tr>
                                <td><button type="button" id="btn_actualizar" class="btn btn-success btn-sm">Actualizar</button></td>
                                <td><button type="button" id="btn_borrar" class="btn btn-danger btn-sm">Borrar</button></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><label>
                                    <input id="opc_edicion" type="checkbox"> Habilitar Edición
                                  </label>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
              </div>
            </div>
            <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
                  Buscar
                </a>
              </div>
              <div id="collapseThree" class="accordion-body collapse">
                <div class="accordion-inner">
                  <form id="formulario_buscar">
                    <table>
                      <TR>
                        <td>
                          <input type="text" id="palabra_buscar"  class="form-control" autocomplete="off" />
                        </td>
                        <td>
                          <button type="button" id="btn_buscar"  class="btn btn-success btn-sm" >Buscar</button>
                        </td>
                      </TR>

                      <TR>
                        <td>
                          <select id="select_resultados">
                            <option value="uno">uno</option>
                          </select>
                        </td>
                        <td></td>
                      </TR>

                    </table>
                  </form>
                </div>
              </div>
            </div>
          </div>

    </div>           
    </body>
</html>
