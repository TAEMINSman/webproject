package kr.smhrd.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class FileService {

	public Map upload(MultipartHttpServletRequest multipart, String path) {

		//1. multipart안에서 데이터를 하나씩 꺼내와서 정제
	Enumeration<String>data = multipart.getParameterNames();
		
	//2. data안에는 parametername 값들이 하나씩 들어가 있다 
	//데이터가 있을때까지 반복시켜줌 hasMoreElements
	
	Map map = new HashMap();
	while(data.hasMoreElements()) {
		//data 데이터를 -> key로 변수 선언 
		String key = data.nextElement();
		// 선언된 key 값 -> return 타입 value 로  선언
		String value = multipart.getParameter(key);
		//put -> 데이터를 집어넣을때 사용 
		map.put(key, value);
		
		//multipart에서 하나씩 꺼내서 리턴 해주는 방식 
		
	}
	
	// input type = "text" / "password" 코드 
	
	///////////////////////////////////////
	
	
	//3. file 들도 하나씩 가져와서 정제하는 작업
	// 반복시킬때 용이하게 사용할수 있음 
	Iterator<String> it = multipart.getFileNames();
	List<String> list = new ArrayList<String>(); //파일 이름을 저장할 변수
	// 나중에 되돌려주기 위해 list 를 만들어줌 
	
	while(it.hasNext()) {
		//파일명칭 하나씩 가져오기 file1 file2 file3 
		String fileName = it.next();
		//실제 파일을 multipart로부터 꺼내오기 --> name값에 대응하는 value 꺼내오기
		MultipartFile realfile = multipart.getFile(fileName);
		
		//list 에 저장할수 있게끔 String 형식으로 변환
		String f = realfile.getOriginalFilename(); 
		list.add(f);  //-->result.jsp에 보내주기 위해서 저장하는 중! 
		
		//파일 업로드
		File file =  new File(path+"\\"+f);
		
		//파일이 존재하는지 여부 체크 
		// 실제 존재하는 파일일 경우에만 업로드 하게 끔 만드는 형식
		
		if(realfile.getSize()!= 0);{
			try {
				realfile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	 map.put("fileList", list);
	
	//파일에 대한 정보+ input태그안에 들어있는 정보가 한번에 담겨져있는 자료
		return map;
	
	
	
	
	
	
	}
}
