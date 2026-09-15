/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.aula_04_exe_03;

import javax.swing.JOptionPane;

/**
 *
 * @author satio daniel
 */
public class Eleitores {
    private int numeroTotalEleitores;
    private int numeroVotosBrancos;
    private int numeroVotosNulos;
    private int numeroVotosValidos;
    private double percBrancos;
    private double percNulo;
    private double percValidos;

    public int getNumeroTotalEleitores() {
        return numeroTotalEleitores;
    }

    public void setNumeroTotalEleitores(int numeroTotalEleitores) {
        this.numeroTotalEleitores = numeroTotalEleitores;
    }

    public int getNumeroVotosBrancos() {
        return numeroVotosBrancos;
    }

    public void setNumeroVotosBrancos(int numeroVotosBrancos) {
        this.numeroVotosBrancos = numeroVotosBrancos;
    }

    public int getNumeroVotosNulos() {
        return numeroVotosNulos;
    }

    public void setNumeroVotosNulos(int numeroVotosNulos) {
        this.numeroVotosNulos = numeroVotosNulos;
    }

    public int getNumeroVotosValidos() {
        return numeroVotosValidos;
    }

    public void setNumeroVotosValidos(int numeroVotosValidos) {
        this.numeroVotosValidos = numeroVotosValidos;
    }

    public double getPercBrancos() {
        return percBrancos;
    }

    public void setPercBrancos(double percBrancos) {
        this.percBrancos = percBrancos;
    }

    public double getPercNulo() {
        return percNulo;
    }

    public void setPercNulo(double percNulo) {
        this.percNulo = percNulo;
    }

    public double getPercValidos() {
        return percValidos;
    }

    public void setPercValidos(double percValidos) {
        this.percValidos = percValidos;
    }
    
    public void inserirQtdVotos(){
        setNumeroVotosBrancos(Integer.parseInt(JOptionPane.showInputDialog("Digite os votos brancos: ")));
        setNumeroVotosNulos(Integer.parseInt(JOptionPane.showInputDialog("Digite os votos nulos: ")));
        setNumeroVotosValidos(Integer.parseInt(JOptionPane.showInputDialog("Digite os votos Validos: ")));
    }   
    
    public void calcularTotalEleitores(){
        setNumeroTotalEleitores(getNumeroVotosBrancos() + getNumeroVotosNulos() + getNumeroVotosValidos());
    }
    
    public void calcularPercentualVotos(){
        setPercBrancos((getNumeroVotosBrancos()*100)/getNumeroTotalEleitores());
        setPercNulo((getNumeroVotosNulos()*100)/getNumeroTotalEleitores());
        setPercValidos((getNumeroVotosValidos()*100)/getNumeroTotalEleitores());
        JOptionPane.showMessageDialog(null, "Total votos: "+getNumeroTotalEleitores()+"\nVotos brancos: "+getPercBrancos()+"\nVotos nulos: "+getPercNulo()+"\nVotos validos: "+getPercValidos());
    }
    
}
