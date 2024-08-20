package com.web.hchnd.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor
public class ProgramGenVO {
	   
	   // strLift	//스쿼트, 벤치 , 데드, 바벨로우 , 오버헤드프레스
	   // GVT10*10	//덤벨프레스, 친업, 스쿼트, 레그컬, 오버헤드프레스, 바벨 컬
	   // texas	// 스쿼트, 벤치, 데드, 오버헤드프레스, 친업, 글루트 햄 레이즈
	   
	   
	   
	   private String startDate;

 
	   private String prgname; // 이전페이지에서 받아올 값
	   private String exerciseDay;
	   private String exercise;
	   private double vol;
	   private int reps;
	   private int sets;
	   private String UID; // UID
	   private String UTP; // UTP = UIP + 프로그램이름 + 날짜
	   //
	   
	  
	   private double Squat;
	   private double BenchPress;
	   private double OverHeadPress;
	   private double DeadLift;
	   private double BarbellRow;
	   
	   private double DumbellPress;
	   private double LegCurl;
	   private double BarbellCurl;
	   
}
