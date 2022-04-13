package tw.ispan.orderInformation.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationService;


//  04/12----------新增OrderInformationController.java
@Controller
public class OrderInformationController {
	
	@Autowired
	private OrderInformationService OrderInformationService;
	
	@PostMapping("/OrderInformationupdate.controller")
	public String OrderInformationUpdate(@RequestParam("opinion") String opinion, @RequestParam("oid") Integer oid, Model m) {
		
		OrderInformation OrderInformation = OrderInformationService.findByOrderId1(oid);
		System.out.println(oid);
		OrderInformation.setRemark(opinion);
		OrderInformationService.save(OrderInformation);
		
		return "welcome";
	}

	
}
