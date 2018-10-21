
package controlador;

import dao.VehiculoDAO;
import dao.ConductorDAO;
import dao.AyudanteDAO;
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
import modelado.Vehiculo;

public class SERVVehiculo extends HttpServlet {

    private static String insert= "/InsertarVehiculo.jsp";
    private static String edit = "/EditarVehiculo.jsp";
    private static String list_vehiculo = "/ListarVehiculo.jsp";
    private final VehiculoDAO vehiculodao;
    private final ConductorDAO conductordao;
    private final AyudanteDAO ayudantedao;
    Vehiculo c = new Vehiculo();
            
     public SERVVehiculo() {
    	vehiculodao = new VehiculoDAO(){};
        conductordao = new ConductorDAO(){};
        ayudantedao = new AyudanteDAO(){};
    }         
                
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String forward = "";   
        String action = request.getParameter("action");

        //ELIMINAR VEHICULO
        if (action.equalsIgnoreCase("delete")) {

            try {
                c.setId(Integer.parseInt(request.getParameter("id")));
                vehiculodao.eliminar(c);                    
                forward = list_vehiculo;                 
                request.setAttribute("vehiculo", vehiculodao.consultar());
            } catch (Exception ex) {
            }
        }
        //EDITAR VEHICULO
        else if (action.equalsIgnoreCase("edit")) {
            try {
                forward = edit;
                int id = Integer.parseInt(request.getParameter("id"));
                Vehiculo vehiculo = vehiculodao.BuscarPorId(id);             
                List conductor = conductordao.consultar();
                List ayudante = ayudantedao.consultar();
                request.setAttribute("conductor", conductor);
                request.setAttribute("ayudante", ayudante);                    
                request.setAttribute("vehiculo", vehiculo);
            } catch (Exception ex) {
            }
        }            
        //INSERTAR VEHICULO    
        else if(action.equalsIgnoreCase("insert")) {        
            try {
                forward = insert;
                List conductor = conductordao.consultar();
                List ayudante = ayudantedao.consultar();
                request.setAttribute("conductor", conductor);
                request.setAttribute("ayudante", ayudante);                    
            } catch (Exception ex) {
                Logger.getLogger(SERVVehiculo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        //LISTAR O ACTUALIZAR VEHICULO
        else if(action.equalsIgnoreCase("refresh")){
            try {
                forward = list_vehiculo;      
                List vehiculo = vehiculodao.consultar();
                request.setAttribute("vehiculo", vehiculo);
            } catch (Exception ex) {
                Logger.getLogger(SERVVehiculo.class.getName()).log(Level.SEVERE, null, ex);
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
        
        if(request.getParameter("pplaca")!=null){
            String pplaca = request.getParameter("pplaca");
            String report = VerificarPlaca(pplaca);

            response.setContentType("text/plain");
            out.println("" + report + "");
                            
            out.flush();
            out.close();

        }             
            
        String placa = request.getParameter("txtPlaca");
        String conductor = request.getParameter("txtCon");
        String ayudante = request.getParameter("txtAyu");
        String año = request.getParameter("txtAño");
        String marca = request.getParameter("txtMarca");            
        String modelo = request.getParameter("txtModelo");
        String serie = request.getParameter("txtSerie");
        int Capmax = Integer.parseInt(request.getParameter("txtCapmax"));
        int Pasmax = Integer.parseInt(request.getParameter("txtPasmax"));            
        String id =request.getParameter("txtId");
    
        Vehiculo veh = new Vehiculo();
        veh.setPlaca(placa);
        veh.setConductor(conductor);
        veh.setAyudante(ayudante);
        veh.setAño(año);            
        veh.setMarca(marca);
        veh.setModelo(modelo);            
        veh.setSerie(serie);            
        veh.setCapmax(Capmax);
        veh.setPasmax(Pasmax);  
                
        if (id == null || id.isEmpty()) {
            try {
                vehiculodao.insertar(veh);
            } catch (Exception ex) {
                Logger.getLogger(SERVVehiculo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else {                    
            try {
                veh.setId(Integer.parseInt(id));
                vehiculodao.modificar(veh);
            } catch (Exception ex) {
                Logger.getLogger(SERVVehiculo.class.getName()).log(Level.SEVERE, null, ex);                        
            }
        }             
                                          
        response.sendRedirect(request.getContextPath() + "/SERVVehiculo?action=refresh");          
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String VerificarPlaca(String nnombre) {
        try {
            String report = null;
            if(nnombre.equals("")){
                report = "";
            }
            else if(vehiculodao.ConsultarNombre(nnombre)){
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
}
