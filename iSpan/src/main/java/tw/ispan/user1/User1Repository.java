package tw.ispan.user1;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface User1Repository extends JpaRepository<User1, Integer> {

//	由accountid找到User1資料
	public Optional<User1> findByUseremailaddress(String Useremailaddress);
	
}