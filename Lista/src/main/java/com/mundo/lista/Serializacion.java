/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import javax.servlet.ServletContext;

/**
 *
 * @author Johan Ordoñez
 */
public class Serializacion {

    public static void escribirArchivo(ListaEnlazada listaTareas, ServletContext context) throws FileNotFoundException, IOException {
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/tareasAgregadas.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileOutputStream fos = new FileOutputStream(archivo); 
                ObjectOutputStream oos = new ObjectOutputStream(fos)) {
            // Serializar y escribir la lista enlazada en el archivo
            oos.writeObject(listaTareas);
        } catch (IOException e) {
            System.out.println("Error al escribir el archivo de datos.");
        }
    }

    public static ListaEnlazada  leerTareas(ServletContext context) throws IOException, ClassNotFoundException {
        ListaEnlazada listaTareas = null;
        // Ruta relativa y absoluta del archivo de datos serializados
        String rutaRelativa = "/data/tareasAgregadas.ser";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileInputStream fis = new FileInputStream(archivo); ObjectInputStream ois = new ObjectInputStream(fis)) {
            // Leer y deserializar la lista enlazada desde el archivo
            listaTareas = (ListaEnlazada) ois.readObject();
        } catch (IOException e) {
            System.out.println("Error al leer el archivo de datos.");
        }
        System.out.println(listaTareas);
        return listaTareas;
    }
}
