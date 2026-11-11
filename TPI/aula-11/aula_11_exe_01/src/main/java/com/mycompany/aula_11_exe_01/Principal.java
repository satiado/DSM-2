/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_11_exe_01;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        Idade id = new Idade();
        int op;
        
        do{
           op=Integer.parseInt(JOptionPane.showInputDialog(null,"Selecione a opcao: \n1-Cadastrar dados \n2-Calcular Dados \n3-Mostrar dados \n0-Sair"));
           
           switch(op){
               
               case 1:
                   id.cadastrarDados();
                   break;
               case 2:
                   id.calcularIdade();
                   break;
               case 3:
                   id.mostrarDados();
                   break;
               case 0:
                   JOptionPane.showMessageDialog(null,"Saindo");
                   break;
               default:
                   JOptionPane.showMessageDialog(null,"Opcao invalida");
           }
        }while(op != 0);
        
    }
}
