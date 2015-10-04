package com.gt.services.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gt.dao.ProductMapper;
import com.gt.model.Product;
import com.gt.services.base.ProductServiceI;
@Service("productService")
public class ProductServiceImpl implements ProductServiceI {
	@Autowired
    private ProductMapper productMapper;

	@Override
	public List<Product> queryProductAll(Map<String, Object> map) {
		List<Product> list = productMapper.findAllProductCategory(map);
		return list;
	}

	@Override
	public int countProductAll(String name) {
		int count = productMapper.countProductAll(name);
		return count;
	}

	@Override
	public void deleteProduct(Integer[] idkey) {
		productMapper.delProduct(idkey);
	}

	@Override
	public void saveProduct(Product product) {
		productMapper.insertSelective(product);
	}

	@Override
	public void updateProduct(Product product) {
		productMapper.updateByPrimaryKey(product);
	}

}
