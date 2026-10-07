package br.com.spring.exemplo3_model_atributos.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
    @GetMapping("/usu")
    public String Usuario(Model model){
        model.addAttribute("login","blablabla");
        model.addAttribute("senha","1234");
        model.addAttribute("telefone","(13)3422-5421");
        return "usu";
    }
}
