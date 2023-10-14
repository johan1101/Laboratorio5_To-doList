/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

/**
 *
 * @author Johan Ordoñez - Maria Casanova - Padilla
 */
public class ListaEnlazada {
    private NodoTarea primerNodo;
    
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
}
