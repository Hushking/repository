package br.com.springmvc.despesas;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.springmvc.despesas.model.Categoria;
import br.com.springmvc.despesas.model.Despesa;
import br.com.springmvc.despesas.repositorio.Despesas;

@Controller
@RequestMapping("/despesas")
public class DespesaController {
	
	@Autowired
	private Despesas despesas;
	
	@RequestMapping("/nova")
	public ModelAndView nova(){
		ModelAndView mv= new ModelAndView("CadastroDespesa");
		mv.addObject(new Despesa());
		return mv;
	}

	@RequestMapping(method=RequestMethod.POST)
	public String salvar(@Validated Despesa despesa ,Errors errors , RedirectAttributes attributes){
		if(errors.hasErrors()){
			return "CadastroDespesa";
		}
		try{
		despesas.save(despesa);
		attributes.addFlashAttribute("mensagem" , "Despesa salva com sucesso!");
		return "redirect:/despesas/nova";
		}catch(DataIntegrityViolationException e){
			errors.rejectValue("data", null , "Formato de data Inválido!");
			return "CadastroDespesa";
		}
	}
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView despesas(@RequestParam(defaultValue="%")String descricao){
		List<Despesa> todasDespesas = despesas.findByDescricaoContaining(descricao);
		ModelAndView mv = new ModelAndView("ListagemDespesas");
		mv.addObject("despesas", todasDespesas);
		return mv;
	}
	@RequestMapping(value="{codigo}", method = RequestMethod.DELETE)
	public String excluir(@PathVariable Despesa codigo){
		despesas.delete(codigo);
		return "redirect:/despesas";
	}
	@ModelAttribute("todasCategorias")
	public List<Categoria> todasCategorias(){
		return Arrays.asList(Categoria.values());
	}
	
}

