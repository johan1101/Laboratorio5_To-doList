/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;
import java.util.Date;

/**
 * Clase Tareas 
 * @author Johan Ordoñez - Maria Casanova - Padilla
 */
public class Tareas implements Serializable {
    //Atributos
    private int id;
    private String titulo;
    private String descripcion;
    private Date fechaVencimiento;
    
    //Constructor
    public Tareas(int id, String titulo, String descripcion, Date fechaVencimiento) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaVencimiento = fechaVencimiento;
    }
    //Constructor vacio
    public Tareas() {
    }
    /**
     * GETTER
     * @return 
     */
    public int getId() {
        return id;
    }

    public String getTitulo() {
        return titulo;
    }
    
    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }
    
    public String getDescripcion() {
        return descripcion;
    }
    
    /**
     * SETTER
     * @param titulo 
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
}
