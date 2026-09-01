/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.aula02_2_ex3;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class IdadePessoa {
    private int anoAtual;
    private int ano;
    private int idade;

    public int getAnoAtual() {
        return anoAtual;
    }

    public void setAnoAtual(int anoAtual) {
        this.anoAtual = anoAtual;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
    
    public int calcularIdade(){
        setAnoAtual(Integer.parseInt(JOptionPane.showInputDialog("Digite o ano atual: ")));
        
        setAno(Integer.parseInt(JOptionPane.showInputDialog("Digite o ano que voce nasceu: ")));
          setIdade(getAnoAtual()-getAno());
          return getIdade(); 
      
    }
    
    public void mostrarIdade(){
        JOptionPane.showMessageDialog(null, "Voce tem "+getIdade()+" anos");
    }
    
}
