package com.gt.controller.apply;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SendPage {
	 @RequestMapping(value = "categorySendPage")
     public String sendPage(){
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
}
