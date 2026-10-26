package br.com.spring.exercicio2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class indexController {
    @GetMapping("/catalogo")
    public String abrirFormulario(){
        return "cadastro";
    }
    @PostMapping("/pecas")
    public String salvar(
            @RequestParam ("nome") String nome,
            @RequestParam ("amperagem") double amperagem,
            @RequestParam ("categoria") String categoria,
            @RequestParam ("quantidade") int quantidade,
            @RequestParam ("voltagem") int voltagem,
            Model model
    ){
        model.addAttribute("n", nome);
        model.addAttribute("a", amperagem);
        model.addAttribute("c", categoria);
        model.addAttribute("q", quantidade);
        model.addAttribute("v", voltagem);
        model.addAttribute("sucesso", true);
        return "cadastro";
    }
}
