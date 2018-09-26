package br.com.springmvc.despesas.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import br.com.springmvc.despesas.model.Despesa;

public interface Despesas extends JpaRepository<Despesa,Long>{

	public List<Despesa> findByDescricaoContaining(String descricao);
}
