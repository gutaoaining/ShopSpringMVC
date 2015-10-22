package com.gt.listener;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gt.services.base.ProductServiceI;
import com.gt.util.ProductTimerTask;

public class Initlistener implements ServletContextListener {
//	private ProductServiceI productService = null;
	ApplicationContext applicationContext = null;
	private ProductTimerTask productTimerTask = null;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		//解决方案一:通过直接拿配置文件来获得service,但是并不好，因为加载了两次配置文件
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring.xml","classpath:spring-hibernate.xml");
//      productService = (ProductServiceI)applicationContext.getBean("productService");
//      System.out.println("-------------自己的监听器："+productService);
	    //解决方案二:项目在启动时把spring配置文件通过配置加载，存储了servletContext,只需要获取就可以了
		  //这里key值有点长，不方便
//		ApplicationContext applicationContext =(ApplicationContext)sce.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
//		productService = (ProductServiceI)applicationContext.getBean("productService");
//		System.out.println("---------productService:"+productService);
//		//解决方案三:利用spring提供的一个工具类
//		ApplicationContext applicationContext =(ApplicationContext)WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
//	    productService = (ProductServiceI)applicationContext.getBean("productService");
//	    System.out.println("----------productService:"+productService);
	    applicationContext = (ApplicationContext)WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
	    productTimerTask = (ProductTimerTask)applicationContext.getBean("productTimerTask");
	    productTimerTask.setServletContext(sce.getServletContext());
	    new Timer(true).schedule(productTimerTask, 0, 1000*60*60);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

}
