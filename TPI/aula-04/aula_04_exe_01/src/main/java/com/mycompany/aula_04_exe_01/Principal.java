/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_04_exe_01;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        CustoPiso piso = new CustoPiso();
        
        int op;
        
        do{
            op = Integer.parseInt(JOptionPane.showInputDialog("Escolha a opcao: \n1-Inserir valores \n2-Calcular preco por area \n3 Mostrar valores \n0- Sair"));
            
            switch(op){
                case 1:
                    piso.inserirValores();
                    break;
                case 2:
                    piso.calcularPrecoArea();
                    break;
                case 3:
                    piso.mostrarValores();
                    break;
                case 0:
                    JOptionPane.showMessageDialog(null, "Saindo do sistema!");
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Opcao invalida!");
                    
            }
            
        }while (op != 0);
        
    }
}
