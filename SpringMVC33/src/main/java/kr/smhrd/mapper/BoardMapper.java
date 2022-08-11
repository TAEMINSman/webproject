package kr.smhrd.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.smhrd.model.BoardVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.Criteria;

public interface BoardMapper {
	//리턴타입을 정하면 끝
	
	public List<BoardVO> boardList();

	public void BoardInsert(BoardVO vo);

	@Delete("delete from board2 where idx =#{idx}")
	public void boardDelete(int idx);

	public void boardUpdate(BoardVO vo);
	// 회원정보 전체를 불러오기
	@Select("select * from board3 where id=#{id} and pw=#{pw}")
	public MemberVO login(MemberVO vo);

	public int idCheck(MemberVO vo);

	public int pwCheck(MemberVO vo);

	public void join(MemberVO vo);
	
	public List<BoardVO> getPage(String name);
	//페이징
	public List<BoardVO> getListPaging(Criteria cri);
	
	//게시판 총 개수 
	public int getTotal();

}	
