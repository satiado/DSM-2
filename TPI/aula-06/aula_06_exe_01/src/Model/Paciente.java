/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Control.Conexao;
import javax.swing.JOptionPane;
import java.sql.ResultSet;

/**
 *
 * @author satio daniel
 */
public class Paciente {
    Conexao con = new Conexao();
    
    private int codigo;
    private String Nome;
    private String endereco;
    private String complemento;
    private String rg;
    private String cpf;
    private String data;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
    
    public void cadastrar(){
        String sql = "insert into paciente(codigo,nome,endereco,complemento,rg,cpf,data_nasc) values "+
               "(" + this.getCodigo()+",'"+this.getNome()+"','"+this.getEndereco()+"','"+this.getComplemento()+"','"+this.getRg()+"','"+this.getCpf()+"','"+this.getData()+"')";
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Cadastrado com sucesso !!!");
    }
    
    public ResultSet mostrar(){
        ResultSet tabela;
       tabela = null;
       
       String sql = "select * from paciente";
       tabela = con.RetornarResultset(sql);
       return tabela;
    }
    
    public void excluir(){
        String sql;
        sql = "Delete FROM paciente WHERE codigo=" +this.getCodigo();
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Excluido com sucesso...");
        
       }
    
    public void Alterar(){
        String sql;
        sql = "UPDATE paciente set nome= '" + this.getNome()+ "' ,endereco= '" + this.getEndereco() + "' ,complemento= '" + this.getComplemento()+"' ,rg= '" + this.getRg()+"' ,cpf= '" + this.getCpf()+"' ,data_nasc= '" + this.getData()+ "' WHERE codigo=" +this.getCodigo();
        
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Alterado com sucesso...");
    }
    
}
