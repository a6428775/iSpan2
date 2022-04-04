package tw.ispan.productorder.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.ispan.orderInformation.OrderInformation;
import tw.ispan.orderInformation.OrderInformationRepository;
import tw.ispan.orderInformation.OrderInformationService;
import tw.ispan.product.Product;
import tw.ispan.productorder.ProductOrder;
import tw.ispan.productorder.ProductOrderRepository;
import tw.ispan.productorder.ProductOrderService;
import tw.ispan.store.Store;
import tw.ispan.store.StoreRepository;
import tw.ispan.store.StoreService;


@Controller
@RequestMapping("/Store")
@SessionAttributes(names = {"totalPages" , "totalElements"})
public class OrderController {
	
	@Autowired
	private ProductOrderService pService;
	@Autowired
	private StoreRepository s;
	@Autowired
	private StoreService sService;
	@Autowired
	private ProductOrderRepository p;
	@Autowired
	private OrderInformationRepository o;
	@Autowired
	private OrderInformationService oService;

	
	@GetMapping("/Store.controller")
	public String processAction(){ 
		return "Order/OrderAll";  
	}

	@PostMapping("/orderquerybyid.controller")
	@ResponseBody
	public ProductOrder processQueryByIdAction(@RequestParam("oid") int oid) {
		return pService.findById(oid);
	}
	@PostMapping("/orderqueryall.controller")	
	@ResponseBody
	public List<ProductOrder> processQueryAll(){
		return pService.findAll();
	}
	
	@PostMapping("/queryByPage/{pageNo}")	
	@ResponseBody
	public List<ProductOrder> processQueryAllByPage(@PathVariable("pageNo") int pageNo , Model m){
		//每頁顯示的筆數
		int pageSize = 2;
		//設定顯示頁碼與每頁筆數
		Pageable pageable = PageRequest.of(pageNo-1, pageSize);
		Page<ProductOrder> page =pService.findAllByPage(pageable);
		//取得資料總頁數
		m.addAttribute("totalPages", page.getTotalPages());
		//取得全部資料筆數
		m.addAttribute("totalElements", page.getTotalElements());
		//取得所取得的該頁資料內容
		return page.getContent();
	}
        
	//商家資訊修改網頁
	@GetMapping("/updateStore.controller")
	public String processUpdateStoreActiong() {
		return "/Order/updateStore";
	}
	
	//接收資料更新商家資訊
	@PostMapping("/updateStore2.controller")
	public Store processProductupdateAction(@RequestBody Store store) {
		
		
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        

        
        Optional<Store> op1 = s.findByAccount(username);
        
  //      Integer ss = op1.get().getStoreID();
        
        if ( op1.isEmpty() ) {
        	
        	store.setStoreAccount(username);
        	
        }else {
        	
        	 Integer ss = op1.get().getStoreID();
        	 store.setStoreID(ss);
        	 store.setStoreAccount(op1.get().getStoreAccount());
        	
        }
      
        
 //       store.setStorePassword(op1.get().getStorePassword());
		//取得登產品ID 透過ID 更新資料

		

		return sService.update(store);
	}	
	
	
	
	
	
	
	@PostMapping("/storeupdateInformation.controller")
	@ResponseBody
	public Store processUpdateStoreAction2() {
		//取得登入廠商的ID 才能新增商家自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        return sService.findByAccount(username);

	}
	
	
	//透過Store id 查詢 商家訂單
	@PostMapping("/QueryAllByStoreID.controller")	
	@ResponseBody
	public List<ProductOrder> processQueryAllByStoreID(){
		//取得登入廠商的ID 才能新增廠申自己的餐點進資料庫  還沒寫防呆
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        System.out.println(username); // user  
        Optional<Store> op1 = s.findByAccount(username);
        Integer ss = op1.get().getStoreID();

        return p.findByStoreId(ss);
        
	}
	
	//還沒寫完
	@PostMapping("/QueryInformationByOrderID.controller")	
	@ResponseBody
	public List<OrderInformation> processQueryAllByOrderID(@RequestParam("oid") int oid){
		return  o.findByOrderId(oid);
	}

	
	@PostMapping("/createStore.controller")
	public Store processCreateStoreAction2(@RequestBody Store store) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        store.setStoreAccount(username);
        
        return sService.createAccount(store);
	}
}

