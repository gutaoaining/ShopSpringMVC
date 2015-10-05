package sqlTest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gt.dao.AccountMapper;
import com.gt.dao.CategoryMapper;
import com.gt.model.Account;
import com.gt.model.Category;
import com.gt.services.base.AccountServiceI;
import com.gt.services.base.CategoryServiceI;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:applicationContext.xml", "classpath*:spring.xml" })
public class TestAccount {
//	  @Autowired
//	   protected AccountMapper accountMapper;
//	  @Test
//	   public void testComboType(){
//		  List<Account> list = accountMapper.findComboType();
//		  for (Account account : list) {
//			System.out.println(account);
//		}
//	   }
}
