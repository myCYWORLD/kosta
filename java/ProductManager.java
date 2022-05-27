import java.util.List;

import com.my.dto.Product;
import com.my.repository.ProductListRepository;

public class ProductManager {

	public static void main(String[] args) {
		ProductListRepository repository;
		repository= new ProductListRepository();
		repository.insert(new Product("D0001","상품1",1000));
		repository.insert(new Product("D0002","상품2",1000));
		repository.insert(new Product("D0003","상품3",1000));
		repository.insert(new Product("D0002","상품2",4000)); //이미 존재하는 상품입니다 출력
		
		List<Product> list = repository.selectAll();
		for(int i =0 ; i<list.size() ; i++ ) {// list.size() 는 3을 반환(저장된 요소의 개수)
			Product p = list.get(i);
			
			System.out.println(p); // p.toString()자동호출됨
			//상품번호는 D001, 상품명은 상품 1, 가격은 1000
			//상품번호는 D002, 상품명은 상품 2, 가격은 1000
			//상품번호는 D003, 상품명은 상품 3, 가격은 1000
			//출력 값이 위와 같이 나오기 위해선 product 쪽에 overriding 해야함
			//상품 번호가 중복되면 저장x. 이미 존재하는 상품입니다 출력
		}
	}

}
