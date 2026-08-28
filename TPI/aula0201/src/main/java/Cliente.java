/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.util.Scanner;
/**
 *
 * @author fatec-dsm2
 */
public class Cliente {
    private String nome;
    private String endereco;
    private String rg;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }
    
    public void cadastrarCliente(){
        Scanner leia = new Scanner(System.in);
        System.out.println("Digite o nome: ");
        setNome(leia.nextLine());
        System.out.print("Digite o endereco: ");
        setEndereco(leia.nextLine());
        System.out.print("Digite o RG: ");
        setRg(leia.nextLine());
    }
    
    public void listarCliente(){
        System.out.println("Dados Cadastrados");
        System.out.print("Nome: "+getNome()+"\n"+
                "Endereco: "+getEndereco()+"\n"+
                "RG: "+getRg());
    }
    
}
