package tw.ispan.account;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity @Table(name = "account")
@Component
public class Account {
	
	@Id @Column(name = "ACCOUNTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int accountid;
	
	@Column(name = "USERACCOUNT")
	private String useraccount;
	
	@Column(name = "USERPASSWORD")
	private String userpassword ;
	
	@Column(name = "USERROLE")
	private String userrole;
	
	public Account() {
		
	}

	public Account (String useraccount, String userpassword, String userrole) {
		
	}

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public String getUseraccount() {
		return useraccount;
	}

	public void setUseraccount(String useraccount) {
		this.useraccount = useraccount;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	
}
