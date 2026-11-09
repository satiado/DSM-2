
import java.util.Scanner;
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author fatec-dsm2
 */
public class Pessoa {
       //CRIAR ATRIBUTOS
    
    private String nome;
    private String endereco;
    private int idade;
    private double peso;
    
    //ENCAPSULAMENTO
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }
    //MÉTODOS
    public void mostrarSystem(){
        System.out.println("Nome: " + getNome() + "\n Endereço: " + getEndereco() + "\n Idade: " + getIdade() + "\n Peso: " + getPeso());
    }
    public void mostrarJOption(){
        JOptionPane.showMessageDialog(null, "Nome: " + getNome() + "\n Endereço: " + getEndereco() + "\n Idade: " + getIdade() + "\n Peso: " + getPeso());
    }
    
    public void cadastrarSystem(){
        Scanner leia = new Scanner(System.in);
        System.out.println("Digite o nome: ");
        setNome(leia.next());
        System.out.println("Digite a idade: ");
        setIdade (leia.nextInt());
        System.out.println("Digite o peso: ");
        setPeso (leia.nextByte());
        System.out.println("Digite o endereco: ");
        setEndereco(leia.next());
    }
    
    public void cadastrarJoption(){
        setNome(JOptionPane.showInputDialog("Digite o nome: "));
        setIdade(Integer.parseInt(JOptionPane.showInputDialog("Digite a idade: ")));
        setPeso(Double.parseDouble(JOptionPane.showInputDialog("Digite o peso: ")));
        setEndereco(JOptionPane.showInputDialog("Digite o endereco: "));
    }

}
