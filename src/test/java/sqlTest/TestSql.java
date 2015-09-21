package sqlTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gt.dao.CategoryMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext.xml", "classpath*:spring.xml" })
public class TestSql {
  @Autowired
   private CategoryMapper CategoryMapper;
  @Test
   public void test1(){
	  System.out.println(CategoryMapper.selectByPrimaryKey(1));
   }
}
