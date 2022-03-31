package tw.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.chen.model.DataBaseProperties;

@RestController
public class DataBasePropertiesController {

	@Autowired
	private DataBaseProperties dbp;
	
	@GetMapping("/dbproperties.controller")
	public DataBaseProperties processAction() {
		return dbp;
	}
}
