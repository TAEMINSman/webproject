package kr.smhrd.model;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {


	private String id;
	private String pw;
	private String name;
	private String mail;
	private String addr1;
	private String addr2;
	private String addr3;
	public List<BoardVO> addAttribute(String string, List<BoardVO> listPageing) {
		// TODO Auto-generated method stub
		return null;
	}
	
}

