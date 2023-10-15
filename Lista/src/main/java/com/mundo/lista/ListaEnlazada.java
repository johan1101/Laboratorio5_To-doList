/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;

/**
 *
 * @author Johan Ordoñez - Maria Casanova - Padilla
 */
public class ListaEnlazada implements Serializable {
    public static NodoTarea primerNodo;
    
     public void agregarTarea(Tareas tarea) {
        NodoTarea nuevoNodo = new NodoTarea(tarea);
        nuevoNodo.siguiente = primerNodo;
        primerNodo = nuevoNodo;
    }

    public void mostrarTareas() {
        NodoTarea actual = primerNodo;

        while (actual != null) {
            Tareas tarea = actual.tarea;
            System.out.println("ID: " + tarea.getId());
            System.out.println("Título: " + tarea.getTitulo());
            System.out.println("Descripción: " + tarea.getDescripcion());
            System.out.println("Fecha de Vencimiento: " + tarea.getFechaVencimiento());
            System.out.println("-----------");
            actual = actual.siguiente;
        }
    }
    
    public static String generarTablaTareas() {
    StringBuilder tablaHTML = new StringBuilder();

    NodoTarea actual = primerNodo;
    while (actual != null) {
        Tareas tarea = actual.tarea;
        tablaHTML.append("<tr>");
        tablaHTML.append("<td>").append(tarea.getId()).append("</td>");
        tablaHTML.append("<td>").append(tarea.getTitulo()).append("</td>");
        tablaHTML.append("<td>").append(tarea.getDescripcion()).append("</td>");
        tablaHTML.append("<td>").append(tarea.getFechaVencimiento()).append("</td>");
         tablaHTML.append("<td><a href=\"#\" class=\"btn btn-outline-success\"><i class=\"fa-solid fa-pen-clip\"></i></a>\n" +
"                                <a href=\"#\" class=\"btn btn-outline-danger\"><i class=\"fa-solid fa-trash\"></i> </a><td>");
        
        tablaHTML.append("</tr>");
        actual = actual.siguiente;
    }

    tablaHTML.append("</table>");
    
    return tablaHTML.toString();
}
}
