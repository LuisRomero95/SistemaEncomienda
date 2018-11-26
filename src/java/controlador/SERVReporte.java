
package controlador;

import com.google.gson.Gson;
import dao.EncomiendaDAO;
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
import modelado.Encomienda;
import org.json.JSONException;
import org.json.JSONObject;


public class SERVReporte extends HttpServlet {

    private EncomiendaDAO encomiendadao;
    private VehiculoDAO vehiculodao;
    Encomienda enco = new Encomienda();

            
     public SERVReporte() {
    	encomiendadao = new EncomiendaDAO(){};
        vehiculodao = new VehiculoDAO(){};
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

        try {
            
            if (action.equalsIgnoreCase("listarEncomiendaPorAño")) {                  
                List encomienda = encomiendadao.consultarEncomiendaPorAño();
                mensaje = new Gson().toJson(encomienda); 
            }                        
            else if (action.equalsIgnoreCase("listarEncomiendaPorMes")) {
                String año = request.getParameter("año");
                List encomienda = encomiendadao.consultarEncomiendaPorMes(año);
                mensaje = new Gson().toJson(encomienda); 
            }
            else if (action.equalsIgnoreCase("listarEncomiendaPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                List encomienda = encomiendadao.consultarEncomiendaPorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mensaje = new Gson().toJson(encomienda); 
            }
            else if (action.equalsIgnoreCase("listarTipoEncomiendaPorAño")) {   
                
                List encomienda;
                 
                if(request.getParameter("tipo") != null){
                    String tipo = request.getParameter("tipo");
                     encomienda = encomiendadao.consultarTipoEncomiendaPorAño(tipo);
                }
                else{
                     encomienda = encomiendadao.consultarTipoEncomiendaPorAño();
                }
                
                mensaje = new Gson().toJson(encomienda); 
            }
            else if (action.equalsIgnoreCase("listarTipoEncomiendaMes")) {  
                String año = request.getParameter("año");                
                List encomienda = encomiendadao.consultarTipoEncomiendaPorMes(año);
                mensaje = new Gson().toJson(encomienda); 
            }            
            else if (action.equalsIgnoreCase("listarTipoEncomiendaPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf1.parse(fech_ini);
                java.util.Date fin = sdf1.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                List encomienda = encomiendadao.consultarTipoEncomiendaPorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mensaje = new Gson().toJson(encomienda); 
            }     
            else if (action.equalsIgnoreCase("listarVehiculoPorAño")) {                  
                List vehiculos = vehiculodao.consultarVehiculoPorAño();
                mvehiculo = new Gson().toJson(vehiculos); 
            }                
            else if (action.equalsIgnoreCase("listarVehiculoPorMes")) {
                String año = request.getParameter("año");          
                List vehiculos = vehiculodao.consultarVehiculoPorMes(año);
                mvehiculo = new Gson().toJson(vehiculos); 
            }    
            else if (action.equalsIgnoreCase("listarVehiculoPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date inicio = sdf2.parse(fech_ini);
                java.util.Date fin = sdf2.parse(fech_fin);
                java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime()); 
                java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime()); 
            
                List vehiculo = vehiculodao.consultarVehiculoPorFecha(sqlStartDateInicio, sqlStartDateFinal);
                mvehiculo = new Gson().toJson(vehiculo); 
            }            
            
        } catch (Exception ex) {
            Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();               
                jsonObject.put("mensaje", mensaje);
                jsonObject.put("mvehiculo", mvehiculo);
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
