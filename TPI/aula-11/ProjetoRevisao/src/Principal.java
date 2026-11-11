
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author fatec-dsm2
 */
public class Principal {
    
    public static void main(String[] args) {
    //Instanciar o objeto
    Pessoa pes = new Pessoa();
    int op;
    
    do{
    op=Integer.parseInt(JOptionPane.showInputDialog("Escolha a opcao: \n1-Cadastrar \n2-Mostrar \n3-Calcular \n0-Sair"));
    
    switch(op){
        case 1:
            pes.cadastrarSystem();
            pes.cadastrarJoption();
            break;
        
        case 2:
            pes.mostrarSystem();
            pes.mostrarJOption();
            break;
        
        case 3:
            System.out.println(""+pes.calcularAposentadoriaIdade());
            JOptionPane.showMessageDialog(null, pes.calcularAposentadoriaIdade());
            break;
        
        case 0:
            JOptionPane.showMessageDialog(null,"Saindo do sistema");
            break;
        
        default:
            JOptionPane.showMessageDialog(null, "Opcao incorreta");
            break;            
            }
        }while(op !=0 );
    }   
}
