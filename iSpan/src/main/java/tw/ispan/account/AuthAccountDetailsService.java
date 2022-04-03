package tw.ispan.account;

import org.springframework.security.core.userdetails.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthAccountDetailsService implements UserDetailsService {

	@Autowired
	private AccountService uService;

	@Override
	public UserDetails loadUserByUsername(String useraccount) throws UsernameNotFoundException {

		Account account = uService.findByUseraccount(useraccount);

//		return new User(account.getUseraccount(), account.getUserpassword(), Collections.EMPTY_LIST);
		
		return User.withUsername(account.getUseraccount())
					.password(account.getUserpassword())
					.roles(account.getUserrole()).build();
	}
}
