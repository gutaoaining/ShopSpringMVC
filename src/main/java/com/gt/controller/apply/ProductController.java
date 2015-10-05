package com.gt.controller.apply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gt.controller.base.BaseController;
import com.gt.model.Product;
import com.gt.model.FileImage;
import com.gt.model.Page;
import com.gt.services.base.CategoryServiceI;



@Controller
public class ProductController extends BaseController{

	 @RequestMapping(value = "productQueryAll")
     public void queryProduct(Page page,HttpServletResponse response){
		 int total = productService.countProductAll("%"+page.getKeyword()+"%");
		 map = new HashMap<String,Object>();
	     List<Product> list = productService.queryProductAll(page(page));
	     map.put("total", total);
	     map.put("rows", list);
    	 writeJson(map, response);
     }
	 @RequestMapping(value = "productDel")
	 @ResponseBody
     public boolean delProduct(Page page){
		 System.out.println(page.getIdkey());
    	 productService.deleteProduct(page.getIdkey());
		 return true;
     }
	 @RequestMapping(value = "productSave")
	 @ResponseBody
     public boolean saveProduct(Product product){    	 
		 System.out.println("获得商品信息："+product);
		// String fileName = uploadfile.getOriginalFilename();  
		 //System.out.println("获得上传文件名："+fi);
		 //productService.saveProduct(product);
		 return true;
     }
	 @RequestMapping(value = "productUpdate")
	 @ResponseBody
     public boolean updateProduct(Product product){
		 System.out.println(product.getName());
		 System.out.println(product.getId());
    	 productService.updateProduct(product);
		 return true;
     }
	 public Map<String, Object> page(Page page){
	     Map<String , Object> mapquery = new HashMap<String,Object>();
	     mapquery.put("name", "%"+page.getKeyword()+"%");
	     mapquery.put("page", (page.getPage()-1)*page.getRows());
	     mapquery.put("size", page.getRows());
	     return mapquery;
	 }
	 

}
