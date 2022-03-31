package tw.chen.model;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class BirdService {
	
	@Autowired
	private BirdRepository bRepo;
	
	public Bird insert(Bird bird) {
		return bRepo.save(bird);
	}
	
	public Bird update(Bird bird) {
		return bRepo.save(bird);
	}
	
	public void deleteById(Integer id) {
		bRepo.deleteById(id);
	}
	
	public Bird findById(Integer id) {
		Optional<Bird> op1 = bRepo.findById(id);
		if(op1.isEmpty()) {
			return null;
		}
		
		return op1.get();
	}
}
