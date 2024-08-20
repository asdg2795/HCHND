package com.web.hchnd.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
public class AccountVO {
    private String UID;
    private String nickname;
    private String emailID;
    private String pwd;
    private String createDate;
    private String lastUpDate;
}
