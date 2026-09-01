/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exercicio04aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        Fornecedores forn = new Fornecedores();
        forn.cadastrarFornecedor();
        
        JOptionPane.showMessageDialog(null, forn.listarFornecedor());
    }
}
