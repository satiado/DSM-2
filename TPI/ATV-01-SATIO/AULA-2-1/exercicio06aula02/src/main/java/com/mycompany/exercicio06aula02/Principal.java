/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exercicio06aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        Loja lo = new Loja();
        lo.inserirDadosLoja();
        
        JOptionPane.showMessageDialog(null, lo.mostrarDadosLoja());
    }
}
