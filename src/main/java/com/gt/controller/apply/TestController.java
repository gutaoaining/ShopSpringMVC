package com.gt.controller.apply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gt.model.Account;
import com.gt.services.base.TestServiceI;


@Controller

public class TestController {
	@Autowired
	 private TestServiceI testService;
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
		 Account account = testService.test();
		 System.out.println(account);
    	 return user;
	}
}
