/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.aula_02_3_exe_01;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        CategoriaCliente cli = new CategoriaCliente();
        
        cli.cadastrarCliente();
        cli.verificarSaldo();
    }
}
