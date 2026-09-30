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
public class Passagem {
    
    Conexao con = new Conexao();
    
    private int codigo;
    private String nome;
    private String telefone;
    private String rg;
    private String destino;
    private String data;
    private String horario;
    private String poltrona;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getPoltrona() {
        return poltrona;
    }

    public void setPoltrona(String poltrona) {
        this.poltrona = poltrona;
    }
    
    public void cadastrar(){
        String sql = "insert into passagem(codigo,nome,telefone,rg,destino,data,horario,poltrona) values "+
               "(" + getCodigo()+",'"+getNome()+"','"+getTelefone()+"','"+getRg()+"','"+getDestino()+"','"+getData()+"','"+getHorario()+"','"+getPoltrona()+"')";
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Cadastrado com sucesso !!!");
    }
    
    public void Alterar(){
        String sql;
        sql = "UPDATE passagem set codigo='" + getCodigo()+"' ,nome= '" + getNome() + "' ,telefone= '" + getTelefone()+ "' ,rg= '" + getRg() +"' ,destino= '" + getDestino() +"' ,data= '" + getData() +"' ,horario= '" + getHorario() +"' ,poltrona= '" + getPoltrona() + "' WHERE codigo='" +this.getCodigo()+"' ";
     
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Alterado com sucesso...");
    }
    
    public ResultSet consultar()
    {
        ResultSet tabela;
        tabela= null;
        
        String sql= "Select * from passagem";
        tabela= con.RetornarResultset(sql);
        return tabela;
    }
    
    public void excluir(){
        String sql;
        sql = "Delete FROM passagem WHERE codigo=" +this.getCodigo();
        con.executeSQL(sql);
        JOptionPane.showMessageDialog(null, "Registro Excluido com sucesso...");
       }
    
}
