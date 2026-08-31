/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exercicio05aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        Produto prod = new Produto();
        prod.cadastrarProduto();
        
        JOptionPane.showMessageDialog(null, prod.calcularTotal());
    }
}
