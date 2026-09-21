/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Conexao;
import javax.swing.JOptionPane;

/**
 *
 * @author fatec-dsm2
 */
public class Usuario {
    Conexao con = new Conexao();
    
    private String nome;
    private String email;
    private String login;
    private String senha;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    
        public void cadastrar(){
        String sql= "Insert into usuario(nome,email,login,senha)values"+
          "('"+ getNome()+ "', '" + getEmail()+ "', '"+getLogin()+"', "
                + "'"+getSenha()+"')";    
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Cadastrado com Sucesso !!!");
        
    }
    
    public ResultSet ListarUsuario(){
        ResultSet tabela;
        tabela = null;
        
        String sql = "Select * from cliente";
        tabela = con.RetornarResultset(sql);
        return tabela;
        
    }
    
}
