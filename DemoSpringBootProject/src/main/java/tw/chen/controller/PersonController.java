package tw.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import tw.chen.model.Person;

@RestController
public class PersonController {

	@Autowired
	private Person person; 
	
	//@RequestMapping(path = "/person.controller",method = RequestMethod.GET)
	@GetMapping(path = "/person.controller")
	public Person processAction() {
		return person;
	}
}
