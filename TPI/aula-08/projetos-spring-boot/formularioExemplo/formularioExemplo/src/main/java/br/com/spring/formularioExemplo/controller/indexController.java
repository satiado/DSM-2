            package br.com.spring.formularioExemplo.controller;

            import org.springframework.stereotype.Controller;
            import org.springframework.stereotype.Repository;
            import org.springframework.ui.Model;
            import org.springframework.web.bind.annotation.GetMapping;
            import org.springframework.web.bind.annotation.PostMapping;
            import org.springframework.web.bind.annotation.RequestParam;

            @Controller




            public class indexController {
                @GetMapping ("/cadastro-produto")
                public String abrirFormulario() {
                    return "cadastro";
                }

                @PostMapping("/salvar-produto")
                public String salvar(
                        @RequestParam("nome") String nome,
                        @RequestParam("preco") Double preco,
                        @RequestParam("categoria") String categoria,
                        Model model ){
                    model.addAttribute ("n", nome);
                    model.addAttribute ("p", preco);
                    model.addAttribute ("c", categoria);
                    model.addAttribute ("sucesso", true);
                    return "cadastro";

                }
            }
