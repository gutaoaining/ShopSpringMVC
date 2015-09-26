package com.gt.services.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gt.dao.AccountMapper;
import com.gt.dao.CategoryMapper;
import com.gt.model.Account;
import com.gt.model.Category;
import com.gt.services.base.AccountServiceI;
import com.gt.services.base.CategoryServiceI;
@Service("categoryService")
public class CategoryServiceImpl implements CategoryServiceI {
	@Autowired
    private CategoryMapper categoryMapper;
	@Override
	public Category test() {
		// TODO Auto-generated method stub
        return categoryMapper.selectByPrimaryKey(1);
	}

}
