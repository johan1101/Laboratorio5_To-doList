/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

/**
 *
 * @author Johan Ordoñez - Maria Casanova - Padilla
 */
public class NodoTarea {

    Tareas tarea;
    NodoTarea siguiente;

    public NodoTarea(Tareas tarea) {
        this.tarea = tarea;
        this.siguiente = null;
    }
}
