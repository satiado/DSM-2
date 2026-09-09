/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.projetocalculadoraoo;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Calculadora {
    private double num1;
    private double num2;
    private double resul;

    public double getNum1() {
        return num1;
    }

    public void setNum1(double num1) {
        this.num1 = num1;
    }

    public double getNum2() {
        return num2;
    }

    public void setNum2(double num2) {
        this.num2 = num2;
    }

    public double getResul() {
        return resul;
    }

    public void setResul(double resul) {
        this.resul = resul;
    }
    
    //método sem parâmeto e sem retorno 
    public void somar(){
        setNum1(Double.parseDouble(JOptionPane.showInputDialog("Digite um numero: ")));
        setNum2(Double.parseDouble(JOptionPane.showInputDialog("Digite outro numero: ")));
        setResul(getNum1() + getNum2());
        JOptionPane.showMessageDialog(null, "O valor da soma e "+ getResul());
    }
    
    //Método com parâmetro e sem retorno 
    public void subtrair(double a, double b){
        setResul(a - b);
        JOptionPane.showMessageDialog(null, "O valor da subtracao e "+getResul());
    }
    
    //Método com retorno e sem parâmetro
    public double multiplicar(){
        setNum1(Double.parseDouble(JOptionPane.showInputDialog("Digite um numero: ")));
        setNum2(Double.parseDouble(JOptionPane.showInputDialog("Digite outro numero: ")));
        setResul(getNum1() * getNum2());
        return getResul();
    }
    
    //Método com retorno e com parâmetro
    public double dividir(double a, double b){
        setResul(a / b);
        return getResul();
    }
    
}
