package br.com.spring.cadastroEventos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller


public class indexController {

    @GetMapping("/cadastro-evento")
    public String abrirFormulario() {
        return "cadastro"; // abre a página html cadastro.html

    }
    @PostMapping("/salvar-evento")
    public String salvar(
            @RequestParam("data") String data,
            @RequestParam("ingresso") String ingresso,
            @RequestParam("qtdPessoas") int qtdPessoas,
            @RequestParam("meiaEntrada") boolean meiaEntrada,
            Model model

            ){
        // ENVIANDO OS DADOS RECEBIDOS DE VOLTA PARA A PAGINA
        model.addAttribute("d", data);
        model.addAttribute("i", ingresso);
        model.addAttribute("q", qtdPessoas);
        model.addAttribute("e", meiaEntrada);

        return 'cadastro';

    }


}
