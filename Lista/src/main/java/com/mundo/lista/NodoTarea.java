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
public class NodoTarea implements Serializable{

    public static Tareas tarea;
    public static NodoTarea siguiente;

    public NodoTarea(Tareas tarea) {
        this.tarea = tarea;
        this.siguiente = null;
    }
}
