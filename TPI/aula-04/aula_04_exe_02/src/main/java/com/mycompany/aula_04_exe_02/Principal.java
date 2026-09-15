/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_04_exe_02;

import javax.swing.JOptionPane;

/**
 *
 * @author satio daniel
 */
public class Principal {

    public static void main(String[] args) {
        Quadrado quad = new Quadrado();
        
        int op;
        double ladoa;
        do{
            op = Integer.parseInt(JOptionPane.showInputDialog("Digite a opcao: \n1-Calcular Area Quadrado \n2-Calcular Perimetro Quadrado \n3-Mostrar Valores \n0-Sair"));
            switch(op){
                case 1:
                    ladoa = Double.parseDouble(JOptionPane.showInputDialog("Digite o lado: "));
                    quad.calcularAreaQuadrado(ladoa);
                    break;
                case 2:
                    ladoa = Double.parseDouble(JOptionPane.showInputDialog("Digite o lado: "));
                 quad.calculoPerimetro(ladoa);
                break;
                case 3:
                    quad.mostrarValores();
                    break;
                case 0:
                    JOptionPane.showMessageDialog(null,"Saindo do sistema!");
                    break;
                default:
                    JOptionPane.showMessageDialog(null,"Opcao invalida");
             } 
        }while (op != 0);
    }
}
