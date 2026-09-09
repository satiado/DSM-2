/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_03_exe_02;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        Vendedor vend = new Vendedor();
        
        int op;
        do {
            op = Integer.parseInt(JOptionPane.showInputDialog("Digite a opcao: \n 1- Nome \n 2- Salario Base \n 3- Valor Vendido \n 4- Calcular Comissao \n 0- Sair "));

            switch(op){
                case 1:
                    vend.entrarNome();
                    break;
                case 2:
                    vend.salarioBase();
                    break;
                case 3:
                    vend.entrarValorVendido();
                    break;
                case 4:
                    JOptionPane.showMessageDialog(null, "O vendedor "+vend.getNome()+" teve salario final de "+vend.calculoComissao());
                    break;
                case 0: 
                    JOptionPane.showMessageDialog(null, "Saindo do sistema");
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Opcao invalida!");
            }
            
        }while(op != 0);
    }
}
