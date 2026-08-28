/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.exemplooo;

/**
 *
 * @author fatec-dsm2
 */
public class Principal {

    public static void main(String[] args) {
        //INSTANCIAR OBJETO usu
        Usuario usu = new Usuario();
        
        //PASSAR DADOS PRA CLASSE USUARIO
//        usu.setNome("Satio Daniel");
//        usu.setIdade(19);
//        usu.setEmail("satiado.outlook.com");
//        usu.setTelefone("(13)9876-5432");

        //CHAMAR O MÉTODO CADASTRAR DADOS
        usu.cadastrarDados();
        
        //CHAMAR MÉTODO MOSTRAR DADOS DA CLASSE USUARIO
        usu.mostrarDados();
        
    }
}
