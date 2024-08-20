package com.web.hchnd.mapper;

import com.web.hchnd.vo.AccountVO;

public interface AccountMapper {
    /*회원 가입*/
    public String lastUID(String state);
    public int temporaryAccount(AccountVO vo);
    public int emailCheck(String emailID);
    public int updateAuth(String UID, String tmp);
    public AccountVO loginAction(String emailID);
}
