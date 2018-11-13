
package controlador;

import com.google.gson.Gson;
import dao.EncomiendaDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
    Encomienda enco = new Encomienda();

            
     public SERVReporte() {
    	encomiendadao = new EncomiendaDAO(){};
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

        try {

            if (action.equalsIgnoreCase("listarEncomiendaPorMes")) {                  
                List encomienda = encomiendadao.consultarEncomiendaPorMes();
                mensaje = new Gson().toJson(encomienda); 
            }
            else if (action.equalsIgnoreCase("listarEncomiendaPorFecha")) {                  
                List encomienda = encomiendadao.consultarEncomiendaPorFecha();
                mensaje = new Gson().toJson(encomienda); 
            }
            else if (action.equalsIgnoreCase("listarTipoEncomienda")) {                  
                List encomienda = encomiendadao.consultarTipoEncomienda();
                mensaje = new Gson().toJson(encomienda); 
            }
            
        } catch (Exception ex) {
            Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();               
                jsonObject.put("mensaje", mensaje);
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
