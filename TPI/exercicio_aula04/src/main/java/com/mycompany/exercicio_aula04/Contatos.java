/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exercicio_aula04;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
 

public class Contatos {
    private String name;
    private String telefone;
    private String endereco;
    private String cidade;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }
    
    public void cadastrarContatos(){
Scanner leia = new Scanner(System.in);
        System.out.println("Digite seu nome: ");
        setName(leia.nextLine());
        System.out.println("Digite seu telefone: ");
        setTelefone(leia.nextLine());
        System.out.println("Digite seu endereco: ");
        setEndereco(leia.nextLine());
        System.out.println("Digite sua cidade: ");
        setCidade(leia.next());
}
    
    
}