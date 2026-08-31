/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo10java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo10Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        double r,a;
        
        System.out.println("Digite o raio da circunferência: ");
        r = leia.nextDouble();
        a = (3.14 * Math.pow (r,2));
        
        System.out.println("A área da sua circunferência é: " +a);
    }
}
