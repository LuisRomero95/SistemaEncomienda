
package controlador;

import dao.ClienteDAO;
import dao.EncomiendaDAO;
import dao.PrecioDAO;
import dao.TipoEncomiendaDAO;
import dao.UsuarioDAO;
import dao.VehiculoDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.Encomienda;

public class SERVEncomienda extends HttpServlet {

 private static String insert= "/InsertarEncomienda.jsp";
    private static String edit = "/EditarEncomienda.jsp";
    private static String list_encomienda = "/ListarEncomienda.jsp";
    private EncomiendaDAO encomiendadao;
    private ClienteDAO clientedao;    
    private UsuarioDAO usuariodao;    
    private VehiculoDAO vehiculodao;
    private PrecioDAO preciodao;
    private TipoEncomiendaDAO tipoencomiendadao;    
    Encomienda enc = new Encomienda();

            
     public SERVEncomienda() {
    	encomiendadao = new EncomiendaDAO(){};
        clientedao = new ClienteDAO(){};
        usuariodao = new UsuarioDAO(){};
        vehiculodao = new VehiculoDAO(){};
        preciodao = new PrecioDAO(){};
        tipoencomiendadao = new TipoEncomiendaDAO(){};
    }         
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String forward = "";   
            String action = request.getParameter("action");
                
            //ELIMINAR CLIENTE
            if (action.equalsIgnoreCase("delete")) {                 
                try {
                    enc.setId(Integer.parseInt(request.getParameter("id")));
                    encomiendadao.eliminar(enc);
                    forward = list_encomienda;
                    request.setAttribute("encomiendadao", encomiendadao.consultar());                      
                } catch (Exception ex) {
                }              
            }
            //EDITAR CLIENTE
            else if (action.equalsIgnoreCase("edit")) {
                try {
                    forward = edit;
                    int id = Integer.parseInt(request.getParameter("id"));
                    Encomienda encomienda = encomiendadao.BuscarPorId(id);             
                    request.setAttribute("encomienda", encomienda);
                    List cliente = clientedao.consultar();                
                    List usuario = usuariodao.consultar();
                    List vehiculo = vehiculodao.consultar();
                    List  tipoencomienda = tipoencomiendadao.consultar(); 
                    request.setAttribute("cliente", cliente);
                    request.setAttribute("usuario", usuario);                    
                    request.setAttribute("vehiculo", vehiculo);                 
                    request.setAttribute("tipoencomienda", tipoencomienda);
                } catch (Exception ex) {
                }
            }            
            //INSERTAR CLIENTE    
            else if(action.equalsIgnoreCase("insert")) {        
            try {
                forward = insert;
                List cliente = clientedao.consultar();                
                List usuario = usuariodao.consultar();
                List vehiculo = vehiculodao.consultar();
                List  tipoencomienda = tipoencomiendadao.consultar();                
                request.setAttribute("cliente", cliente);
                request.setAttribute("usuario", usuario);                    
                request.setAttribute("vehiculo", vehiculo);       
                request.setAttribute("tipoencomienda", tipoencomienda);  
            } catch (Exception ex) {
                Logger.getLogger(SERVVehiculo.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            }
            //LISTAR O ACTUALIZAR CLIENTE
            else if(action.equalsIgnoreCase("refresh")){
                try {
                    forward = list_encomienda;
                    request.setAttribute("encomienda", encomiendadao.consultar()); 
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
        
        String emisor = request.getParameter("txtEmisor");
        String usuario = request.getParameter("txtUsuario");
        String receptor = request.getParameter("txtReceptor");
        String vehiculo = request.getParameter("txtVehiculo");
        String descripcion = request.getParameter("txtDescripcion");
        String strFecha = request.getParameter("txtFechaEnvio");
        String tipo = request.getParameter("txtTipo");
        String id =request.getParameter("txtId");
       
        try {
            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date date = sdf1.parse(strFecha);
            java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 
            
            Encomienda encomienda = new Encomienda();
            encomienda.setEmisor(emisor);            
            encomienda.setUsuario(usuario);      
            encomienda.setReceptor(receptor);      
            encomienda.setVehiculo(vehiculo);                 
            encomienda.setDescripcion(descripcion);
            encomienda.setFecha(sqlStartDate);
            encomienda.setTipo(tipo);
            
                if (id == null || id.isEmpty()) {
                    try {
                        encomiendadao.insertar(encomienda);
                    } catch (Exception ex) {
                        Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {                    
                    try {
                        encomienda.setId(Integer.parseInt(id));
                        encomiendadao.modificar(encomienda);
                    } catch (Exception ex) {
                        Logger.getLogger(SERVConductor.class.getName()).log(Level.SEVERE, null, ex);                        
                    }
                } 
        } catch (Exception e) {
        }
                   
        response.sendRedirect(request.getContextPath() + "/SERVEncomienda?action=refresh");   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
