package tw.ispan.user1.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.ispan.user1.User1;
import tw.ispan.user1.User1Service;

@Controller
public class User1Controller {
	
	@Autowired
	private User1Service User1Service;
	
//	註冊新會員
	@RequestMapping(path = "/createuser1main.controller", method = RequestMethod.GET)
    public String processuser1MainAction(Model m) {
		User1 user1 = new User1();
    	m.addAttribute("user1", user1);
    	return "register";
	}
	@PostMapping("/createuser1.controller")
	public String processCreateUserAction(@ModelAttribute("user1") User1 User1, Model m) {
		
		if(User1.getUseremailaddress()=="" || User1.getUserpassword()=="" ) {
			return "user1RegisterError";
		}
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		m.addAttribute("Useremailaddress", User1.getUseremailaddress());
		m.addAttribute("Phone", User1.getPhone());
		m.addAttribute("Nickname",User1.getNickname());

		String encode = new BCryptPasswordEncoder().encode(User1.getUserpassword());
		User1.setUserpassword(encode);
		User1 createUser1 = User1Service.createUser1(User1);
		if(createUser1 != null) {
			return "registerResult";
		} else {
			errors.put("account", "!!帳號已存在，請更換其他帳號信箱!!");	
			return "register";
		}
	}

	// 登入、取得登入成功後使用者名稱
	@RequestMapping(path = "/user1/membercenter.controller", method = RequestMethod.GET)
	public String UserProfileInfo(Model m) {
		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println("SecurityName:" + SecurityName);

		// findByName()取得一筆會員Bean，用Model丟出來給jsp顯示
		User1 findByName1 = User1Service.findByUseremailaddress(SecurityName);
				
		m.addAttribute("user1",findByName1);
		m.addAttribute("Useremailaddress", findByName1.getUseremailaddress());
		m.addAttribute("Userpassword", findByName1.getUserpassword());
		m.addAttribute("Nickname", findByName1.getNickname());
		m.addAttribute("Phone", findByName1.getPhone());
		m.addAttribute("Address", findByName1.getAddress());
		m.addAttribute("Birthday", findByName1.getBirthday());
		return "memberCenter";
	}

//	修改會員基本資料
	@PostMapping("/user1/membercenterupdate.controller")
	public String UserProfileUpdate(@ModelAttribute("user1") User1 User1, Model m) {

		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		// findByName()取得一筆會員Bean
		User1 findByName1 = User1Service.findByUseremailaddress(SecurityName);
		System.out.println(findByName1.getPhone() + "," + findByName1.getNickname() + "," + findByName1.getAddress() + 
				"," + SecurityName + "," + findByName1.getUserpassword() + "," + findByName1.getUserid() + "," + findByName1.getBirthday()+"\n");
		//修改後更新、print
		findByName1.setPhone(User1.getPhone());
		findByName1.setNickname(User1.getNickname());
		findByName1.setAddress(User1.getAddress());
		findByName1.setBirthday(User1.getBirthday());
		User1 update1 = User1Service.update(findByName1);

		System.out.println(update1.getPhone() + "," + update1.getNickname() + "," + update1.getAddress() + "," + update1.getUseremailaddress() +
				"," + update1.getUserpassword() + ","+ update1.getUserid()+ ","+ update1.getBirthday() );	
		
		m.addAttribute("User1", findByName1);
		m.addAttribute("Useremailaddress", findByName1.getUseremailaddress());
		m.addAttribute("Userpassword", findByName1.getUserpassword());
		m.addAttribute("Nickname", findByName1.getNickname());
		m.addAttribute("Phone", findByName1.getPhone());
		m.addAttribute("Address", findByName1.getAddress());
		m.addAttribute("Birthday", findByName1.getBirthday());
		return "memberCenter";
	}
	
	重設會員密碼
	@PostMapping("/user1/membercenterupdatepwd.controller")
	public String UserProfileUpdatePwd(@ModelAttribute("user1") User1 User1, Model m) {

		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		// findByName()取得一筆會員Bean
		User1 findByName1 = User1Service.findByUseremailaddress(SecurityName);
		
		//編碼、修改後更新、print
		String encode = new BCryptPasswordEncoder().encode(User1.getUserpassword());
 		findByName1.setUserpassword(encode);
		User1 update1 = User1Service.update(findByName1);

		System.out.println(update1.getPhone() + "," + update1.getNickname() + "," + update1.getAddress() + "," + update1.getUseremailaddress() +
				"," + update1.getUserpassword() + ","+ update1.getUserid()+ ","+ update1.getBirthday() );	
		
		m.addAttribute("User1", findByName1);
		m.addAttribute("Useremailaddress", findByName1.getUseremailaddress());
		m.addAttribute("Userpassword", findByName1.getUserpassword());
		m.addAttribute("Nickname", findByName1.getNickname());
		m.addAttribute("Phone", findByName1.getPhone());
		m.addAttribute("Address", findByName1.getAddress());
		m.addAttribute("Birthday", findByName1.getBirthday());

		return "memberCenter";
	}
	
}
