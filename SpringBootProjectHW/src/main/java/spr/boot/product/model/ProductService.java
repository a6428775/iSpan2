package spr.boot.product.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class ProductService {

	@Autowired
	public ProductRepository pRep;

	public Product findById(int id) {
		Optional<Product> op = pRep.findById(id);

		if (op.isPresent()) {
			return op.get();
		}

		return null;
	}

	public List<Product> findAll() {
		return pRep.findAll();
	}

	public Page<Product> findAllByPage(Pageable pageable) {
		return pRep.findAll(pageable);
	}
}
