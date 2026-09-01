/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exercicio02aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Dobro {
    private double num;
    private double calculo;

    public double getNum() {
        return num;
    }

    public void setNum(double num) {
        this.num = num;
    }

    public double getCalculo() {
        return calculo;
    }

    public void setCalculo(double calculo) {
        this.calculo = calculo;
    }
    
    public void calcDobro(){
    setNum(Double.parseDouble(JOptionPane.showInputDialog("Digite um número: ")));
    setCalculo(getNum()*2);
    JOptionPane.showMessageDialog(null,"O dobro de "+getNum()+" é "+getCalculo());
    }
   
    
}
