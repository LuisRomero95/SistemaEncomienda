
package controlador;

import dao.ConductorDAO;
import dao.TipoConductorDAO;
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

import modelado.Conductor;

public class SERVConductor extends HttpServlet {

    private static String insert= "/InsertarConductor.jsp";
    private static String edit = "/EditarConductor.jsp";
    private static final String list_conductor = "/ListarConductor.jsp";
    private final ConductorDAO conductordao;
    private TipoConductorDAO tpdao;    
    Conductor c = new Conductor();

    public SERVConductor() {
        conductordao = new ConductorDAO(){};
        tpdao = new TipoConductorDAO(){};
    }
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String forward = "";   
        String action = request.getParameter("action");

        //ELIMINAR AYUDANTE
        if (action.equalsIgnoreCase("delete")) {
            try {
                c.setId(Integer.parseInt(request.getParameter("id")));
                conductordao.eliminar(c);                
                forward = list_conductor;                 
                request.setAttribute("conductor", conductordao.consultar());
            } catch (Exception ex) {
            }
        }
        //EDITAR AYUDANTE
        else if (action.equalsIgnoreCase("edit")) {
            try {
                forward = edit;
                int id = Integer.parseInt(request.getParameter("id"));
                Conductor conductor = conductordao.BuscarPorId(id);                
                request.setAttribute("conductor", conductor);
                request.setAttribute("tipoconductor", tpdao.consultar());
            } catch (Exception ex) {
            }
        }            
        //INSERTAR AYUDANTE    
        else if(action.equalsIgnoreCase("insert")) {
            try {
                forward = insert;
                List tipoconductor = tpdao.consultar();
                request.setAttribute("tipoconductor", tipoconductor);
            } catch (Exception ex) {
                Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        //LISTAR O ACTUALIZAR AYUDANTE
        else if(action.equalsIgnoreCase("refresh")){
            try {
                forward = list_conductor; 
                request.setAttribute("conductor", conductordao.consultar());
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
        if(request.getParameter("llic")!=null){
            String llciencia = request.getParameter("llic");
            String report = VerificarLic(llciencia);

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
        
        String nombre = request.getParameter("txtNombre");
        String ape = request.getParameter("txtApe");                
        String dni = request.getParameter("txtDni");
        String lic = request.getParameter("txtLic");
        String email = request.getParameter("txtEmail");
        String tel = request.getParameter("txtTel");
        String direc = request.getParameter("txtDirec");
        String tipo = request.getParameter("txtTipo");        
        String id =request.getParameter("txtId");                                                           
                                    
        Conductor con = new Conductor();
        con.setNom(nombre);
        con.setApe(ape);
        con.setDni(dni);
        con.setLic(lic);        
        con.setEmail(email);     
        con.setTel(tel);        
        con.setDirec(direc);                      
        con.setTipo(tipo);  

        if (id == null || id.isEmpty()) {
            try {
                conductordao.insertar(con);
            } catch (Exception ex) {
                Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {                    
            try {
                con.setId(Integer.parseInt(id));
                conductordao.modificar(con);
            } catch (Exception ex) {
                Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);                        
            }
        }                                
                      
        response.sendRedirect(request.getContextPath() + "/SERVConductor?action=refresh");                                       
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
            else if(conductordao.ConsultarDNI(ddni)){
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
    
    private String VerificarLic(String llicencia) {
        try {
            String report = null;
            if(llicencia.equals("")){
                report = "";
            }
            else if(conductordao.ConsultarLicencia(llicencia)){
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
            else if(conductordao.ConsultarEmail(eemail)){
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
