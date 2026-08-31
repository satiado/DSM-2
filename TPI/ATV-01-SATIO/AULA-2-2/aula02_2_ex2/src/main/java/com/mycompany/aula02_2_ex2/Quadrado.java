/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.aula02_2_ex2;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Quadrado {
    private double numero;
    private double resultado;

    public double getNumero() {
        return numero;
    }

    public void setNumero(double numero) {
        this.numero = numero;
    }

    public double getResultado() {
        return resultado;
    }

    public void setResultado(double resultado) {
        this.resultado = resultado;
    }
    
    public double calcularquadrado(){
        setNumero(Double.parseDouble(JOptionPane.showInputDialog("Digite um numero: ")));
        return getNumero();
    }
    
    public void mostrarQuadrado(){
        setResultado(Math.pow(numero,2));
        JOptionPane.showMessageDialog(null,"O "+getNumero()+ " ao quadrado e "+getResultado());
    }
    
}
