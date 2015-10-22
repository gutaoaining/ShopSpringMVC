package sqlTest;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gt.dao.CategoryMapper;
import com.gt.dao.ProductMapper;
import com.gt.model.Category;
import com.gt.model.Product;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext.xml", "classpath*:spring.xml" })
public class TestIndex {
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	@Test
	public void test1(){
		List<List<Product>> alllist = new ArrayList<List<Product>>();
	    for (Category category : categoryMapper.getCategoryIsHot(1)) {
	    	System.out.println("----------热点产品有："+category.getId());
			
			System.out.println(productMapper.getHotProduct(category.getId()));
			List<Product> li = productMapper.getHotProduct(category.getId());
			System.out.println("-------------"+li.get(0).getCategory().getType());
			alllist.add(productMapper.getHotProduct(category.getId()));
	    }
		//System.out.println(productMapper.getHotProduct(4));
	}
	
}
