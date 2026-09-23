/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Conexao;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Usuario {
    
    private Conexao con = new Conexao();
    
    private int codigo;
    private String login;
    private String senha;
    private String telefone;


    
     public void cadastrar(){
        String sql;
        sql= "Insert into usuario(codigo,login,senha,telefone)values"+ "( "
                + "" + getCodigo()+ " ,'" + getLogin()+ "' ,'" + getSenha()+ "', '" + getTelefone()+ "')";
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Gravado com Sucesso...");              
    }
    
    
     public void excluir(){
        String sql;
        sql = "Delete FROM usuario WHERE codigo=" +getCodigo()+ "";
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Excluido com sucesso...");
        
       }
    public void Alterar(){
        String sql;
        sql = "UPDATE usuario set login='" + getLogin()+   "' ,telefone= '" + getTelefone()+ "' ,senha= '" + getSenha() + "' WHERE codigo='" +this.getCodigo()+"' ";
        
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Alterado com sucesso...");
    }
    
    public ResultSet consultar()
    {
        ResultSet tabela;
        tabela= null;
        
        String sql= "Select * from usuario";
        tabela= con.RetornarResultset(sql);
        return tabela;
    }

    public Conexao getCon() {
        return con;
    }

    public void setCon(Conexao con) {
        this.con = con;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
}
