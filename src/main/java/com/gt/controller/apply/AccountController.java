package com.gt.controller.apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gt.model.Account;
import com.gt.model.Category;
import com.gt.services.base.AccountServiceI;
import com.sun.tools.internal.ws.processor.model.Model;


@Controller
public class AccountController {
	@Autowired
	private AccountServiceI accountService;
	@RequestMapping(value = "comboType")
	@ResponseBody
    public List<Account> accountType(){
		System.out.println("test Account");
		 List<Account> list = accountService.findComboType();
		 for (Account account : list) {
			System.out.println(account);
		}
	     return list;
    }
	 
}
