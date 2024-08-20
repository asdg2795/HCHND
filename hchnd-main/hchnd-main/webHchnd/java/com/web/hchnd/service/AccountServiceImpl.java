package com.web.hchnd.service;

import com.web.hchnd.mapper.AccountMapper;
import com.web.hchnd.vo.AccountVO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class AccountServiceImpl implements AccountService {
    @Inject
    AccountMapper mapper;

    @Override
    public String lastUID(String state) {
        return mapper.lastUID(state);
    }

    @Override
    public int temporaryAccount(AccountVO vo) {
        return mapper.temporaryAccount(vo);
    }

    @Override
    public int emailCheck(String emailID) {
        return mapper.emailCheck(emailID);
    }

    @Override
    public int updateAuth(String UID, String tmp) {
        return mapper.updateAuth(UID, tmp);
    }

    @Override
    public AccountVO loginAction(String emailID) {
        return mapper.loginAction(emailID);
    }

}
