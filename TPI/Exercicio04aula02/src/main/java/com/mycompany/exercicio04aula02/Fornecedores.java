/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exercicio04aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Fornecedores {
    private String nomeFornecedor;
    private String nomeProduto;
    private String descricaoProduto;

    public String getNomeFornecedor() {
        return nomeFornecedor;
    }

    public void setNomeFornecedor(String nomeFornecedor) {
        this.nomeFornecedor = nomeFornecedor;
    }

    public String getNomeProduto() {
        return nomeProduto;
    }

    public void setNomeProduto(String nomeProduto) {
        this.nomeProduto = nomeProduto;
    }

    public String getDescricaoProduto() {
        return descricaoProduto;
    }

    public void setDescricaoProduto(String descricaoProduto) {
        this.descricaoProduto = descricaoProduto;
    }
    
    public void cadastrarFornecedor(){
    setNomeFornecedor(JOptionPane.showInputDialog("Digite o nome: "));
    setNomeProduto(JOptionPane.showInputDialog("Digite o nome do produto: "));
    setDescricaoProduto(JOptionPane.showInputDialog("Digite a descrição: "));
    }
    
    public String listarFornecedor(){
    return "Nome: "+getNomeFornecedor()+
            "\n Produto: "+getNomeProduto()+
            "\n Descrição: "+getDescricaoProduto();
    }
    
    
}
