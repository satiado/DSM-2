/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo5java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo5Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        double sf,sm,qs;
        
        System.out.println("Digite o valor do salário mínimo: ");
        sm = leia.nextDouble();
        System.out.println("Digite o valor do seu salário: ");
        sf = leia.nextDouble();
        qs = sf/sm;
        //PARA FORMATAR E MOSTRAR 2 NÚMEROS DEPOIS DA VÍRGULA
        System.out.printf("A quantidade de salários mínmos %.2f", qs);
    }
}
