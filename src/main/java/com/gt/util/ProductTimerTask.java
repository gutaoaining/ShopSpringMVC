package com.gt.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gt.model.Category;
import com.gt.model.Product;
import com.gt.services.base.CategoryServiceI;
import com.gt.services.base.ProductServiceI;
/**
 * 
* @ClassName: ProductTimerTask 
* @Description: TODO(设置一个线程任务集，用来加载首页数据) 
* @author A18ccms a18ccms_gmail_com 
* @date 2015年10月10日 下午9:26:23 
*
 */
@Component("productTimerTask")
public class ProductTimerTask extends TimerTask{
    @Resource
	private ProductServiceI productService = null;
    @Resource
	private CategoryServiceI categoryService = null;
	ServletContext servletContext = null;

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}




	@Override
	public void run() {
	    List<List<Product>> alllist = new ArrayList<List<Product>>();
	    for (Category category : categoryService.getTypeByHot(1)) {
			alllist.add(productService.getProductByCid(category.getId()));
		}
	    getServletContext().setAttribute("alllist", alllist);
		
	//	System.out.println("-----run------");
	}
//	public static void main(String[] args) {
//		ProductTimerTask productTimerTask = new ProductTimerTask();
//		//这里设置为true意味着和其依赖的线程绑在一起，一起停，一起开始
//		new Timer(true).schedule(productTimerTask, 0, 1000);
//	}

}
