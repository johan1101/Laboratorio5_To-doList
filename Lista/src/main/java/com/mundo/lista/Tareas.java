/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.util.Date;

/**
 *
 * @author Johan Ordoñez - Maria Casanova - Padilla
 */
public class Tareas {
    private int id;
    private String titulo;
    private String descripcion;
    private Date fechaVencimiento;

    public Tareas(int id, String titulo, String descripcion, Date fechaVencimiento) {
        this.id = id;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fechaVencimiento = fechaVencimiento;
    }

    public Tareas() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(Date fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }
    
    
}
