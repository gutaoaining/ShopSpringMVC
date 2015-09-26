package com.gt.controller.apply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gt.model.Account;
import com.gt.services.base.AccountServiceI;
import com.gt.services.base.CategoryServiceI;
import com.sun.tools.internal.ws.processor.model.Model;


@Controller

public class CategoryController {
	@Autowired
	 private CategoryServiceI categoryService;
	 @RequestMapping(value = "categoryquery")
     public String test(){
		 System.out.println(categoryService.test());
    	 return "category/query";
     }

}
