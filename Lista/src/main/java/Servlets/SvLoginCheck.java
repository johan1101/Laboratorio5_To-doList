/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Metodos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jaime
 */
@WebServlet(name = "SvLoginCheck", urlPatterns = {"/SvLoginCheck"})
public class SvLoginCheck extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvLoginCheck</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvLoginCheck at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        int cedula=Integer.parseInt(request.getParameter("cedula"));
        String contrasenia=request.getParameter("contrasenia");
        ServletContext context=getServletContext();
        System.out.println(contrasenia);
        System.out.println(cedula);
       
        String user=Metodos.verificarUsuario(cedula,contrasenia, context);
         System.out.println(user);
        if (user.equals("No encontrado")){
            request.getRequestDispatcher("index.jsp?valido="+"false").forward(request, response);
            
        } else if(!user.equals("No encontrado")){
            
            request.getRequestDispatcher("login.jsp?usuarioI="+user).forward(request, response);
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
