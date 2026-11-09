package br.com.spring.exemplo2_h2_bd.controller;

import br.com.spring.exemplo2_h2_bd.model.Paciente;
import br.com.spring.exemplo2_h2_bd.repository.PacienteRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PacienteController {
    private PacienteRepository pacienteRepository;

    public PacienteController(PacienteRepository pacienteRepository){
        this.pacienteRepository = pacienteRepository;
    }

    @GetMapping("/formulario")
    public String formulario(Model model){
        model.addAttribute("paciente", new Paciente());
        return "formulario";
    }

    @PostMapping("/salvar")
    public String salvar(Paciente paciente){
        pacienteRepository.save(paciente);
        return "redirect:/formulario";
    }

}
