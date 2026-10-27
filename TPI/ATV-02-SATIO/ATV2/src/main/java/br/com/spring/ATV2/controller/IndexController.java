package br.com.spring.ATV2.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
    @GetMapping("/")
    public String cadastrar(){
        return "cadastro";
    }
@PostMapping("/home")
    public String salvar(
        @RequestParam ("nome") String nome,
        @RequestParam ("checkin") String checkin,
        @RequestParam ("checkout") String checkout,
        @RequestParam ("quarto") String quarto,
        @RequestParam ("qtdHospede") String qtdHospede,
        @RequestParam ("cafeManha") String cafeManha,
        @RequestParam ("estacionamento") String estacionamento,
        @RequestParam ("pagamento") String pagamento,
        @RequestParam ("diaria") String diaria,
        Model model
){
    model.addAttribute("nome", nome);
    model.addAttribute("checkin", checkin);
    model.addAttribute("checkout", checkout);
    model.addAttribute("quarto",quarto);
    model.addAttribute("qdtHospede",qtdHospede);
    model.addAttribute("cafeManha",cafeManha);
    model.addAttribute("estacionamento", estacionamento);
    model.addAttribute("pagamento",pagamento);
    model.addAttribute("diaria", diaria);
    model.addAttribute("sucesso",true);
    return "cadastro";
}
}
