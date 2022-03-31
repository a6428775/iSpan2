package tw.chen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class aboutController {
	
	@GetMapping("/about.controller")
	public String processAction() {
		return "about";
	}
}
