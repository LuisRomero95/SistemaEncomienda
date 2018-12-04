
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Acceso;
import javax.servlet.RequestDispatcher;

public class SERVLogin extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        response.setContentType("text/html;charset=UTF-8");
          response.addHeader("X-Frame-Options", "DENY");   
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String nombre;
            String contra;
            int nivel = 0;
            Acceso acc = new Acceso();
            
            RequestDispatcher rd = null;
            
            
            if(request.getParameter("btnIniciar")!=null){
                
                nombre = request.getParameter("txtUsuario");
                contra = request.getParameter("txtContra");
                nivel = acc.validar(nombre, contra);
                
                
                request.setAttribute("nivel", nivel);
                request.setAttribute("nombre", nombre);
                rd = request.getRequestDispatcher("index.jsp");
            }
            
            rd.forward(request, response);
        }
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
 
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
