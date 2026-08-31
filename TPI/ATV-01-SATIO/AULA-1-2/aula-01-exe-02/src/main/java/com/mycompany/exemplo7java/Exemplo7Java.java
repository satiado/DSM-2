/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo7java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo7Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        double nl,vp;
        
        System.out.println("Digite a quantidade de litros abastecidos: ");
        nl = leia.nextDouble();
        vp = nl * 6.49;
        System.out.printf("O valor a ser pago é: %.2f", vp);
    }
}
