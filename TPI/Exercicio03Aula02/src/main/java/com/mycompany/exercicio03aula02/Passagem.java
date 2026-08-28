/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exercicio03aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Passagem {
    private String nomePassageiro;
    private String telefone;
    private String rg;
    private String localViagem;
    private String data;
    private String horario;
    private String numPoltrona;

    public String getNomePassageiro() {
        return nomePassageiro;
    }

    public void setNomePassageiro(String nomePassageiro) {
        this.nomePassageiro = nomePassageiro;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getLocalViagem() {
        return localViagem;
    }

    public void setLocalViagem(String localViagem) {
        this.localViagem = localViagem;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getNumPoltrona() {
        return numPoltrona;
    }

    public void setNumPoltrona(String numPorltrona) {
        this.numPoltrona = numPorltrona;
    }
    
    public void cadastrarDadosPassageiros(){
        setNomePassageiro(JOptionPane.showInputDialog("Digite o nome: "));
        setTelefone(JOptionPane.showInputDialog("Digite o telefone: "));
        setRg(JOptionPane.showInputDialog("Digite o RG: "));
    }   
    
    public void cadastrarDadosPassagem(){
        setLocalViagem(JOptionPane.showInputDialog("Digite o seu destino: "));
        setData(JOptionPane.showInputDialog("Digite a data: "));
        setHorario(JOptionPane.showInputDialog("Digite a hora: "));
        setNumPoltrona(JOptionPane.showInputDialog("Digite o número da poltrona: "));
        
    }
    
    public String mostrarDadosCliente(){
        return "Nome: "+getNomePassageiro()+
                "\n Telefone: "+ getTelefone()+
                "\n RG: "+getRg();
    }
    
    public void mostrarDadosPassagem(){
    JOptionPane.showMessageDialog(null, "Local da viagem: "+getLocalViagem()+
            "\n Data: "+getData()+
            "\n Horário: "+getHorario()+
            "\n Número da poltrona: "+getNumPoltrona());
    }
    
}
