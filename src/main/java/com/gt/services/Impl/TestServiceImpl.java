package com.gt.services.Impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.gt.dao.AccountMapper;
import com.gt.model.Account;
import com.gt.services.base.TestServiceI;

public class TestServiceImpl implements TestServiceI {
	@Autowired
    private AccountMapper accountMapper;
	@Override
	public Account test() {
		// TODO Auto-generated method stub
        return accountMapper.selectByPrimaryKey(1);
	}

}
