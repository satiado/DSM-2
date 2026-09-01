/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo8java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo8Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        String nome;
        double qc,pu,total;
        
        System.out.println("Digite o nome do produto: ");
        nome = leia.next();
        System.out.println("Digite a quantidade comprada: ");
        qc = leia.nextDouble();
        System.out.println("Digite o preço unitário: ");
        pu = leia.nextDouble();
        total = qc * pu;
        System.out.println("O " + nome + " ficou: " + total + " reais.");
    }
}
