package com.example.comtroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.CityMapper;
import com.example.model.City;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j   //lombok이 자동으로 로거를 만들어준다. 
@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper citymapper; //DI - 의존주입
	
	//("xxxx 팩키지명을 씁니다. 어느 패키지에서 나온 메소드인지 나옵니다.") 근데 매번 같은 코드를 반복해서 작성해야 해서 lombok을 쓴다. 
	// 프린트로 로그를 찍을 수 있지만 로그가 많아지만 뭐가 뭔지 헷갈린다. 이 때 로그를 쓰면 어느 패키지의 소속인지 명확하게 알 수 있다. 
	// system.out.print()로 하면 시간 등의 정보 출력에 제한이 있어서 보통 log 클래스/ 라이브러리를 쓴다. 
	// 로그를 쓰는 이유는 맵핑한 곳으로 요청이 잘 들어오는지 확인
	
	//static final Logger log = LoggerFactory.getLogger(CityController.class);
	
	
//	String selectall2(String cityname, String district, HttpServletRequest request) { //IoC(Inversion of Control) -제어역전
//		
//		
//		var list = citymapper.selectAll();
//		log.info("list...");
//		
//		list = citymapper.selectCity(cityname,district);
//		
//		request.setAttribute("list", list);
//		return"city/list";
//	}
	@GetMapping("/list")
   String list(Long population, String code, Model model) { //IoC(Inversion of Control) -제어역전
		log.info("list...");
		
		List<City> list = null;
		
//		if(code == null || code.trim().equals("")) {
//		  list = citymapper.selectAll();
//		}
//		 else {
//		  list = citymapper.selectByCode(code);
//		}
		
		list = citymapper.searchAll(code, population);
		
		model.addAttribute("list", list);
		
		var codes =  citymapper.selectCountryCodes();
		model.addAttribute("codes",codes);
		
		return"city/list";
	}
}
