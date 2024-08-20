package com.web.hchnd.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Data 
public class BoardVO {
	private int no;//카테고리 구분 없는 번호
	private String uid;
	private String ip;
	private String subject;
	private String content;
	private int hit;
	private String writedate;	
	private boolean hidden;
	private String category;//카테고리
}
