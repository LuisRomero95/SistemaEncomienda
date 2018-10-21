
package controlador;

import dao.TipoUsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.TipoUsuario;

public class SERVTipoUsuario extends HttpServlet {

    private static String insert= "/InsertarTipoUsuario.jsp";
    private static String edit = "/EditarTipoUsuario.jsp";
    private static String list_tipo_usuario = "/ListarTipoUsuario.jsp";
    private TipoUsuarioDAO tudao;
    TipoUsuario tu = new TipoUsuario();
            
    public SERVTipoUsuario() {
       tudao = new TipoUsuarioDAO(){};
    }              

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward = "";   
        String action = request.getParameter("action");

        //ELIMINAR TIPO DE USUARIO
        if (action.equalsIgnoreCase("delete")) {                 
            try {
                tu.setId(Integer.parseInt(request.getParameter("id")));
                tudao.eliminar(tu);
                forward = list_tipo_usuario;
                request.setAttribute("tu", tudao.consultar());                          
            } catch (Exception ex) {
            }               
        }
        //EDITAR TIPO DE USUARIO
        else if (action.equalsIgnoreCase("edit")) {
            try {
                forward = edit;
                int id = Integer.parseInt(request.getParameter("id"));
                TipoUsuario tu = tudao.BuscarPorId(id);             
                request.setAttribute("tu", tu);       
            } catch (Exception ex) {
            }
        }            
        //INSERTAR TIPO USUARIO    
        else if(action.equalsIgnoreCase("insert")) {
        forward = insert;            
        }            
        //LISTAR O ACTUALIZAR LISTA
        else if(action.equalsIgnoreCase("refresh")){
            try {
            forward = list_tipo_usuario;
            request.setAttribute("tu", tudao.consultar());                  
            } catch (Exception e) {
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        if(request.getParameter("nnombre")!=null){
            String nnombre = request.getParameter("nnombre");
            String report = VerificarNombre(nnombre);

            response.setContentType("text/plain");
            out.println("" + report + "");
                            
            out.flush();
            out.close();

        } 
        
        String nombre = request.getParameter("txtNombre");                                                            
        String id =request.getParameter("txtId");

        try {                              
                TipoUsuario u = new TipoUsuario();    
                u.setNom(nombre);
  
                
                if (id == null || id.isEmpty()) {
                     if(tudao.ConsultarNombre(nombre)){    

                    }else {
                         try {
                             tudao.insertar(u);
                         } catch (Exception ex) {
                             Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);
                         }
                     }
                } else {                    
                    try {
                        u.setId(Integer.parseInt(id));
                        tudao.modificar(u);
                    } catch (Exception ex) {
                        Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);                        
                    }
                }             
                   
        }catch (SQLException ex) {
            Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);             
        }        
                
        response.sendRedirect(request.getContextPath() + "/SERVTipoUsuario?action=refresh");           
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    private String VerificarNombre(String nnombre) {
        try {
            String report = null;
            if(nnombre.equals("")){
                report = "";
            }
            else if(tudao.ConsultarNombre(nnombre)){
                report = "Ya existe";
            }
            else {
                report = "Libre";
            }            
            
            return report;
        } catch (SQLException ex) {
            Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
       
}