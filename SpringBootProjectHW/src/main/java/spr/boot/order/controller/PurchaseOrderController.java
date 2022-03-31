package spr.boot.order.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spr.boot.order.model.PurchaseOrder;
import spr.boot.order.model.PurchaseOrderService;

@Controller
@RequestMapping("/users/order")
public class PurchaseOrderController {
	
	@Autowired
	private PurchaseOrderService poService;
	
	@GetMapping("/pomainaction.controller")
	public String processPoMainAction() {
		return "order/purchaseOrderProductList";
	}
	
	@GetMapping("/purchaseOrderProduct.controller")
	public String processPoProductAction(@RequestParam("pid") int pid, Model m) {
		m.addAttribute("pid", pid);
		return "order/purchaseOrderProduct";
	}
	
	@PostMapping("/purchaseOrderInsert.controller")
	@ResponseBody
	public PurchaseOrder processPurchaseOrderInsertAction(@RequestBody PurchaseOrder po) {
		//po.setOdate(new Date());
		return poService.insert(po);
	}
	
}
