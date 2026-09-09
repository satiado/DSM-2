/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.mavenproject2;

import javax.swing.JOptionPane;

/**
 *
 * @author Suporte
 */
public class Combustivel {
    private double litros;
    private double totalGasto;
    private double km;
    private double valorComb;

    public double getLitros() {
        return litros;
    }

    public void setLitros(double litros) {
        this.litros = litros;
    }

    public double getTotalGasto() {
        return totalGasto;
    }

    public void setTotalGasto(double totalGasto) {
        this.totalGasto = totalGasto;
    }

    public double getKm() {
        return km;
    }

    public void setKm(double km) {
        this.km = km;
    }

    public double getValorComb() {
        return valorComb;
    }

    public void setValorComb(double valorComb) {
        this.valorComb = valorComb;
    }
    public void calcularLitrosAlcool(double km){
        setLitros((km / 12));
        JOptionPane.showMessageDialog(null,"KM por litro: " +getLitros());
    }
    public void calcularLitrosGasolina(double km){
        setLitros((km / 15));
        JOptionPane.showMessageDialog(null,"KM por litro: " +getLitros());
    }
    public double calcularTotalGasto(double valorComb){
        setTotalGasto((this.getLitros() * valorComb));
        JOptionPane.showMessageDialog(null, "Valor total: " +getTotalGasto());
        return getTotalGasto();
    }
}
