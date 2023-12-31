
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 * Clase de metodos 
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */

public class Metodos {
    
    /**
     * Metodo para verificar el usuario en login
     * @param cedulaV
     * @param contraseñaV
     * @param context
     * @return
     * @throws IOException 
     */
    public static String verificarUsuario(int cedulaV, String contraseñaV, ServletContext context) throws IOException{
        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); //Creamos array que se llenara con el txt

        Persistencia.leerArchivo(misUsuarios, context); //Llenamos el array con el txt
        
        for (Usuarios u: misUsuarios){ //Recorremos el array 
            //En caso de hallar coincidencias de cedula y contraseña en un mismo objeto
            if (u.getCedula()==cedulaV && u.getContrasena().equals(contraseñaV)){
                return u.getNombreUsuario(); //Se envia el nombre
            }
        }
        return "No encontrado"; //Si no se encontró coincidencias se envia el no encontrado.
    }
    /**
     * Metodo para encontrar cedulas iguales
     * @param cedulaV
     * @param context
     * @return
     * @throws IOException 
     */
    public static boolean encontrarUsuariosIg(int cedulaV, ServletContext context) throws IOException{
        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); //Creamos array que se llenara con el txt

        Persistencia.leerArchivo(misUsuarios, context); //Llenamos el array con el txt;
        
        for (Usuarios u: misUsuarios){ //Recorremos el array
             //En caso de hallar una cedula igual
            if (u.getCedula()==cedulaV){
                return false; //Se devuelve false
            }
        }
        return true; //Si no se encontró coincidencias se envia true.
    }
    /**
     * Metodo para listar tareas
     * @param id
     * @param context
     */
   public static String listarTareas (String id, ServletContext context, HttpServletRequest request) throws IOException, ClassNotFoundException{
       //Llenamos la lista con la informacion del archivo
       Lista listaTareas = Serializacion.leerTareas(context);
       //En caso de estar vacia se crea una
        if (listaTareas == null) {
             listaTareas = new Lista();
        }
       String tabla="";//Variable que contiene la tabla
       
       if (id == null){//Cuando no se debe buscar nada
           tabla=listaTareas.generarTabla();
       }
       else if(id != null){//En caso de buscar
           tabla=listaTareas.generarTablaBusqueda(id, request);
    }

       return tabla;//Se devuelve la tabla
   }
    
}
