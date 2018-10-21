
package controlador;

import dao.AyudanteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.Ayudante;

public class SERVAyudante extends HttpServlet {

    private static String insert= "/InsertarAyudante.jsp";
    private static String edit = "/EditarAyudante.jsp";
    private static String list_ayudante = "/ListarAyudante.jsp";
    private final AyudanteDAO ayudantedao;
    Ayudante ayudante = new Ayudante();
    
    public SERVAyudante() {
        ayudantedao = new AyudanteDAO();
    }    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            String forward = "";   
            String action = request.getParameter("action");
            
            //ELIMINAR AYUDANTE
            if (action.equalsIgnoreCase("delete")) {                 
                try {
                    ayudante.setId(Integer.parseInt(request.getParameter("id")));
                    ayudantedao.eliminar(ayudante);
                    forward = list_ayudante; 
                    request.setAttribute("ayudante", ayudantedao.consultar());
                } catch (Exception ex) {
                }                 
            }
            //EDITAR AYUDANTE
            else if (action.equalsIgnoreCase("edit")) {
                try {
                    forward = edit;
                    int id = Integer.parseInt(request.getParameter("id"));
                    Ayudante ayudante = ayudantedao.BuscarPorId(id);             
                    request.setAttribute("ayudante", ayudante);
                } catch (Exception ex) {
                }
            }            
            //INSERTAR AYUDANTE    
            else if(action.equalsIgnoreCase("insert")) {
            forward = insert;            
            }
            //ACTUALIZAR AYUDANTE
            else if(action.equalsIgnoreCase("refresh")){
                try {
                    forward = list_ayudante; 
                    request.setAttribute("ayudante", ayudantedao.consultar());
                } catch (Exception ex) {
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
        
        if(request.getParameter("ddni")!=null){
            String ddni = request.getParameter("ddni");
            String report = VerificarDni(ddni);

            response.setContentType("text/plain");
            out.println("" + report + "");
                            
            out.flush();
            out.close();
        }         
        if(request.getParameter("eemail")!=null){
            String eemail = request.getParameter("eemail");
            String report = VerificarEmail(eemail);

            response.setContentType("text/plain");
            out.println("" + report + "");
            out.flush();
            out.close();
        }           
        
        String dni = request.getParameter("txtDni");
        String nombre = request.getParameter("txtNombre");
        String ape = request.getParameter("txtApe");
        String direc = request.getParameter("txtDirec");
        String tel = request.getParameter("txtTel");
        String email = request.getParameter("txtEmail");
        String id =request.getParameter("txtId");                                                                 
                            
        Ayudante ayudante = new Ayudante();
        ayudante.setDni(dni);
        ayudante.setNom(nombre);
        ayudante.setApe(ape);
        ayudante.setDirec(direc);             
        ayudante.setTel(tel);
        ayudante.setEmail(email);   

        if (id == null || id.isEmpty()) {
            try {
                ayudantedao.insertar(ayudante);
            } catch (Exception ex) {
                Logger.getLogger(SERVAyudante.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else {                    
            try {
                ayudante.setId(Integer.parseInt(id));
                ayudantedao.modificar(ayudante);
            } catch (Exception ex) {
                Logger.getLogger(SERVAyudante.class.getName()).log(Level.SEVERE, null, ex);                        
            }
        }             
                                             
        response.sendRedirect(request.getContextPath() + "/SERVAyudante?action=refresh");         
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String VerificarDni(String ddni) {
        try {
            String report = null;
            if(ddni.equals("")){
                report = "";
            }
            else if(ayudantedao.ConsultarDNI(ddni)){
                report = "Ya existe";
            }
            else {
                report = "Libre";
            }            

            return report;
        }catch (SQLException ex) {
            Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
            return null;
    }    

    private String VerificarEmail(String eemail) {
    try {
        String report2 = null;
        if(eemail.equals("")){
            report2 = "";
        }
        else if(ayudantedao.ConsultarEmail(eemail)){
            report2 = "Ya existe";
        }
        else {
            report2 = "Libre";
        }            

        return report2;
    }catch (SQLException ex) {
        Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
        return null;
    }     
    
    
}
