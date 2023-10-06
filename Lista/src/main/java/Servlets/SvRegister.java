package Servlets;

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
        processRequest(request, response);
        

        System.out.println("Corriendo metodo doGet");

        //Obtener la sesion actual
        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        ArrayList<Usuarios> misUsuarios = new ArrayList<>();

        //Cargar la lista de perros desde un archivo
        Persistencia.leerArchivo(misUsuarios, context);

        // Obtener datos del formulario enviados por POST
        String ced = request.getParameter("cedula");

        String contrasenia = request.getParameter("contrasenia");

        int cedula = Integer.parseInt(ced);

        for (Usuarios usuario : misUsuarios) {
            if ((usuario.getCedula() == cedula) && (usuario.getContrasena().equals(contrasenia))) {
                // Si la condición se cumple, redirige a login.jsp
                response.sendRedirect("login.jsp");
                return; // Termina la ejecución del método doGet
            } else {
                String ingresar = "no";
                request.setAttribute("ingresar", ingresar);
                // Redireccionar a la página de destino internamente en el servidor
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        System.out.println("Corriendo metodo doPost");

        //Obtener la sesion actual
        HttpSession session = request.getSession();

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        ArrayList<Usuarios> misUsuarios = new ArrayList<>();

        //Cargar la lista de perros desde un archivo
        Persistencia.leerArchivo(misUsuarios, context);

        // Obtener datos del formulario enviados por POST
        String cedula = request.getParameter("cedula");

        String nombre = request.getParameter("nombre");

        String contrasenia = request.getParameter("contrasenia");

        Usuarios user = new Usuarios(Integer.parseInt(cedula), nombre, contrasenia);

        misUsuarios.add(user);

        Persistencia.escribirArchivo(misUsuarios, context);

        String registrado = "si";
        request.setAttribute("registrado", registrado);

        // Redireccionar a la página de destino internamente en el servidor
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
