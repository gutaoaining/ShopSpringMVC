package com.gt.services.base;

import java.util.List;
import java.util.Map;

import com.gt.model.Product;

public interface ProductServiceI {

	public List<Product> queryProductAll(Map<String, Object> map);

	public int countProductAll(String name);

	public void deleteProduct(Integer[] idkey);

	public void saveProduct(Product product);

	public void updateProduct(Product product);
	
	public List<Product> getProductByCid(int cid);
	
}
