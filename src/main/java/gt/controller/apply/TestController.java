package gt.controller.apply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {
	 @RequestMapping(value = "index")
    public String test(){
		 System.out.println();
    	 return "index";
     }
}
