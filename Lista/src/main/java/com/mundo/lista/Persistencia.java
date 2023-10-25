/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 * Clase para manejar la persistencia en los USUARIOS
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */
public class Persistencia {

    public static void escribirArchivo(ArrayList<Usuarios> misUsuarios, ServletContext context) throws FileNotFoundException {

        // Ubicación del archivo de datos
        String rutaRelativa = "/data/usuariosRegistrados.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (PrintWriter pluma = new PrintWriter(archivo)) {
            // Iterar a través de la lista de usuario y escribir sus datos en el archivo
            for (Usuarios usuario : misUsuarios) {
                // Formatear los datos del alumno en una línea y escribir en el archivo
                String linea = usuario.getCedula() + "," + usuario.getNombreUsuario() + ","
                        + usuario.getContrasena();
                pluma.println(linea);
            }

        } catch (FileNotFoundException e) {
            System.out.println("No se pudo encontrar el archivo de datos.");
        }
    }

    public static void leerArchivo(ArrayList<Usuarios> misUsuarios, ServletContext context) throws FileNotFoundException, IOException {

        // Ubicación del archivo de datos
        String rutaRelativa = "/data/usuariosRegistrados.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileReader fr = new FileReader(archivo); BufferedReader lector = new BufferedReader(fr)) {

            String linea;
            // Leer cada línea del archivo y procesar los datos

            while ((linea = lector.readLine()) != null) {
                String[] datos = linea.split(",");

                String cedula = datos[0].trim();
                String nombre = datos[1].trim();
                String contrasenia = datos[2].trim();

                // Crear un objeto Usuario con los datos leídos y agregarlo a la lista
                Usuarios usuario = new Usuarios(Integer.parseInt(cedula), nombre, contrasenia);
                misUsuarios.add(usuario);
            }

        } catch (FileNotFoundException e) {
            System.out.println("No se pudo encontrar el archivo de datos.");
        } catch (IOException e) {
            System.out.println("Error durante la lectura del archivo.");
        }
    }

}
