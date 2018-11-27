
package controlador;

import com.google.gson.Gson;
import dao.ClienteDAO;
import dao.EncomiendaDAO;
import dao.PrecioDAO;
import dao.VehiculoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;


public class SERVReporte extends HttpServlet {

    private EncomiendaDAO encomiendadao;
    private VehiculoDAO vehiculodao;
    private ClienteDAO clientedao;
    private PrecioDAO preciodao;
            
     public SERVReporte() {
    	encomiendadao = new EncomiendaDAO(){};
        vehiculodao = new VehiculoDAO(){};
        clientedao = new ClienteDAO(){};
        preciodao = new PrecioDAO(){};
    }         
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        processRequest(request, response);         
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");                   
        String mensaje = "";
        String mvehiculo = ""; 
        String mcliente = "";
        
        List cliente;        
        List encomienda;
        List precio;
        List vehiculo;
        
        try {
            
            if (action.equalsIgnoreCase("listarIngresoPorAño")) {                  
                precio = preciodao.consultarIngresoPorAño();
                mensaje = new Gson().toJson(precio); 
            }                        
            else if (action.equalsIgnoreCase("listarIngresoPorMes")) {
                String año = request.getParameter("año");
                precio = preciodao.consultarIngresoPorMes(año);
                mensaje = new Gson().toJson(precio); 
            }
            else if (action.equalsIgnoreCase("listarIngresoPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                precio = preciodao.consultarIngresoPorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mensaje = new Gson().toJson(precio); 
            }
            else if (action.equalsIgnoreCase("listarTipoIngresoPorAño")) {   
                                 
                if(request.getParameter("tipo") != null){
                    String tipo = request.getParameter("tipo");
                    precio = preciodao.consultarTipoIngresoPorAño(tipo);
                }
                else{
                    precio = preciodao.consultarTipoIngresoPorAño();
                }
                
                mensaje = new Gson().toJson(precio); 
            }
            else if (action.equalsIgnoreCase("listarTipoIngresoMes")) {  
                String año = request.getParameter("año");                
                precio = preciodao.consultarTipoIngresoPorMes(año);
                mensaje = new Gson().toJson(precio); 
            }            
            else if (action.equalsIgnoreCase("listarTipoIngresoPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                precio = preciodao.consultarTipoIngresoPorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mensaje = new Gson().toJson(precio); 
            }     
            else if (action.equalsIgnoreCase("listarVehiculoPorAño")) {                  
                vehiculo = vehiculodao.consultarVehiculoPorAño();
                mvehiculo = new Gson().toJson(vehiculo); 
            }                
            else if (action.equalsIgnoreCase("listarTipoVehiculoPorAño")) {   
                                 
                if(request.getParameter("tipo") != null){
                    String tipo = request.getParameter("tipo");
                    vehiculo = preciodao.consultarTipoIngresoPorAño(tipo);
                }
                else{
                    vehiculo = vehiculodao.consultarTipoVehiculoPorAño();
                }
                
                mvehiculo = new Gson().toJson(vehiculo); 
            }            
            else if (action.equalsIgnoreCase("listarVehiculoPorMes")) {
                String año = request.getParameter("año");          
                vehiculo = vehiculodao.consultarVehiculoPorMes(año);
                mvehiculo = new Gson().toJson(vehiculo); 
            }    
            else if (action.equalsIgnoreCase("listarTipoVehiculoMes")) {  
                String año = request.getParameter("año");                
                vehiculo = vehiculodao.consultarTipoVehiculoPorMes(año);
                mvehiculo = new Gson().toJson(vehiculo); 
            }                   
            
//            else if (action.equalsIgnoreCase("listarVehiculoPorFecha")) {
//                String fech_ini = request.getParameter("fechaI");
//                String fech_fin = request.getParameter("fechaF");
//                
//                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
//                java.util.Date inicio = sdf2.parse(fech_ini);
//                java.util.Date fin = sdf2.parse(fech_fin);
//                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
//                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
//            
//                vehiculo = vehiculodao.consultarVehiculoPorFecha(sqlStartDateInicio, sqlStartDateFinal);
//                mvehiculo = new Gson().toJson(vehiculo); 
//            }
            if (action.equalsIgnoreCase("listarClientePorAño")) {
                cliente = clientedao.consultarClientePorAño();
                mcliente = new Gson().toJson(cliente);
            }
            else if (action.equalsIgnoreCase("listarClientePorMes")) {
                String año = request.getParameter("año");
                cliente = clientedao.consultarClientePorMes(año);
                mcliente = new Gson().toJson(cliente); 
            }
            else if (action.equalsIgnoreCase("listarClientePorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                cliente = clientedao.consultarClientePorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mcliente = new Gson().toJson(cliente); 
            }            
            else if (action.equalsIgnoreCase("listarTipoClientePorAño")) {   
                                
                if(request.getParameter("tipo") != null){
                    String tipo = request.getParameter("tipo");
                    cliente = clientedao.consultarTipoClientePorAño(tipo);
                }
                else{
                    cliente = clientedao.consultarTipoClientePorAño();
                }
                
                mcliente = new Gson().toJson(cliente); 
            }
            else if (action.equalsIgnoreCase("listarTipoClienteMes")) {  
                String año = request.getParameter("año");                
                cliente = clientedao.consultarTipoClientePorMes(año);
                mcliente = new Gson().toJson(cliente); 
            }
            else if (action.equalsIgnoreCase("listarTipoClientePorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                cliente = clientedao.consultarTipoClientePorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mcliente = new Gson().toJson(cliente); 
            }             
            
            
        } catch (Exception ex) {
            Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();               
                jsonObject.put("mensaje", mensaje);
                jsonObject.put("mvehiculo", mvehiculo);
                jsonObject.put("mcliente", mcliente);
                response.setCharacterEncoding("utf8");
                response.setContentType("application/json");
                out.print(jsonObject);
                
     
            } catch (JSONException ex) {
                Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
