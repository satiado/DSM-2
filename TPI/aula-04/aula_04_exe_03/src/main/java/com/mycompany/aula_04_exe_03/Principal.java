/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_04_exe_03;

import javax.swing.JOptionPane;

/**
 *
 * @author satio daniel
 */
public class Principal {

    public static void main(String[] args) {
        Eleitores eleit = new Eleitores();
        
        int op;
        do{
            op = Integer.parseInt(JOptionPane.showInputDialog("Digite a opcao: \n1-Inserir quantidade votos \n2-Calcular total eleitoes \n3-Calcular percentual votos \n0-Sair"));
            switch(op){
                case 1:
                    eleit.inserirQtdVotos();
                    break;
                case 2:
                    eleit.calcularTotalEleitores();
                    break;
                case 3:
                    eleit.calcularPercentualVotos();
                    break;
                case 0:
                    JOptionPane.showMessageDialog(null, "Saindo do sistema!");
                    break;
                default:
                    JOptionPane.showMessageDialog(null, "Opcao invalida");
            }
        }while (op != 0);
    }
}
