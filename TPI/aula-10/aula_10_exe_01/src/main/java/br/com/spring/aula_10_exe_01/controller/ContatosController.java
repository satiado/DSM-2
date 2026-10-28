package br.com.spring.aula_10_exe_01.controller;

import br.com.spring.aula_10_exe_01.model.Contato;
import br.com.spring.aula_10_exe_01.repository.ContatoRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ContatosController {
    private ContatoRepository contatoRepository;

    public ContatosController(ContatoRepository contatoRepository)
    {
        this.contatoRepository = contatoRepository;
    }

    @GetMapping("/formulario")
    public String formulario(Model model){
        model.addAttribute("contato", new Contato());
        return "formulario";
    }

    @PostMapping("/salvar")
    public String salvar(Contato contato){
        contatoRepository.save(contato);
        return ("redirect:/formulario");
    }

}
