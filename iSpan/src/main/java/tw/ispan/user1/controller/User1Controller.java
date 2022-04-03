package tw.ispan.user1.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.ispan.user1.User1;
import tw.ispan.user1.User1Service;

@Controller
public class User1Controller {

	@Autowired
	private User1Service User1Service;

//	修改User1基本資料(若不存在則新增一筆User1)
	@PostMapping("/Account/User1/membercenterupdate.controller")
	public String User1Update(@RequestParam("Nickname") String Nickname, @RequestParam("Phone") String Phone,
									@RequestParam("Address") String Address, @RequestParam("Birthday") String Birthday, Model m, User1 User1) {

//		取得登入帳號
		String SecurityName = SecurityContextHolder.getContext().getAuthentication().getName();
//		取得一筆User1
		Optional<User1> findUser1 = User1Service.findByUseremailaddress(SecurityName);
		
//		修改User1基本資料(若不存在則新增一筆User1)
		if (findUser1.isEmpty()) {
			
			User1.setUseremailaddress(SecurityName);
			User1.setNickname(Nickname);
			User1.setPhone(Phone);
			User1.setAddress(Address);
			User1.setBirthday(Birthday);

			User1Service.createUser1(User1);
		} else {

			findUser1.get().setNickname(Nickname);
			findUser1.get().setPhone(Phone);
			findUser1.get().setAddress(Address);
			findUser1.get().setBirthday(Birthday);

			User1Service.update(findUser1.get());
		}
		
		return "home";
	}
}
