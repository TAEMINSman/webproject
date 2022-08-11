package kr.smhrd.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.model.BoardVO;
import kr.smhrd.model.Criteria;
import kr.smhrd.model.Criteria;
import kr.smhrd.model.MemberVO;
import kr.smhrd.model.pageMakeDTO;
import kr.smhrd.model.pageMakeDTO;
import kr.smhrd.service.BoardService;

@RestController
public class BoardRESTController {

	@Autowired
	private BoardService Service;
	

	@RequestMapping("/boardListAjax.do")
	public List<BoardVO> boardListAjax() {
		//@ResponseBody
		// : 응답에 대한 제어권이 client에게 전부 되돌아간다.
		// : !!! converter가 로드가 되어있지 않으면 작동 불가능 !
		List<BoardVO> list = Service.boardListAjax();
		//List-> GSON ->JSON
		//List -> jackson-> JSON
		//스프링 프레임워크는 jackson 라이브러리를 로드해주기만 하면 
		// 자동으로 json 구조로 변환시켜준다.
		return list;
	}

	

	
	@RequestMapping("/getAjax.do")
	@ResponseBody
	public List<BoardVO> getAjax(HttpSession session) {
		
		MemberVO vo = (MemberVO)session.getAttribute("mvo");
		
		List<BoardVO> list = Service.getPage(vo);
		
		return list;
	 }
	

	
	
	@RequestMapping("/boardInsert.do")
	public void boardInsertAjax(BoardVO vo) {
		Service.boardInsertAjax(vo);
	}

	@RequestMapping("/boardDelete.do")
	public void boradDelete(int idx) {
		Service.boradDelete(idx);
	}

	@RequestMapping("/boardUpdate.do")
	public void boardUpdate(BoardVO vo) {
		Service.boardUpdate(vo);
	}
	
	@RequestMapping("/getListPaging.do")
	public Map boardListGET(Model model, Criteria cri) {
		Map map = new HashMap();
		
		List<BoardVO> list = Service.getListPaging(cri);
		
		int total = Service.getTotal();
		
		pageMakeDTO  pageMake = new pageMakeDTO(cri,total);
		map.put("list",list);
		map.put("pageMake", pageMake);
		
		System.out.println(list);
		System.out.println(pageMake);
		
		return map;
		}

	
	
}
