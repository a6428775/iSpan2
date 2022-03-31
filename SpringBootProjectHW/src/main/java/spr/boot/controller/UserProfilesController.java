package spr.boot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import spr.boot.model.UserProfiles;
import spr.boot.model.UserProfilesService;

@Controller
public class UserProfilesController {
	
	@Autowired
    private UserProfilesService uService;
	
	@RequestMapping(path = "/userProfilemain.controller", method = RequestMethod.GET)
    public String processMainAction(Model m) {
		UserProfiles userProfile = new UserProfiles();
    	m.addAttribute("userProfile", userProfile);
    	return "userProfile";
	}
	
	@PostMapping("/createuserprofiles.controller")
	public String processCreateUserAction(@ModelAttribute("userProfile") UserProfiles up, Model m) {
		
		if(up.getName()=="" || up.getPassword()=="" || up.getEmailaddress()=="" || up.getPhone()=="" ) {
			return "userPfError";
		}
		
		m.addAttribute("Name", up.getName());
		m.addAttribute("Pwd", up.getPassword());
		m.addAttribute("Email",up.getEmailaddress());
		m.addAttribute("Phone", up.getPhone());
		
		String encode = new BCryptPasswordEncoder().encode(up.getPassword());
		up.setPassword(encode);
		UserProfiles createUserProfilesUp1 = uService.createUserProfiles(up);
		if(createUserProfilesUp1 != null) {
			return "userPfResult";
		}
		return "userPfError";
	}
	
}
