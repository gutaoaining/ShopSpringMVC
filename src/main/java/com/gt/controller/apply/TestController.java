package com.gt.controller.apply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gt.model.Account;
import com.gt.services.base.TestServiceI;
import com.sun.tools.internal.ws.processor.model.Model;


@Controller

public class TestController {
	@Autowired
	 private TestServiceI testService;
//	 @RequestMapping(value = "index")
//     public String test(){
//		 System.out.println();
//    	 return "pages/index";
//     }
	 @RequestMapping(value = "index")
     public String test(){
		 System.out.println();
    	 return "main/aindex";
     }
	 @RequestMapping(value = "show")
     public ModelAndView add(String username){
	     ModelAndView user = new ModelAndView("pages/index");
	     user.addObject("name",username);
	     user.addObject("id","1212");
		 System.out.println("--------test---------");
		 Account account = testService.test();
		 System.out.println(account);
    	 return user;
	}
	 @RequestMapping(value="testJson")
	 @ResponseBody
	 public Account test(Account account){
		 System.out.println(account.getId());
		 System.out.println(account.getName());
		 account.setId(1);
		 account.setName("倪贝");
		 account.setLogin("nibei");
		 return account;
	 }
}
