/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exercicio03aula02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
    Passagem pass = new Passagem();

    pass.cadastrarDadosPassageiros();
    pass.cadastrarDadosPassagem();
    
    JOptionPane.showMessageDialog(null, pass.mostrarDadosCliente());
    
    pass.mostrarDadosPassagem();
    }
}
