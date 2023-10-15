/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;

/**
 *
 * @author
 */
public class Lista implements Serializable{

    private Nodo cabeza;

    private class Nodo implements Serializable{

        public Tareas tarea;
        public Nodo siguiente = null;

        public Nodo(Tareas tarea) {
            this.tarea = tarea;
        }
    }

    public void insertarPrincipio(Tareas tarea) {
        Nodo nodo = new Nodo(tarea);
        nodo.siguiente = cabeza;
        cabeza = nodo;
    }

    public void mostrarTareas() {
        Nodo actual = cabeza;

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

    public String generarTabla() {
        StringBuilder tablaHTML = new StringBuilder();
        Nodo actual = cabeza;

        while (actual != null) {
            Tareas tarea = actual.tarea;
            tablaHTML.append("<tr>");
            tablaHTML.append("<td>").append(tarea.getId()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getTitulo()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getDescripcion()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getFechaVencimiento()).append("</td>");

            // Botones
            tablaHTML.append("<td><a href=\"#\" class=\"btn btn-outline-success\"><i class=\"fa-solid fa-pen-clip\"></i></a>");
            tablaHTML.append("<a href=\"#\" class=\"btn btn-outline-danger\"><i class=\"fa-solid fa-trash\"></i></a></td>");

            tablaHTML.append("</tr>");
            actual = actual.siguiente;
        }
        tablaHTML.append("</table>");  // Cierra la tabla

        return tablaHTML.toString();
    }

}
