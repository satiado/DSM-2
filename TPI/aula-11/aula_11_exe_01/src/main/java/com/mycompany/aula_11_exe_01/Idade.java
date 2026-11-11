/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.aula_11_exe_01;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Idade {
    
    private int anoAtual;
    private int anoNasc;
    private int idade;
    private String nome;

    public int getAnoAtual() {
        return anoAtual;
    }

    public void setAnoAtual(int anoAtual) {
        this.anoAtual = anoAtual;
    }

    public int getAnoNasc() {
        return anoNasc;
    }

    public void setAnoNasc(int anoNasc) {
        this.anoNasc = anoNasc;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
    
    public void cadastrarDados(){
        setNome(JOptionPane.showInputDialog(null,"Digite seu nome: "));
        setAnoNasc(Integer.parseInt(JOptionPane.showInputDialog(null,"Digite sua data de nascimento: ")));
        setAnoAtual(Integer.parseInt(JOptionPane.showInputDialog(null,"Digite o ano atual: ")));
    }
    
    public void calcularIdade(){
        setIdade(getAnoAtual() - getAnoNasc());
    }
    
    public void mostrarDados(){
        JOptionPane.showMessageDialog(null, "Nome: "+getNome()+ "\nAno Atual: "+getAnoAtual()+"\nAno de Nascimento: "+getAnoNasc()+"\nIdade: "+getIdade());
    }
    
}
