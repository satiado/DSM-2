/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.projetocalculadoraoo;

import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        //instanciar um objeto
        Calculadora calc = new Calculadora();
        
        int op;
        double a,b;
        
        do {
            op =Integer.parseInt(JOptionPane.showInputDialog("Digite a opcao: \n 1-Somar \n 2- Subtrair \n 3- Multiplicar \n 4- Dividir \n 0- Sair "));
            
            switch(op)
            {
                case 1:
                    calc.somar();
                    break;
                case 2:
                    a = Double.parseDouble(JOptionPane.showInputDialog("Digite um numero: "));
                    b = Double.parseDouble(JOptionPane.showInputDialog("Digite outro numero: "));
                    calc.subtrair(a, b);
                    break;
                case 3:
                    JOptionPane.showMessageDialog(null, "O resultado da Multiplicacao e "+ calc.multiplicar());
                    break;
                case 4:
                    a = Double.parseDouble(JOptionPane.showInputDialog("Digite um numero: "));
                    b = Double.parseDouble(JOptionPane.showInputDialog("Digite outro numero: "));
                    JOptionPane.showMessageDialog(null, "O resultado da divisao e "+ calc.dividir(a, b));
                    break;
                case 0:
                    JOptionPane.showMessageDialog(null, "Saindo do sistema");
                    break;
                default :
                    JOptionPane.showMessageDialog(null, "Opcao invalida!");
            }
            
        }while(op != 0);
    }
}
