/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Lista;
import com.mundo.lista.Metodos;
import com.mundo.lista.Serializacion;
import com.mundo.lista.Tareas;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet añadir y buscar
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */
@WebServlet(name = "SvAnadirBuscar", urlPatterns = {"/SvAnadirBuscar"})
public class SvAnadirBuscar extends HttpServlet {
     Lista listaTareas = new Lista();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    /**
     * Metodo GET para buscar
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Se obtiene el id 
        String terminoBusqueda = request.getParameter("buscar");
        String usuario = request.getParameter("usuarioI"); //Se obtiene el usuario 
        //Redirigimos con la variable para que cambie la tabla
        response.sendRedirect("login.jsp?search="+terminoBusqueda+"&usuarioI="+usuario);
    }
     /**
     * Metodo POST para añadir tarea
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("usuarioI");//Se obtiene el usuario
        
        //Obtener el contexto del servlet
        ServletContext context = getServletContext();
        //Deserializamos 
        try {
            listaTareas = Serializacion.leerTareas(context);
            if(listaTareas == null){
                listaTareas = new Lista();//Se crea en caso de no tener nada
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLoginCheck.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Recibir los parámetros del formulario
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fechaStr = request.getParameter("fecha");
        //Se obtiene la fecha
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        
        try {
            fecha = sdf.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace(); // Manejo de error en caso de que la fecha no sea válida
        };
        
        //Obtenemos la informacion del radio
        String ubicar=request.getParameter("opcion");
        
        //La opcion ingresada del radio
        String idUbi=request.getParameter("idEd");
        String idUbi2=request.getParameter("idEd2");
        
        //Bandera para saber si se añade correctamente y la excepcion
        String an="";
        
        //Analizamos si no existen tareas iguales
        if(!listaTareas.existenId(id)){
            Tareas nuevaTarea = new Tareas(id, titulo, descripcion, fecha);//Creamos una tarea nueva
            switch(ubicar){ //La ubicamos
                //Al inicio
                case "prin":
                    listaTareas.insertarPrincipio(nuevaTarea);
                    an="si";
                    break;
                //Antes de
                case "ant":
                    //Se analiza si es nulo o vacio el id
                    if(idUbi2 != null  && !idUbi.equals("") && listaTareas.existenId(Integer.parseInt(idUbi))){
                        listaTareas.insertarAntesDe(Integer.parseInt(idUbi), nuevaTarea);
                        an="si";                          
                    } else{
                        an="errorid";//Excepcion id vacio
                    }
                    break;
                //Al final
                case "fin":
                    listaTareas.insertarFinal(nuevaTarea);
                    an="si";
                    break;
                //Despues de
                case "desp":
                    //Se analiza si es nulo o vacio el id
                    if(idUbi2 != null  && !idUbi.equals("") && listaTareas.existenId(Integer.parseInt(idUbi))){
                        listaTareas.insertarDespuesDe(Integer.parseInt(idUbi2), nuevaTarea);
                        an="si"; 
                    } else{
                        an="errorid";//Excepcion id vacio
                    }
                    break;      
            }
            //Se serializa 
            Serializacion.escribirArchivo(listaTareas, context);
            
            
        } else {
            an="no";// Exepcion en caso que existe una tarea con ese ID
        }
        
        //Redirigimos con la bandera y usuario
        response.sendRedirect("login.jsp?usuarioI="+nombre+"&add="+an);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
