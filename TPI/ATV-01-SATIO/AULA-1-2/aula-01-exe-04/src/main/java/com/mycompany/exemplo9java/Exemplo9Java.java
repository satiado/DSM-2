/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo9java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo9Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        double la,lb,a,p;
        
        System.out.println("Digite a medida do Lado A em cm: ");
        la = leia.nextDouble();
        System.out.println("Digite a medida do Lado B em cm: ");
        lb = leia.nextDouble();
        a = la * lb;
        p = 2 * la + 2 * lb;
        System.out.println("A área do retângulo é: " +a);
        System.out.println("O perímetro do retângulo é: " +p);
    }
}
