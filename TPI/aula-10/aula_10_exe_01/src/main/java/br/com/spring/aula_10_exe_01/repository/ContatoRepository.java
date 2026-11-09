package br.com.spring.aula_10_exe_01.repository;

import br.com.spring.aula_10_exe_01.model.Contato;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContatoRepository extends JpaRepository<Contato, Integer> {
}
