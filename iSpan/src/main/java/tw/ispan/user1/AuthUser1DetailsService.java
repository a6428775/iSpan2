package tw.ispan.user1;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthUser1DetailsService implements UserDetailsService {
	@Autowired
	private User1Service uService;

	@Override
	public UserDetails loadUserByUsername(String useremailaddress) throws UsernameNotFoundException {
		
		User1 user1 = uService.findByUseremailaddress(useremailaddress);
		
		return new User(user1.getUseremailaddress(), user1.getUserpassword(), Collections.EMPTY_LIST);
	}
	
}
