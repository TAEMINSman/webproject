package kr.smhrd.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.smhrd.service.FileService;

@Controller
public class FileController {
	
@Autowired
public FileService service;
	
	//단순하게 uploadform.jsp를 실행 시킬수 있는 메소드
	@RequestMapping("/form.do")
	public String formUpload(){

		
		return "uploadForm";
	}
	//파일 업로드하는 기능 수행
	@RequestMapping("/upload.do")
	public String upload(MultipartHttpServletRequest multipart, HttpServletRequest request, Model model){
		//multipart : form 태그에서 보내주는 데이터가 담겨져있는것
		//request : 저장할 경로를 현재 프로젝트 경로로 잡아주려고 받아오는것
		//1. 저장할 경로 지정하기
		String path = request.getServletContext().getRealPath("resources/file");
		System.out.println("경로 : " +path);
		
		Map map = service.upload(multipart, path);
		model.addAttribute("map", map);
		return "result";
	}
}
