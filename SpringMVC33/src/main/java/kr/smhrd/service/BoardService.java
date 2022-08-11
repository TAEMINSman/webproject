package kr.smhrd.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.model.BoardVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.Criteria;

@Service

public class BoardService {

	@Autowired
	private BoardMapper Service;
	
	//Business Layer 담당하는 클래스 
	
	//로직들을 다 가지고 있을수 있게끔 하는 클래스 
	
	// ex) if문,for문을 활용해서 작업, 
	
	//받아온 데이터들을 다른 형태로 바꿔주는 로직을 짜는 등등 
	//service 안쪽에는 RequestMapping 을 쓰지 않는다.! 
	// 요청 --> FC --> Controller(RequestMapping )--> Service --> Mapper --> /DB
	
	@Autowired
	private BoardMapper mapper;
	
	
	public List<BoardVO> boardListAjax() {
		//@ResponseBody
		// : 응답에 대한 제어권이 client에게 전부 되돌아간다.
		// : !!! converter가 로드가 되어있지 않으면 작동 불가능 !
		List<BoardVO> list = mapper.boardList();
		//List-> GSON ->JSON
		//List -> jackson-> JSON
		//스프링 프레임워크는 jackson 라이브러리를 로드해주기만 하면 
		// 자동으로 json 구조로 변환시켜준다.
		
		return list;
	}

	//게시물 수정
	public void boardInsertAjax(BoardVO vo) {
		mapper.BoardInsert(vo);
	}

	//게시물 삭제
	public void boradDelete(int idx) {

		mapper.boardDelete(idx);
	}

	//게시물 업데이트
	public void boardUpdate(BoardVO vo) {
		mapper.boardUpdate(vo);
	}
	//로그인 기능
	public MemberVO login(MemberVO vo) {
		MemberVO mvo = mapper.login(vo);
		System.out.print("service");
		System.out.println(mvo);
		return mvo;
		}

	//회원가입 기능
	public void join(MemberVO vo) {
		 mapper.join(vo);
	}
	
	public List<BoardVO> getPage(MemberVO vo) {
		
		List<BoardVO> list = mapper.getPage(vo.getName());
		
		return list;
	}

//  아이디 중복체크 
public int idCheck(MemberVO vo){
	
	int result = mapper.idCheck(vo);
	
	return result;
	
}

// 비밀번호 중복 체크 
public int pwCheck(MemberVO vo){
	
	int result = mapper.pwCheck(vo);
	
	return result;
}





public List<BoardVO> getListPaging(Criteria cri) {
	
	return mapper.getListPaging(cri);

}
/*게시판 목록(페이징 적용) */


public int getTotal() {
	
	return mapper.getTotal();
} 
}