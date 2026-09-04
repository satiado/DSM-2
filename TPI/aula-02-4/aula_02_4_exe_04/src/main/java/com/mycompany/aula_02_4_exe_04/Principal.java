/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_02_4_exe_04;
import javax.swing.JOptionPane;
/**
 *
 * @author satio daniel
 */
public class Principal {

    public static void main(String[] args) {
        Temperatura temp = new Temperatura();
        
        
        int op;
        
        do{
        op = Integer.parseInt(JOptionPane.showInputDialog("Digite o que deseja: \n1-Converter Celsius-Fahrenheit \n2-Converter Fahrenheit-Celsius \n0-Sair"));
        
        switch(op){
            case 1:
                temp.calcularTempCelsius(Double.parseDouble(JOptionPane.showInputDialog("Digite a temp Fahrenheith: ")));
                temp.getCelsius();
                break;
            case 2:
                temp.calcularTempFahrenheit(Double.parseDouble(JOptionPane.showInputDialog("Digite a temp Celsius: ")));
                temp.getFahrenheit();
                break;
            case 0:
                JOptionPane.showMessageDialog(null, "Saindo do sistema");
                break;
            default:
                JOptionPane.showMessageDialog(null, "Opcao invalida");
                break;           
            }
        } while(op !=0);       
    }
}
