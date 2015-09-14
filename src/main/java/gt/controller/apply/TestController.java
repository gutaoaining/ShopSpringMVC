package gt.controller.apply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller

public class TestController {
	 @RequestMapping(value = "index")
     public String test(){
		 System.out.println();
    	 return "index";
     }
	 @RequestMapping(value = "show")
	    public ModelAndView add(String username){
		     ModelAndView user = new ModelAndView("index");
		     user.addObject("name",username);
		     user.addObject("id","1212");
			 System.out.println("--------test---------");
	    	 return user;
	     }
}
