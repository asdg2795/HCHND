package com.web.hchnd.vo;

import lombok.Data;

@Data
public class BoardReplyVO {
   private int replyno;
   private int articleno;
   private String uid;
   private String comment;
   private String writedate;
}
