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
 *
 * @author Johan Ordoñez
 */
@WebServlet(name = "SvEliminarEditar", urlPatterns = {"/SvEliminarEditar"})
public class SvEliminarEditar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    Lista listaTareas = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        System.out.println("Corriendo metodo de eliminar");
        
        try {
            listaTareas = Serializacion.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminarEditar.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtiene el nombre del perro a eliminar desde los parámetros de la solicitud
        String idEliminar = request.getParameter("idDel");

        System.out.println(idEliminar);

        int eliminar = Integer.parseInt(idEliminar);

        listaTareas.eliminarTarea(eliminar);

        Serializacion.escribirArchivo(listaTareas, context);

            // Redireccionar a la página de destino
        response.sendRedirect("login.jsp?usuarioI=" + request.getParameter("usuarioI"));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       //Obtener el contexto del servlet
        ServletContext context = getServletContext();
        String nombre = request.getParameter("usuarioI");
        
        try {
            listaTareas = Serializacion.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminarEditar.class.getName()).log(Level.SEVERE, null, ex);
        }
        String edit = request.getParameter("edit");
        int id=Integer.parseInt( request.getParameter("idEd"));
        
        switch(edit){
            case"tit":
                String titulo = request.getParameter("tituloNuev"); 
                listaTareas.editarTitulo(id,titulo);              
                break;
            case "des":
                String descripcion = request.getParameter("desNuev"); 
                listaTareas.editarDescripcion(id, descripcion);
                break;
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
                
        Serializacion.escribirArchivo(listaTareas, context);   
        
        response.sendRedirect("login.jsp?usuarioI="+nombre);

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
