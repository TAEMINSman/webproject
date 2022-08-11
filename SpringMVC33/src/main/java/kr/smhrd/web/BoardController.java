package kr.smhrd.web;

//import java.util.List;
//import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.model.BoardVO;
import kr.smhrd.model.MemberVO;
import kr.smhrd.service.BoardService;


@Controller
public class BoardController {

	@Autowired // DI
	private BoardService service;
	
	// RequestMapping
	@RequestMapping("/")
	public String main() {

		return "main";

	}
	
	@RequestMapping("/basic.do")
	public String basic() {

		return "basic";

	}
	@RequestMapping("/result.do")
	public String result() {

		return "result";

	}
	//회원가입 페이지 
	@RequestMapping("/member.do")
	public String member() {

		return "member";

	}
	//회원가입 기능 
	@RequestMapping("/join.do") // 요청받는 프로토콜 주소
	public String join(MemberVO vo, HttpSession session) {
		service.join(vo);
		return "redirect:/basic.do";
	}

	@RequestMapping("/login.do") // 요청받는 프로토콜 주소
	public String login(MemberVO vo, HttpSession session) {

		// 수집해야할 파라미터 -> id,pw -> 하나로 묶을수 있는 자료형 생성
		// 파라미터 수집
		// 매개변수에 받아오겠다 ! 라고 작성하면 spring framework 가 자동으로 수집해준다.
		// 로그인 하는 기능을 수행
		MemberVO mvo = service.login(vo);
		System.out.println(mvo);
		// session 하나를 받아와서 로그인한 상태를 유지
		session.setAttribute("mvo", mvo);
		return "redirect:/";
	}
	//로그 아웃 기능 
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate(); // 무효화

		return "redirect:/";
	}
	
	@RequestMapping("/get.do")
	public String get() {
		
		return "get";
	}
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(MemberVO vo) {
		int result = service.idCheck(vo);
		return result;
	}
	@RequestMapping("/pwCheck.do")
	@ResponseBody
	public int pwCheck(MemberVO vo) {
		int result = service.pwCheck(vo);
		return result;
	

	}

	
	}
