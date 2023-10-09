package Servlets;

import com.mundo.lista.Metodos;
import com.mundo.lista.Persistencia;
import com.mundo.lista.Usuarios;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */
@WebServlet(name = "SvRegister", urlPatterns = {"/SvRegister"})
public class SvRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    
    /**
     * Metodo POST para añadir usuario registrado.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener la sesion actual
        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); //Array a cargar con el txt

        //Cargar la lista de perros desde un archivo
        Persistencia.leerArchivo(misUsuarios, context);

        //Obtener datos del formulario enviados por POST
        int cedula = Integer.parseInt(request.getParameter("cedula"));

        String nombre = request.getParameter("nombre");

        String contrasenia = request.getParameter("contrasenia");
        
        /**
         * Verificar si el usuario ya existe, en caso de hacerlo no se añade y muestra mensaje.
         */
        
        if(Metodos.encontrarUsuariosIg(cedula, context)){
            /**
             * Si el usuario no existe, se añade.
             */ 
            Usuarios user = new Usuarios(cedula, nombre, contrasenia);//Añadimos un objeto de tipo Usuarios
            
            misUsuarios.add(user); //Lo agregamos al array
            
            Persistencia.escribirArchivo(misUsuarios, context);//Actualizamos el txt
            
            //Enviamos bandera que indica que se añadio exitosamente
            String registrado = "si";
            request.setAttribute("registrado", registrado);
            
        } else if(!Metodos.encontrarUsuariosIg(cedula, context)){
            /**
             * Si el usuario existe, no se añade.
             */ 
             
            //Enviamos bandera que indica que NO se añadio exitosamente
            String registrado = "no";
            request.setAttribute("registrado", registrado);
        }

        // Redireccionar a la página de destino internamente en el servidor
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
