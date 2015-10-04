package com.gt.controller.base;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.gt.services.base.AccountServiceI;
import com.gt.services.base.CategoryServiceI;
import com.gt.services.base.ProductServiceI;

@Controller
public class BaseController {
	protected Map<String, Object> map =null;
	@Autowired
	 protected CategoryServiceI categoryService;
	@Autowired
	protected ProductServiceI productService;
	@Autowired
	protected AccountServiceI accountService;
    public void writeJson(Object obj , HttpServletResponse response){
    	String json = JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss");
    	try {
    		response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
}
