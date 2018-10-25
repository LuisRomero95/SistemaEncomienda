/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.UbicacionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.Ubicacion;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author usuario
 */
public class SERVUbicacion extends HttpServlet {

    private UbicacionDAO ubicaciondao;
    Ubicacion u = new Ubicacion();

            
     public SERVUbicacion() {
    	ubicaciondao = new UbicacionDAO(){};
    }         
            


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        processRequest(request, response);         
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");          
        String estado = "";          
        String mensaje = "";

        try {
            //ELIMINAR UBICACIÓN
            if (action.equalsIgnoreCase("delete")) {                  
                    u.setId(Integer.parseInt(request.getParameter("id")));
                    ubicaciondao.eliminar(u);         
                    estado = "ok";
                    mensaje = "Borrado exitoso";


            }
            //EDITAR USUARIO
            else if (action.equalsIgnoreCase("edit")) {
                try {
                    estado = "ok"; 
                    String nombre = request.getParameter("titulo");
                    List titulo = ubicaciondao.ConsultarTitulo(nombre);
                    mensaje = new Gson().toJson(titulo); 
                  
                } catch (Exception ex) {
                }
            }              
            //LISTAR O ACTUALIZAR UBICACIÓN
            else if(action.equalsIgnoreCase("refresh")){                 
                estado = "ok";                                
                Thread.sleep(2000);
                List ubicacion = ubicaciondao.consultar();
                mensaje = new Gson().toJson(ubicacion);                                            
            }
            
        } catch (Exception ex) {
            Logger.getLogger(SERVUbicacion.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();
                jsonObject.put("estado", estado);                     
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        String titulo =  request.getParameter("titulo");
        String cx = request.getParameter("cx");
        String cy = request.getParameter("cy");
        String id =request.getParameter("txtId"); 

        Ubicacion u = new Ubicacion();    
        u.setTitulo(titulo);
        u.setCx(cx);                       
        u.setCy(cy);
        
        String action = request.getParameter("action");      
        String estado = ""; 
        String mensaje = "";
        //ELIMINAR USUARIO
       
        try {
                if (action.equalsIgnoreCase("insert")) { 
                    if(id == null || id.isEmpty() ){                   
                            ubicaciondao.insertar(u);
                            Thread.sleep(2000);
                            estado = "ok";
                            mensaje = "Grabación exitosa";
                    }
                    else{            
                        try {
                            u.setId(Integer.parseInt(id));
                            ubicaciondao.modificar(u);
                            estado = "ok";
                            mensaje = "Edición exitosa";
                        } catch (Exception ex) {
                            Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }               
                }
                else{
                    estado = "error";
                    mensaje = "error al grabar";
                }
        } catch (Exception e) {
        }
        finally{
            try {
                JSONObject jsonObject=new  JSONObject();
                jsonObject.put("estado", estado);
                jsonObject.put("mensaje", mensaje);
                response.addHeader("Access-Control-Allow-Origin", "*");
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
