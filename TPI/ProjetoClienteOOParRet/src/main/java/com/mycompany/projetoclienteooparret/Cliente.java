/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.projetoclienteooparret;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Cliente {
//atributos
    private String nome;
    private String rg;
    private String endereco;
    private int idade;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
    
    public void cadastrarCliente(String rg){
        setNome(JOptionPane.showInputDialog("Digite o nome: "));
        //rg não é um parâmetro que vem da classe principal
        setRg(rg);
        setEndereco(JOptionPane.showInputDialog("Digite o endereco: "));
        //Conversão para números inteiros Integer.parseInt
        //Convrsão para números reias Double.parseDouble
        setIdade(Integer.parseInt(JOptionPane.showInputDialog("Digite a idade: ")));
        
    }
    public String listarCliente(){
    return "Nome: "+getNome()+"\n"+
            "Endereço: "+getEndereco()+
            "\n RG: " +getRg()+
            "\n Idade: "+getIdade();
    }
    }


