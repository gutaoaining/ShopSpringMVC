package sqlTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gt.dao.CategoryMapper;
import com.gt.model.Category;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext.xml", "classpath*:spring.xml" })
public class TestCategory {
	@Autowired
	   private CategoryMapper categoryMapper;
	  @Test
	   public void test1(){
		  Category category =new Category();
		  category.setType("男士休闲");
		  category.setHot(true);
		  categoryMapper.insertSelective(category);
	   }
}
