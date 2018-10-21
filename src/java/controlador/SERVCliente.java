
package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelado.Cliente;

public class SERVCliente extends HttpServlet {
    
    private static String insert= "/InsertarCliente.jsp";
    private static String edit = "/EditarCliente.jsp";
    private static String list_cliente = "/ListarCliente.jsp";
    private ClienteDAO clientedao;
    Cliente c = new Cliente();
            
     public SERVCliente() {
    	clientedao = new ClienteDAO(){};
    }         
                        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            String forward = "";   
            String action = request.getParameter("action");
            
            //ELIMINAR CLIENTE
            if (action.equalsIgnoreCase("delete")) {                 
                try {
                    c.setId(Integer.parseInt(request.getParameter("id")));
                    clientedao.eliminar(c);
                    forward = list_cliente;
                    request.setAttribute("cliente", clientedao.consultar());                      
                } catch (Exception ex) {
                }              
            }
            //EDITAR CLIENTE
            else if (action.equalsIgnoreCase("edit")) {
                try {
                    forward = edit;
                    int id = Integer.parseInt(request.getParameter("id"));
                    Cliente cliente = clientedao.BuscarPorId(id);             
                    request.setAttribute("cliente", cliente);
                } catch (Exception ex) {
                }
            }            
            //INSERTAR CLIENTE    
            else if(action.equalsIgnoreCase("insert")) {        
                    forward = insert;
            
            }
            //LISTAR O ACTUALIZAR CLIENTE
            else if(action.equalsIgnoreCase("refresh")){
                try {
                    forward = list_cliente;
                    request.setAttribute("cliente", clientedao.consultar()); 
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
        
        if(request.getParameter("ddni")!=null){
            String ddni = request.getParameter("ddni");
            String report = VerificarRucDni(ddni);

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

        String identificador = request.getParameter("txtRuc_Dni");
        String nombre = request.getParameter("txtNombre");
        String email = request.getParameter("txtEmail");
        String fijo = request.getParameter("txtTel_fij");
        String celular = request.getParameter("txtTel_cel");
        String direccion = request.getParameter("txtDirec");
        String id =request.getParameter("txtId");
                                                      
        try {                              
            Cliente cli = new Cliente();
            cli.setNom(nombre);
            cli.setRuc_dni(identificador);            
            cli.setEmail(email);
            cli.setTel_fij(fijo);
            cli.setTel_cel(celular);
            cli.setDirec(direccion); 
                
                if (id == null || id.isEmpty()) {
                     if(clientedao.ConsultarEmail(email) || clientedao.ConsultarRUCDNI(identificador)){    

                    }else {
                         try {
                             clientedao.insertar(cli);
                         } catch (Exception ex) {
                             Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);
                         }
                     }
                } else {                    
                    try {
                        cli.setId(Integer.parseInt(id));
                        clientedao.modificar(cli);
                    } catch (Exception ex) {
                        Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);                        
                    }
                }             
                   
        }catch (SQLException ex) {
            Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);             
        }                             
        response.sendRedirect(request.getContextPath() + "/SERVCliente?action=refresh");        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
 private String VerificarRucDni(String ddni) {
    try {
        String report = null;
        if(ddni.equals("")){
            report = "";
        }
        else if(clientedao.ConsultarRUCDNI(ddni)){
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
        else if(clientedao.ConsultarEmail(eemail)){
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
