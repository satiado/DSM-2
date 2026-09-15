/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.aula_04_exe_02;

import javax.swing.JOptionPane;

/**
 *
 * @author satio daniel
 */
public class Quadrado {
    private double areaQuadrado;
    private double perimetroQuadrado;

    public double getAreaQuadrado() {
        return areaQuadrado;
    }

    public void setAreaQuadrado(double areaQuadrado) {
        this.areaQuadrado = areaQuadrado;
    }

    public double getPerimetroQuadrado() {
        return perimetroQuadrado;
    }

    public void setPerimetroQuadrado(double perimetroQuadrado) {
        this.perimetroQuadrado = perimetroQuadrado;
    }
    
    public double calcularAreaQuadrado(double ladoa){
        setAreaQuadrado(Math.pow(ladoa,2));
        return getAreaQuadrado();
    }
    
    public double calculoPerimetro(double ladoa){
        setPerimetroQuadrado(4 * ladoa);
        return getPerimetroQuadrado();
    }
    
    public void mostrarValores(){
        JOptionPane.showMessageDialog(null, "Area: "+getAreaQuadrado()+"\nPerimetro: "+getPerimetroQuadrado());
    }
}
