/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo6java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo6Java {

    public static void main(String[] args) {
        double sm, p, ns;

        Scanner leia = new Scanner(System.in);
        System.out.println("Digite seu salário mensal: ");
        sm = leia.nextDouble();
        System.out.println("Digite o percentual de reajuste salarial: ");
        p = leia.nextDouble();
        ns = sm + (sm * p)/100;
        System.out.println("Seu novo salário é de: " +ns + " reais");
    }
}
