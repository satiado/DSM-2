/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplo11java;

import java.util.Scanner;

/**
 *
 * @author fatec-dsm2
 */
public class Exemplo11Java {

    public static void main(String[] args) {
        Scanner leia = new Scanner(System.in);
        
        String np1,np2,np3;
        double v1,v2,v3,vp1,vp2,vp3,qp1,qp2,qp3,vt;
        
        System.out.println("Digite o nome do produto um: ");
        np1 = leia.next();
        System.out.println("Digite o valor do produto um: ");
        v1 = leia.nextDouble();
        System.out.println("Digite a quantidade vendida do produto um: ");
        qp1 = leia.nextDouble();
        System.out.println("Digite o nome do produto dois: ");
        np2 = leia.next();
        System.out.println("Digite o valor do produto dois: ");
        v2 = leia.nextDouble();
        System.out.println("Digite a quantidade vendida do produto dois: ");
        qp2 = leia.nextDouble();
        System.out.println("Digite o nome do produto três: ");
        np3 = leia.next();
        System.out.println("Digite o valor do produto três: ");
        v3 = leia.nextDouble();
        System.out.println("Digite a quantidade vendida do produto três: ");
        qp3 = leia.nextDouble();
        
        vp1 = v1 * qp1;
        vp2 = v2 * qp2;
        vp3 = v3 * qp3;
        System.out.println("O valor do produto um é:" +vp1);
        System.out.println("O valor do produto dois é:" +vp2);
        System.out.println("O valor do produto três é:" +vp3);
        
        vt = vp1 + vp2 +vp3;
        System.out.println("O valor total da compra é: " +vt);
    }
}
