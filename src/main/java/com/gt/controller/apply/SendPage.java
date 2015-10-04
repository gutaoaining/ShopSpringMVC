package com.gt.controller.apply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendPage {
	
	 @RequestMapping(value = "aindex")
     public String index(){
		 System.out.println();
    	 return "main/aindex";
     }
	 @RequestMapping(value = "categoryPage")
     public String categoryPage(){
    	 return "category/query";
     }
	 @RequestMapping(value = "categoryAddPage")
     public String sendAddPage(){
    	 return "category/save";
     }
	 @RequestMapping(value = "categoryUpdatePage")
     public String sendUpdatePage(){
    	 return "category/update";
     }
	 
	 @RequestMapping(value = "ProductPage")
     public String ProductPage(){
    	 return "product/query";
     }
	 @RequestMapping(value = "ProductSavePage")
     public String ProductSavePage(){
    	 return "product/save";
     }
}
