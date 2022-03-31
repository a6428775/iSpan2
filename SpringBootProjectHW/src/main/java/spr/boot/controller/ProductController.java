package spr.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import spr.boot.product.model.Product;
import spr.boot.product.model.ProductService;

@Controller
@RequestMapping("/product")
@SessionAttributes(names = {"totalPages", "totalElements"})
public class ProductController {
	@Autowired
    private ProductService pService;
	
	@GetMapping("/productquerymainaction.controller")
	public String processQueryMainAction() {
		return "product/productQueryAll";
	}
	
	@GetMapping("/checkout.controller")
	public String processCheckoutAction() {
		return "product/checkout";
	}
	
	
	
	@PostMapping("/productquerybyid.controller")
	@ResponseBody
	public Product processQueryByIdAction(@RequestParam("pid") int pid) {
		return pService.findById(pid);
	}
	
	@PostMapping("/productqueryall.controller")
	@ResponseBody
	public List<Product> processQueryAllAction(){
		return pService.findAll();
	}
	
	@PostMapping("/queryByPage/{pageNo}")
	@ResponseBody
	public List<Product> processQueryAllByPageAction(@PathVariable("pageNo") int pageNo, Model m){
		int pageSize = 2;		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);		
		Page<Product> page = pService.findAllByPage(pageable);
		
		m.addAttribute("totalPages", page.getTotalPages());
		m.addAttribute("totalElements", page.getTotalElements());
		
		return page.getContent();
	}
}
