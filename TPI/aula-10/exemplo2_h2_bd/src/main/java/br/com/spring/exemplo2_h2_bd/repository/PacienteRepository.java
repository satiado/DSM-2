package br.com.spring.exemplo2_h2_bd.repository;

import br.com.spring.exemplo2_h2_bd.model.Paciente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PacienteRepository extends JpaRepository<Paciente, Integer> {
}
