/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author jaime
 */
public class Metodos {
    
    
    public static String verificarUsuario(int cedulaV, String contraseñaV, ServletContext context) throws IOException{
        ArrayList<Usuarios> misUsuarios = new ArrayList<>();

        Persistencia.leerArchivo(misUsuarios, context);
        
        for (Usuarios u: misUsuarios){
            if (u.getCedula()==cedulaV && u.getContrasena().equals(contraseñaV)){
                return u.getNombreUsuario();
            }
        }
        return "No encontrado";
    }
    
}
