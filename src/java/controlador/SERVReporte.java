
package controlador;

import com.google.gson.Gson;
import dao.ClienteDAO;
import dao.EncomiendaDAO;
import dao.PrecioDAO;
import dao.VehiculoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
        String mencomienda = "";
                
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
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);  
            
                precio = preciodao.consultarIngresoPorFecha(cambio.get(0), cambio.get(1));
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
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);  
            
                precio = preciodao.consultarTipoIngresoPorFecha(cambio.get(0), cambio.get(1));
                mensaje = new Gson().toJson(precio); 
            }
            else if (action.equalsIgnoreCase("listarEncomiendaPorAño")) {                  
                encomienda = encomiendadao.consultarEncomiendaPorAño();
                mencomienda = new Gson().toJson(encomienda); 
            } 
            else if (action.equalsIgnoreCase("listarEncomiendaPorMes")) {
                String año = request.getParameter("año");
                encomienda = encomiendadao.consultarEncomiendaPorMes(año);
                mencomienda = new Gson().toJson(encomienda); 
            }            
            else if (action.equalsIgnoreCase("listarEncomiendaPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                               
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);                
            
                encomienda = encomiendadao.consultarEncomiendaPorFecha(cambio.get(0), cambio.get(1));
                mencomienda = new Gson().toJson(encomienda); 
            }            
            else if (action.equalsIgnoreCase("listarTipoEncomiendaPorAño")) {   
                                 
                if(request.getParameter("tipo") != null){
                    String tipo = request.getParameter("tipo");
                    encomienda = encomiendadao.consultarTipoEncomiendaPorAño(tipo);
                }
                else{
                    encomienda = encomiendadao.consultarTipoEncomiendaPorAño();
                }
                
                mencomienda = new Gson().toJson(encomienda); 
            }            
            else if (action.equalsIgnoreCase("listarTipoEncomiendaMes")) {  
                String año = request.getParameter("año");                
                encomienda = encomiendadao.consultarTipoEncomiendaPorMes(año);
                mencomienda = new Gson().toJson(encomienda); 
            }             
            else if (action.equalsIgnoreCase("listarTipoEncomiendaPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);
                                            
                encomienda = encomiendadao.consultarTipoEncomiendaPorFecha(cambio.get(0), cambio.get(1));
                mencomienda = new Gson().toJson(encomienda); 
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
            else if (action.equalsIgnoreCase("listarTipoVehiculoPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);
                                            
                vehiculo = vehiculodao.consultarTipoVehiculoPorFecha(cambio.get(0), cambio.get(1));
                mvehiculo = new Gson().toJson(vehiculo); 
            }                            
            else if (action.equalsIgnoreCase("listarVehiculoPorFecha")) {
                String fech_ini = request.getParameter("fechaI");
                String fech_fin = request.getParameter("fechaF");
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);                
                
                vehiculo = vehiculodao.consultarVehiculoPorFecha(cambio.get(0), cambio.get(1));                                
                mvehiculo = new Gson().toJson(vehiculo); 
            }
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
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);

                cliente = clientedao.consultarClientePorFecha(cambio.get(0), cambio.get(1));
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
                
                List<java.sql.Date> cambio = Fechas(fech_ini, fech_fin);
              
                cliente = clientedao.consultarTipoClientePorFecha(cambio.get(0), cambio.get(1));                
                mcliente = new Gson().toJson(cliente); 
            }             
            
            
        } catch (Exception ex) {
            Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();               
                jsonObject.put("mensaje", mensaje);          
                jsonObject.put("mencomienda", mencomienda);                
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

    
    public List<java.sql.Date> Fechas(String fech_ini, String fech_fin) throws ParseException {
                     
        SimpleDateFormat parseador = new SimpleDateFormat("dd/MM/yy");

        SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");

        //parsear String (dd/mm/yy) a Date (dd/mm/yy)
        Date date = parseador.parse(fech_ini);              
        Date date2 = parseador.parse(fech_fin);

        //formatear el Date (dd/mm/yy) a un String (yyyy-MM-dd)
        String d1 = formateador.format(date);
        String d2 = formateador.format(date2);

        //Aca tengo en fomarto yyyy-MM-dd"

        //formatear el String (yyyy-MM-dd) a un Date (yyyy-MM-dd)
        java.util.Date inicio = formateador.parse(d1);
        java.util.Date fin = formateador.parse(d2);

        java.sql.Date sqlStartDateInicio = new java.sql.Date(inicio.getTime());
        java.sql.Date sqlStartDateFinal = new java.sql.Date(fin.getTime());

        List<java.sql.Date> ejemploLista = new ArrayList<>();
        ejemploLista.add(sqlStartDateInicio);
        ejemploLista.add(sqlStartDateFinal);
        
        return ejemploLista;
        
    }
    
}
