/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

/**
 * Clase lista enlazada
 *
 * @author Johan Ordoñez - Maria Casanova - Cristhian Padilla
 */
public class Lista implements Serializable {

    //Atributos
    private Nodo cabeza;//Nodo cabeza

    /**
     * Clase Nodo
     */
    private class Nodo implements Serializable {

        public Tareas tarea;
        public Nodo siguiente = null;//Apunta al siguiente

        //Constructor
        public Nodo(Tareas tarea) {
            this.tarea = tarea;
        }
    }

    //------------------------------------
    /**
     * Metodo insertar nodo al principio
     *
     * @param tarea
     */
    public void insertarPrincipio(Tareas tarea) {
        Nodo nodo = new Nodo(tarea);
        nodo.siguiente = cabeza;
        cabeza = nodo;
    }

    //------------------------------------
    /**
     * Metodo insertar nodo al final
     *
     * @param tarea
     */
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
    /**
     * Metodo insertar despues de
     *
     * @param idAnterior
     * @param nuevaTarea
     */
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
    /**
     * Metodo insertar antes de
     *
     * @param idAnterior
     * @param nuevaTarea
     */
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
    /**
     * Metodo concer la longitud de la lista
     *
     * @return
     */
    public int longitud() {
        Nodo actual = cabeza;
        int longitud = 0;//Cantidad
        //Se recorre
        while (actual != null) {
            Tareas tarea = actual.tarea;
            longitud = longitud + 1;
            actual = actual.siguiente;
        }
        return longitud;//Se regresa la longitud
    }

    /**
     * Metodo eliminar tarea
     *
     * @param id
     */
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

    /**
     * Metodo mostrar las tareas
     */
    public void mostrarTareas() {
        Nodo actual = cabeza;
        //Se recorre la lista
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

    /**
     * Metodo generar la tabla con la lista
     *
     * @return
     */
    public String generarTabla() {
        StringBuilder tablaHTML = new StringBuilder();
        Nodo actual = cabeza;
        //Si el primero no es nulo
        if (actual != null) {
            //Se recorre la lista
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
        }

        tablaHTML.append("</table>");  // Cierra la tabla

        return tablaHTML.toString();//Se manda la tabla creada
    }

    /**
     * Verificar si existen con el mismo id
     *
     * @param id
     * @return
     */
    public boolean existenId(int id) {
        Nodo actual = cabeza;
        boolean encontrado = false;//Bandera
        while (actual != null && !encontrado) {
            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {//Al encontrar la tarea
                encontrado = true;//Finaliza ciclo
            }
            actual = actual.siguiente;//Continua recorriendo
        }
        return encontrado;//Envia bandera
    }

    /**
     * Editar titulo tarea
     *
     * @param id
     * @param titulo
     */
    public void editarTitulo(int id, String titulo) {
        Nodo actual = cabeza;
        boolean encontrado = false;//Bandera
        while (actual != null && !encontrado) {
            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {//Al encontrar la tarea
                tarea.setTitulo(titulo);//Cambia el titulo
                encontrado = true;//Finaliza ciclo
            }
            actual = actual.siguiente;//Continua recorriendo
        }
    }

    /**
     * Editar descripcion tarea
     *
     * @param id
     * @param descripcion
     */
    public void editarDescripcion(int id, String descripcion) {
        Nodo actual = cabeza;
        boolean encontrado = false;//Bandera
        while (actual != null && !encontrado) {
            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) {//Al encontrar la tarea
                tarea.setDescripcion(descripcion);//Cambia la descripcion
                encontrado = true;//Finaliza ciclo
            }
            actual = actual.siguiente;//Continua recorriendo
        }
    }

    /**
     * Editar fecha tarea
     *
     * @param id
     * @param fecha
     */
    public void editarFecha(int id, Date fecha) {
        Nodo actual = cabeza;
        boolean encontrado = false;//Bandera
        while (actual != null && !encontrado) {
            Tareas tarea = actual.tarea;
            if (tarea.getId() == id) { //Al encontrar la tarea
                tarea.setFechaVencimiento(fecha);//Cambia fecha
                encontrado = true;//Finaliza ciclo
            }
            actual = actual.siguiente;//Continua recorriendo
        }
    }

    /**
     * Generar tabla con el termino de busqueda
     *
     * @param terminoBusqueda
     * @return
     */
    public String generarTablaBusqueda(String terminoBusqueda, HttpServletRequest request) {
        StringBuilder tablaHTML = new StringBuilder();//Creamos tabla

        Nodo actual = cabeza;

        String usuario = request.getParameter("usuarioI");

        boolean hayT = verificar();

        boolean encontrado = false;//Bandera para mostrar mensaje de no encontrado al usuario

        if (actual != null && terminoBusqueda != null && !terminoBusqueda.isEmpty() && hayT == true) { //Verificar condiciones

            while (actual != null) { //Recorrer lista
                Tareas tarea = actual.tarea;

                // Comprueba si la tarea coincide con el término de búsqueda
                if (tarea.getId() == Integer.parseInt(terminoBusqueda)) {
                    tablaHTML.append("<tr>");
                    tablaHTML.append("<td>").append(tarea.getId()).append("</td>");
                    tablaHTML.append("<td>").append(tarea.getTitulo()).append("</td>");
                    tablaHTML.append("<td>").append(tarea.getDescripcion()).append("</td>");
                    tablaHTML.append("<td>").append(tarea.getFechaVencimiento()).append("</td>");

                    // Botones
                    tablaHTML.append("<td><a href=\"#\" type=\"button\" class=\"btn btn-outline-success\" data-bs-toggle=\"modal\" data-bs-target=\"#editar\" data-nombre=\"" + tarea.getId() + "\"><i class=\"fa-solid fa-pen-clip\"></i></a>");
                    tablaHTML.append("<a href=\"#\" type=\"button\" class=\"btn btn-outline-danger\" data-bs-toggle=\"modal\" data-bs-target=\"#eliminar\" data-nombre=\"" + tarea.getId() + "\"><i class=\"fa-solid fa-trash\"></i></a></td>");

                    tablaHTML.append("</tr>");
                    tablaHTML.append("<tr>");
                    tablaHTML.append("<td colspan='6' align='center' valign='middle'><a href=\"login.jsp?usuarioI=" + usuario + "\" class=\"btn\" style=\"background-color: #512da8; color: #ffffff;\">Lista completa</a></td>");

                    tablaHTML.append("</tr>");
                    encontrado = true;
                }

                actual = actual.siguiente;
            }

            if (encontrado == false) {
                tablaHTML.append("<tr>");
                tablaHTML.append("<td colspan='6' align='center' valign='middle'>").append("No se encontró una tarea con ese ID").append("</td>");

                tablaHTML.append("</tr>");

                tablaHTML.append("<tr>");
                tablaHTML.append("<td colspan='6' align='center' valign='middle'><a href=\"login.jsp?usuarioI=" + usuario + "\" class=\"btn\" style=\"background-color: #512da8; color: #ffffff;\">Lista completa</a></td>");

                tablaHTML.append("</tr>");

            }
        }

        tablaHTML.append("</table>");  // Cierra la tabla

        return tablaHTML.toString(); //Se devuelve la tabla
    }

    /**
     * Metodo para ver si hay tareas
     *
     * @return
     */
    public boolean verificar() {
        Nodo actual = cabeza;
        //En caso que el primero no este nulo se manda true
        if (actual != null) {
            return true;
        }
        return false;//Return false si nunca entro al condicional
    }

}
