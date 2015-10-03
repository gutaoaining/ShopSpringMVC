package com.gt.services.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gt.dao.AccountMapper;
import com.gt.model.Account;
import com.gt.services.base.AccountServiceI;
@Service("accountService")
public class AccountServiceImpl implements AccountServiceI {
	@Autowired
    private AccountMapper accountMapper;

	@Override
	public List<Account> findComboType() {
		List<Account> list = accountMapper.findComboType();
		return list;
	}
	

}
