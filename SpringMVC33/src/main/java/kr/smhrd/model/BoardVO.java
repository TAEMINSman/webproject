package kr.smhrd.model;

import lombok.Data;

@Data
public class BoardVO {


	private int idx;
	private String title;
	private String writer;
	private String indate;
	private String contents;
	private String id;
	//★★★★★★★★ 반드시 table 컬럼명과 class 의 field명을 일치 시킬것 
	
	
	
	
	
}

