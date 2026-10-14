package br.com.spring.exemplo_paciente.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/paciente")
    public String HomePaciente(Model model){
        model.addAttribute("nome_paciente","Satio");
        model.addAttribute("telefone_paciente","(13)99752-5483  ");
        return "paciente";
    }
}
