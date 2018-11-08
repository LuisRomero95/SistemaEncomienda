
package controlador;

import dao.ClienteDAO;
import dao.PrecioDAO;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelado.Precio;


public class SERVPrecio extends HttpServlet {

    private static String insert= "/InsertarPrecio.jsp";
    private static String edit = "/EditarPrecio.jsp";
    private static String list_precio = "/ListarPrecio.jsp";
    private PrecioDAO preciodao;
    private ClienteDAO tcdao;    
    Precio pre = new Precio();

            
     public SERVPrecio() {
    	preciodao = new PrecioDAO(){};
        tcdao = new ClienteDAO(){};
    }       
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                
        String forward = "";           
        String action = request.getParameter("action");                
           
            //ELIMINAR USUARIO
            if (action.equalsIgnoreCase("delete")) {                 
                try {
                    pre.setId(Integer.parseInt(request.getParameter("id")));
                    preciodao.eliminar(pre);                    
                    forward = list_precio;                 
                    request.setAttribute("precio", preciodao.consultar());
                } catch (Exception ex) {
                    
                }
            }
            //EDITAR USUARIO
            else if (action.equalsIgnoreCase("edit")) {
                try {
                    forward = edit;
                    int id = Integer.parseInt(request.getParameter("id"));
                    Precio precio = preciodao.BuscarPorId(id);
                    List  cliente = tcdao.consultar();                    
                    request.setAttribute("precio", precio);
                    request.setAttribute("cliente", cliente);                      
                } catch (Exception ex) {
                }
            }            
            //INSERTAR USUARIO    
            else if(action.equalsIgnoreCase("insert")) {
                try {
                    forward = insert;
                    List  cliente = tcdao.consultar();
                    request.setAttribute("cliente", cliente);     
                } catch (Exception ex) {
                    Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }            
            //LISTAR O ACTUALIZAR USUARIO
            else if(action.equalsIgnoreCase("refresh")){
                try {
                    forward = list_precio;
                    List  precio = preciodao.consultar();
                    request.setAttribute("precio", precio);                  
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
        
        String tipo = request.getParameter("txtContenedorEnvio");
        int cantidad = Integer.parseInt(request.getParameter("txtcantidadSobres"));
        double peso = Double.parseDouble(request.getParameter("txtPeso"));
        double resultado = Double.parseDouble(request.getParameter("txtResultado"));
        String id =request.getParameter("txtId");
        
        try {
        Precio precio = new Precio();            
        precio.setTipo(tipo);
        precio.setCantidad(cantidad);
        precio.setPeso(peso);
        precio.setResultado(resultado);

        
//        RequestDispatcher rd = null;
//        String monto;
//        if(request.getParameter("btnInsertar")!=null){
//
//            monto = request.getParameter("txtResultado");
//
//            
//            request.setAttribute("monto", monto);
//            rd = request.getRequestDispatcher("InsertarEncomienda.jsp");
//        }        
                
        if(id == null || id.isEmpty() ){
            try {
                preciodao.insertar(precio);
            } catch (Exception ex) {
                Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{            
            try {
                precio.setId(Integer.parseInt(id));
                preciodao.modificar(precio);
            } catch (Exception ex) {
                Logger.getLogger(SERVUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
        } catch (Exception e) {
        }
                         
        response.sendRedirect(request.getContextPath() + "/SERVPrecio?action=refresh");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
