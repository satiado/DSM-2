/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.projetoclienteooparret;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        //INTANCIAR OBJETO clie da classe cliente
        Cliente clie = new Cliente();
        
        
        String rg = JOptionPane.showInputDialog("Digite RG: ");
        clie.cadastrarCliente(rg);
        
        System.out.println(clie.listarCliente());
        JOptionPane.showMessageDialog(null, clie.listarCliente());
    }
}
