package tw.ispan;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationRepository;
import tw.ispan.product.Product;
import tw.ispan.product.ProductRepository;
import tw.ispan.store.Store;
import tw.ispan.store.StoreRepository;
import tw.ispan.store.StoreService;

@Controller
//@RequestMapping("/Store")
public class Hellocontroller {
	
	@Autowired
	private StoreRepository s;
	@Autowired
	private ProductRepository p;
	@Autowired
	private OrderInformationRepository o;
	
	@GetMapping("/hello.controller")
	@ResponseBody
	public Integer processaction(){
		
		//����撣唾��� "撣唾��" 鞈��
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        
        //��董��� ����� Store 鞈�澈鋆∠����
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();
        return ss;
	}
	@GetMapping("/test")
	public String processAction2() {
		return "/Store/QueryInformationByOrderID.controller";
	}
	
	@GetMapping("/test2")
	public String processAction4() {
		return "test2";
	}
	
	@GetMapping("/test3")
	public String processAction5() {
		return "test3";
	}
	
	//�����TOREID �����
	@GetMapping("/test12313")
	@ResponseBody
	public List<OrderInformation> processAction3() {
		return o.findByOrderId(4);
		
	}
	
	@GetMapping("/test4")
	public String processAction6() {
		return "/product/productQueryAll";
	}
	@GetMapping("/test5")
	public String processAction7() {
		return "checkout";
	}
	@GetMapping("/event")
	public String processAction8() {
		return "event";
	}
	@GetMapping("/faq")
	public String processAction9() {
		return "faq";
	}
	@GetMapping("/aboutus")
	public String processAction10() {
		return "aboutus";
	}
	@GetMapping("/private")
	public String processAction11() {
		return "private";
	}
	@GetMapping("/contact")
	public String processAction12() {
		return "contact";
	}
}
