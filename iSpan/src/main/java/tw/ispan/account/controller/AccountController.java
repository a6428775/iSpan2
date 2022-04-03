package tw.ispan.account.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.ispan.account.Account;
import tw.ispan.account.AccountService;
import tw.ispan.user1.User1;
import tw.ispan.user1.User1Service;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private User1Service User1Service;
	
//	註冊新會員
	@RequestMapping(path = "/createaccountmain.controller", method = RequestMethod.GET)
    public String processaccountMainAction(Model m) {
		Account account = new Account();
    	m.addAttribute("account", account);
    	return "register";
	}
	@PostMapping("/createaccount.controller")
	public String processCreateUserAction(@RequestParam("useraccount") String useraccount, @RequestParam("userpassword") String userpassword,
											@RequestParam("userrole") String userrole, Model m) {
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		Account account = new Account();
		String encode = new BCryptPasswordEncoder().encode(userpassword);
		account.setUserpassword(encode);
		account.setUseraccount(useraccount);
		account.setUserrole(userrole);
		Account createAccount = accountService.createUser1(account);
		if(createAccount != null) {
			return "registerResult";
		} else {
			errors.put("account", "!!帳號已存在，請更換其他帳號信箱!!");	
			return "register";
		}
	}

//  登入、取得登入成功後使用者名稱
	@RequestMapping(path = "/Account/User1/membercenter.controller", method = RequestMethod.GET)
	public String AccountInfo(Model m) {
		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();

		// findByUseraccount()取得一筆會員Bean，用Model丟出來給jsp顯示
		Account account = accountService.findByUseraccount(SecurityName);
		
//		取得一筆User1
		Optional<User1> findUser1 = User1Service.findByUseremailaddress(SecurityName);
		
		System.out.println(account.getUseraccount() + "," + account.getUserpassword() + "," + account.getUserrole());	
		
		m.addAttribute("Account",account);
		m.addAttribute("Useraccount", account.getUseraccount());
		m.addAttribute("Userpassword", account.getUserpassword());
		
		if (findUser1.isPresent()) {
			m.addAttribute("Nickname", findUser1.get().getNickname());
			m.addAttribute("Phone", findUser1.get().getPhone());
			m.addAttribute("Address", findUser1.get().getAddress());
			m.addAttribute("Birthday", findUser1.get().getBirthday());
		}
		
		return "memberCenter";
	}
	
//	重設會員密碼
	@PostMapping("/Account/User1/membercenterupdatepwd.controller")
	public String AccountUpdatePwd(@RequestParam("userpassword") String userpassword, Model m) {

		// 取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
		// findByUseraccount()取得一筆會員Bean
		Account account1 = accountService.findByUseraccount(SecurityName);
		
		//編碼、修改後更新
		String encode = new BCryptPasswordEncoder().encode(userpassword);
		account1.setUserpassword(encode);
		Account update1 = accountService.update(account1);

		System.out.println(update1.getUseraccount() + "," + update1.getUserpassword() + "," + update1.getUserrole());	
		
		m.addAttribute("Account", update1);
		m.addAttribute("Useraccount", update1.getUseraccount());
		m.addAttribute("Userpassword", update1.getUserpassword());

		return "home";
	}
	
//	權限限制：僅允許store使用者登入此方法
	@RequestMapping(path = "/store/membercenter.controller", method = RequestMethod.GET)
	@PreAuthorize("hasAnyAuthority('ROLE_STORE')")
	public String adminpage() {
		return ("welcome");
	}
	
}


