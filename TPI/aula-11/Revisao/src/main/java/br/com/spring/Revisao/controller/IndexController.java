package br.com.spring.Revisao.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
    //GetMapping anotração para a página local:localhost8080/funcionario
    @GetMapping("/funcionario")
    public String formulario(){
        return"formFunc";
    }

    //PostMapping envia as informações preenchidas no formulário
    @PostMapping("/salvar")
    public String cadastrar(
            //Envia como parâmetro os dados a ser cadastadosno formulário
            @RequestParam("nome")String nome,
            @RequestParam("idade")Integer idade,
            @RequestParam("altura")Double altura,
            @RequestParam("cargo")String cargo,
            @RequestParam("datanasc")String datanasc,
            Model model){
        model.addAttribute("n",nome);
        model.addAttribute("i",idade);
        model.addAttribute("a",altura);
        model.addAttribute("c",cargo);
        model.addAttribute("d",datanasc);
        model.addAttribute("sucesso",true);
        return "formFunc";
    }

}
