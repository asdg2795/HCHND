package com.web.hchnd.service;

import com.web.hchnd.vo.AccountVO;

public interface AccountService {
    public String lastUID(String state);

    public int temporaryAccount(AccountVO vo);

    public int emailCheck(String emailID);
    public int updateAuth(String UID, String tmp);
    public AccountVO loginAction(String emailID);

}
