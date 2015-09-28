package sqlTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gt.dao.CategoryMapper;
import com.gt.model.Category;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext.xml", "classpath*:spring.xml" })
public class TestSql {
  @Autowired
   private CategoryMapper categoryMapper;
  @Test
   public void test1(){
	  System.out.println(categoryMapper.selectByPrimaryKey(1));
   }
  @Test
  public void testALlAccount(){
	  Map<String, Object> map = new HashMap<String, Object>();
	  int count = categoryMapper.countTypeAll("%"+"男"+"%");
	  map.put("type", "%"+"男"+"%");
	  map.put("page", 0);
	  map.put("size", 4);
	  List<Category> list = categoryMapper.findAllCategoryAccount(map);
	  System.out.println("count:"+count);
     for (Category category : list) {
		System.out.println(category);
		
	}
  }
}
