package spr.boot.model;

import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class AuthUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserProfilesService uService;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		UserProfiles uProfiles = uService.findByName(name);
		return new User(uProfiles.getName(), uProfiles.getPassword(), Collections.EMPTY_LIST);
	}

}
