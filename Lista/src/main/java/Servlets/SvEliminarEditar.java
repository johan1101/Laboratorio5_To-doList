/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Lista;
import com.mundo.lista.Serializacion;
import com.mundo.lista.Tareas;
import java.io.IOException;
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
 * Servlet eliminar y editar
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */
@WebServlet(name = "SvEliminarEditar", urlPatterns = {"/SvEliminarEditar"})
public class SvEliminarEditar extends HttpServlet {
    
    Lista listaTareas = new Lista();//Se crea una lista
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    /**
     * Metodo GET para eliminar 
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();
        
        //Se llena con el archivo
        try {
            listaTareas = Serializacion.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminarEditar.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        String idEliminar = request.getParameter("idDel");
        String usuarioI = request.getParameter("usuarioI");
        
        //Se castea
        int eliminar = Integer.parseInt(idEliminar);

        listaTareas.eliminarTarea(eliminar);//Eliminamos la tarea
        
        //Actualizamos el archivo
        Serializacion.escribirArchivo(listaTareas, context);

        // Redireccionar a la página de destino
        response.sendRedirect("login.jsp?usuarioI="+usuarioI);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       //Obtener el contexto del servlet
        ServletContext context = getServletContext();
        String nombre = request.getParameter("usuarioI");//Se obtiene nombre del usuario
        
        //Se llena la lista con el archivo
        try {
            listaTareas = Serializacion.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminarEditar.class.getName()).log(Level.SEVERE, null, ex);
        }
         // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        String edit = request.getParameter("edit");//Que hay que editar
        int id=Integer.parseInt( request.getParameter("idEd"));//Id tarea a editar
        
        //Se analiza que se debe editar
        switch(edit){
            //Titulo
            case"tit":
                String titulo = request.getParameter("tituloNuev"); 
                listaTareas.editarTitulo(id,titulo);              
                break;
            //Descripcion
            case "des":
                String descripcion = request.getParameter("desNuev"); 
                listaTareas.editarDescripcion(id, descripcion);
                break;
            //Fecha
            case "fec":
                String fechaStr = request.getParameter("fecNuev");

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date fecha = null;

                try {
                    fecha = sdf.parse(fechaStr);
                } catch (ParseException e) {
                    e.printStackTrace(); // Manejo de error en caso de que la fecha no sea válida
                };
                listaTareas.editarFecha(id, fecha);
                break;
        }
        //Serializamos con la informacion nueva        
        Serializacion.escribirArchivo(listaTareas, context);  
        
        //Redirigimos con el usuario
        response.sendRedirect("login.jsp?usuarioI="+nombre);

    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
