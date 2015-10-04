package com.gt.dao;

import java.util.List;
import java.util.Map;

import com.gt.model.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeyWithBLOBs(Product record);

    int updateByPrimaryKey(Product record);
    
    List<Product> findAllProductCategory(Map<String, Object> map);
    
    int countProductAll(String name);

	int delProduct(Integer[] idkey);
}