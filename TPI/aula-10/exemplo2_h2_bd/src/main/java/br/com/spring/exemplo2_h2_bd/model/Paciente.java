package br.com.spring.exemplo2_h2_bd.model;

import jakarta.persistence.*;

@Entity
@Table(name="paciente")
public class Paciente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nomepac;
    private String endereco;
    private Double altura;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNomepac() {
        return nomepac;
    }

    public void setNomepac(String nomepac) {
        this.nomepac = nomepac;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }



}
