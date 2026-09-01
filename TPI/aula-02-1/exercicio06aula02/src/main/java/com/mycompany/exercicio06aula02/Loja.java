/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.exercicio06aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Loja {
    
    private String razaoSocial;
    private String cpfCliente;
    private double valorCompra;
    private int qtdItensComp ;
    private double valorTotalCompra;

    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    public String getCpfCliente() {
        return cpfCliente;
    }

    public void setCpfCliente(String cpfCliente) {
        this.cpfCliente = cpfCliente;
    }

    public double getValorCompra() {
        return valorCompra;
    }

    public void setValorCompra(double valorCompra) {
        this.valorCompra = valorCompra;
    }

    public int getQtdItensComp() {
        return qtdItensComp;
    }

    public void setQtdItensComp(int qtdItensComp) {
        this.qtdItensComp = qtdItensComp;
    }

    public double getValorTotalCompra() {
        return valorTotalCompra;
    }

    public void setValorTotalCompra(double valorTotalCompra) {
        this.valorTotalCompra = valorTotalCompra;
    }
    
    public void inserirDadosLoja(){
        setRazaoSocial(JOptionPane.showInputDialog("Nome da empresa: "));
        setCpfCliente(JOptionPane.showInputDialog("CPF do cliente: "));
        setValorCompra(Double.parseDouble(JOptionPane.showInputDialog("Valor da compra: ")));
        setQtdItensComp(Integer.parseInt(JOptionPane.showInputDialog("Quantidade de itens: ")));
    }
    
    public double calcularCompraLoja(){
        return getValorCompra() * getQtdItensComp();
    } 
    
    public String mostrarDadosLoja(){
        return "Nome: "+ getRazaoSocial()+
                "\n CPF cliente: "+getCpfCliente()+
                "\n Valor: "+getValorCompra()+
                "\n Quantidade: "+ getQtdItensComp()+
                "\n Valor Total: "+calcularCompraLoja();
    }
    
}
