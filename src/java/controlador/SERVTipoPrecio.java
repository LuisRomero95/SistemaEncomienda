
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.TipoPrecio;
import dao.TipoPrecioDAO;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

public class SERVTipoPrecio extends HttpServlet {

private static String insert= "/InsertarTipoPrecio.jsp";
    private static String edit = "/EditarTipoPrecio.jsp";
    private static String list_tipo_precio = "/ListarTipoPrecio.jsp";
    private TipoPrecioDAO tpdao;
    TipoPrecio tp = new TipoPrecio();
            
    public SERVTipoPrecio() {
       tpdao = new TipoPrecioDAO(){};
    }                  
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward = "";   
        String action = request.getParameter("action");

        //ELIMINAR TIPO DE USUARIO
        if (action.equalsIgnoreCase("delete")) {                 
            try {
                tp.setId(Integer.parseInt(request.getParameter("id")));
                tpdao.eliminar(tp);
                forward = list_tipo_precio;
                request.setAttribute("tp", tpdao.consultar());                          
            } catch (Exception ex) {
            }               
        }
        //EDITAR TIPO DE USUARIO
        else if (action.equalsIgnoreCase("edit")) {
            try {
                forward = edit;
                int id = Integer.parseInt(request.getParameter("id"));
                TipoPrecio tp = tpdao.BuscarPorId(id);             
                request.setAttribute("tp", tp);       
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
            forward = list_tipo_precio;
            request.setAttribute("tp", tpdao.consultar());                  
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
                TipoPrecio u = new TipoPrecio();    
                u.setNom(nombre);
  
                
                if (id == null || id.isEmpty()) {
                     if(tpdao.ConsultarNombre(nombre)){    

                    }else {
                         try {
                             tpdao.insertar(u);
                         } catch (Exception ex) {
                             Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);
                         }
                     }
                } else {                    
                    try {
                        u.setId(Integer.parseInt(id));
                        tpdao.modificar(u);
                    } catch (Exception ex) {
                        Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);                        
                    }
                }             
                   
        }catch (SQLException ex) {
            Logger.getLogger(SERVTipoUsuario.class.getName()).log(Level.SEVERE, null, ex);             
        }        
                
        response.sendRedirect(request.getContextPath() + "/SERVTipoPrecio?action=refresh");           
        
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
            else if(tpdao.ConsultarNombre(nnombre)){
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
