/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Lista;
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
 *
 * @author maria
 */
@WebServlet(name = "SvAnadirBuscar", urlPatterns = {"/SvAnadirBuscar"})
public class SvAnadirBuscar extends HttpServlet {
    Lista listaTareas = new Lista();

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
                String nombre = request.getParameter("usuarioI");
        
        //Obtener el contexto del servlet
        ServletContext context = getServletContext();
        try {
            listaTareas = Serializacion.leerTareas(context);
            if(listaTareas == null){
                listaTareas = new Lista();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLoginCheck.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Recibir los parámetros del formulario
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fechaStr = request.getParameter("fecha");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        String ubicar=request.getParameter("opcion");
        String idUbi=request.getParameter("idEd");
        String idUbi2=request.getParameter("idEd2");
        
        try {
            fecha = sdf.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace(); // Manejo de error en caso de que la fecha no sea válida
        };
        
        String an="";
        
        if(!listaTareas.existenId(id)){
            Tareas nuevaTarea = new Tareas(id, titulo, descripcion, fecha);
            switch(ubicar){
                case "prin":
                    listaTareas.insertarPrincipio(nuevaTarea);
                    an="si";
                    break;
                case "ant":
                    if(!idUbi.equals("")){
                       listaTareas.insertarAntesDe(Integer.parseInt(idUbi), nuevaTarea);
                        an="si"; 
                    } else{
                        an="no";
                    }
                    break;
                case "fin":
                    listaTareas.insertarFinal(nuevaTarea);
                    an="si";
                    break;
                case "desp":
                    if(!idUbi2.equals("")){
                       listaTareas.insertarDespuesDe(Integer.parseInt(idUbi2), nuevaTarea);
                        an="si"; 
                    } else{
                        an="no";
                    }
                    break;
                    
            }
            Serializacion.escribirArchivo(listaTareas, context);
            
            listaTareas.mostrarTareas();
            
        } else {
            an="no";
        }


        // Redireccionar a la página de destino internamente en el servidor
            // Redireccionar a la página de destino
        request.setAttribute("add", an);    
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
