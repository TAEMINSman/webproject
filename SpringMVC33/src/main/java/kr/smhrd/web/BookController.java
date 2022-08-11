package kr.smhrd.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.smhrd.model.MemberVO;

@Controller
public class BookController {

	
	
	private static final Logger logger = LoggerFactory.getLogger(BookController.class);
		
	//메인 페이지 이동
		@RequestMapping(value = "/shop", method = RequestMethod.GET)
		public void mainPageGET() {
			
			logger.info("/shop");
			
		}
		
	

	}

