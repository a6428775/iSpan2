package tw.ispan.account;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.ispan.exception.UserNotFoundException;

@Service
@Transactional
public class AccountService {
	
	@Autowired
	private AccountRepository accountrepository;
	
//	findByUseraccount 取得使用者帳號
	public Account findByUseraccount(String useraccount) {
		Optional<Account> op1 = accountrepository.findByUseraccount(useraccount);
		
		System.out.println( op1.get().getUseraccount() + "," + op1.get().getUserpassword() );
		
		if (op1.isEmpty()) {
			throw new UserNotFoundException("帳號或密碼錯誤!");
		}
		return op1.get();
	}
	
//	建立帳號
	public Account createUser1(Account account) {
		Optional<Account> op2 = accountrepository.findByUseraccount(account.getUseraccount());
		if (op2.isEmpty()) {
			return accountrepository.save(account);
		}
		return null;
	}
//	更新帳號資料
	public Account update(Account ac) {
		return accountrepository.save(ac);
	}
}
