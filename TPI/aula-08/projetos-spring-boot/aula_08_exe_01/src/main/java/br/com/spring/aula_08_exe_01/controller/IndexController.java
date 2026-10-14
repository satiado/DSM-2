package br.com.spring.aula_08_exe_01.controller;



@Controller
public class IndexController {
    @GetMapping("/perfil")
    public String PerfilFuncionario(Model model){
        model.addAttribute("nome_funcionario","Satio Daniel");
        model.addAttribute("cargo_funcionario","Estagiário");
        model.addAttribute("experiencia", "5 ");
        return("perfil");
    }
}
