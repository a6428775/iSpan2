package tw.ispan.user1;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class User1Service {
	
	@Autowired
	private User1Repository User1Repository;
	
//	findByUseremailaddress 使用者帳號
	public Optional<User1> findByUseremailaddress(String Useremailaddress){
		Optional<User1> op1 = User1Repository.findByUseremailaddress(Useremailaddress);
		
		return op1;
	}
	
//	更新帳號資料
	public User1 update(User1 up3) {
		return User1Repository.save(up3);
	}
	
//	建立User1資料
	public User1 createUser1(User1 User1) {
		Optional<User1> op2 = User1Repository.findByUseremailaddress(User1.getUseremailaddress());
		if (op2.isEmpty()) {
			return User1Repository.save(User1);
		}
		return null;
	}
	
}