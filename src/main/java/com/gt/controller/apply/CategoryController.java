package com.gt.controller.apply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gt.controller.base.BaseController;
import com.gt.model.Category;
import com.gt.model.Page;
import com.gt.services.base.CategoryServiceI;



@Controller

public class CategoryController extends BaseController{
	@Autowired
	 private CategoryServiceI categoryService;
//	 @RequestMapping(value = "categoryQueryAll")
//	 @ResponseBody
//     public Map<String, Object> queryCategory(Page page){
//		 int total = categoryService.countTypeAll("%"+page.getKeyword()+"%");
//	     map = new HashMap<String,Object>();
//	     Map<String , Object> mapquery = new HashMap<String,Object>();
//	     mapquery.put("type", "%"+page.getKeyword()+"%");
//	     mapquery.put("page", (page.getPage()-1)*page.getRows());
//	     mapquery.put("size", page.getRows());
//	     List<Category> list = categoryService.queryCategoryAll(mapquery);
//	     map.put("total", total);
//	     map.put("rows", list);
//    	 return map;
//     }
	 @RequestMapping(value = "categoryQueryAll")
     public void queryCategory(Page page,HttpServletResponse response){
		 int total = categoryService.countTypeAll("%"+page.getKeyword()+"%");
		 map = new HashMap<String,Object>();
	     List<Category> list = categoryService.queryCategoryAll(page(page));
	     map.put("total", total);
	     map.put("rows", list);
    	 writeJson(map, response);
     }
	 @RequestMapping(value = "categoryDel")
	 @ResponseBody
     public boolean delCategory1(Page page){
    	 categoryService.deleteCategory(page.getIdkey());
		 return true;
     }
	 public Map<String, Object> page(Page page){
		 System.out.println("page test");
	     Map<String , Object> mapquery = new HashMap<String,Object>();
	     mapquery.put("type", "%"+page.getKeyword()+"%");
	     mapquery.put("page", (page.getPage()-1)*page.getRows());
	     mapquery.put("size", page.getRows());
	     return mapquery;
	 }

}
