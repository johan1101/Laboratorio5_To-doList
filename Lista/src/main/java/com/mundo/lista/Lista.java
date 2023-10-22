/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author
 */
public class Lista implements Serializable {

    private Nodo cabeza;

    private class Nodo implements Serializable {

        public Tareas tarea;
        public Nodo siguiente = null;

        public Nodo(Tareas tarea) {
            this.tarea = tarea;
        }
    }
    
        //------------------------------------

    public void insertarPrincipio(Tareas tarea) {
        Nodo nodo = new Nodo(tarea);
        nodo.siguiente = cabeza;
        cabeza = nodo;
    }
    
        //------------------------------------

    public void insertarFinal(Tareas tarea) {
        Nodo nodo = new Nodo(tarea);
        if (cabeza == null) {
            cabeza = nodo;  // Si la lista está vacía, el nuevo nodo se convierte en la cabeza
        } else {
            Nodo actual = cabeza;
            while (actual.siguiente != null) {
                actual = actual.siguiente;
            }
            actual.siguiente = nodo;  // Agregar el nuevo nodo al final de la lista
        }
    }
    
        //------------------------------------

    public void insertarDespuesDe(int idAnterior, Tareas nuevaTarea) {
        Nodo nuevoNodo = new Nodo(nuevaTarea);
        Nodo actual = cabeza;

        while (actual != null) {
            if (actual.tarea.getId() == idAnterior) {
                nuevoNodo.siguiente = actual.siguiente;
                actual.siguiente = nuevoNodo;
                return;  // Terminar después de insertar la nueva tarea
            }
            actual = actual.siguiente;
        }
    }
   
    //------------------------------------

    public void insertarAntesDe(int idAnterior, Tareas nuevaTarea) {
        Nodo nuevoNodo = new Nodo(nuevaTarea);

        if (cabeza == null) {
            // Si la lista está vacía, simplemente inserta la nueva tarea como la cabeza
            cabeza = nuevoNodo;
            return;
        }

        
        if (cabeza.tarea.getId() == idAnterior) {
            // Si la cabeza de la lista tiene el ID anterior, ajusta la cabeza
            nuevoNodo.siguiente = cabeza;
            cabeza = nuevoNodo;
            return;
        }

        Nodo anterior = cabeza;
        Nodo actual = cabeza.siguiente;

        while (actual != null) {
            if (actual.tarea.getId() == idAnterior) {
                // Inserta la nueva tarea antes de la tarea con el ID especificado
                anterior.siguiente = nuevoNodo;
                nuevoNodo.siguiente = actual;
                return;
            }
            anterior = actual;
            actual = actual.siguiente;
        }
    }
    
        //------------------------------------

    public int longitud() {
        Nodo actual = cabeza;
        int longitud = 0;
        while (actual != null) {
            Tareas tarea = actual.tarea;
            longitud = longitud + 1;
            actual = actual.siguiente;
        }
        return longitud;
    }

    public void eliminarTarea(int id) {
        if (cabeza != null) {
            // Caso especial: eliminación del primer elemento
            if (cabeza.tarea.getId() == id) {
                Nodo primer = cabeza;
                cabeza = cabeza.siguiente;
                primer.siguiente = null;
                return;  // Tarea eliminada, salimos del método
            }

            Nodo anterior = cabeza;
            Nodo actual = cabeza.siguiente;

            while (actual != null) {
                if (actual.tarea.getId() == id) {
                    // Encontramos la tarea a eliminar
                    anterior.siguiente = actual.siguiente;
                    actual.siguiente = null;
                    return;  // Tarea eliminada, salimos del método
                }
                anterior = actual;
                actual = actual.siguiente;
            }
        }
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
           tablaHTML.append("<td><a href=\"#\" type=\"button\" class=\"btn btn-outline-success\" data-bs-toggle=\"modal\" data-bs-target=\"#editar\" data-nombre=\"" + tarea.getId() + "\"><i class=\"fa-solid fa-pen-clip\"></i></a>");
           tablaHTML.append("<a href=\"#\" type=\"button\" class=\"btn btn-outline-danger\" data-bs-toggle=\"modal\" data-bs-target=\"#eliminar\" data-nombre=\"" + tarea.getId() + "\"><i class=\"fa-solid fa-trash\"></i></a></td>");

            tablaHTML.append("</tr>");
            actual = actual.siguiente;
        }
        tablaHTML.append("</table>");  // Cierra la tabla

        return tablaHTML.toString();
    }

    public boolean existenId(int id) {
        Nodo actual = cabeza;
        boolean encontrado = false;
        while (actual != null && !encontrado) {

            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {
                encontrado = true;
            }

            actual = actual.siguiente;
        }

        return encontrado;
    }
    public void editarTitulo(int id, String titulo) {
         Nodo actual = cabeza;
        boolean encontrado = false;
        while (actual != null && !encontrado) {

            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {
                tarea.setTitulo(titulo);
                encontrado = true;
            }

            actual = actual.siguiente;
        }

    }
    public void editarDescripcion(int id, String descripcion) {
         Nodo actual = cabeza;
        boolean encontrado = false;
        while (actual != null && !encontrado) {

            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {
                tarea.setDescripcion(descripcion);
                encontrado = true;
            }

            actual = actual.siguiente;
        }

    }
    public void editarFecha(int id, Date fecha) {
         Nodo actual = cabeza;
        boolean encontrado = false;
        while (actual != null && !encontrado) {

            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {
                tarea.setFechaVencimiento(fecha);
                encontrado = true;
            }

            actual = actual.siguiente;
        }

    }

}
