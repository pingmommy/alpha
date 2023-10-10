package com.example.comtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mapper.DeptMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DeptController {
	
	@Autowired
	DeptMapper mapper; //(Dependency Injection)
	
	
	@GetMapping("/dept/list")
	String list(HttpServletRequest request) {
		
	    var search =request.getParameter("search"); 
	    
	    
		
		//var list = mapper.selectAll();
	    var list = mapper.selectByDname(search);
		
		request.setAttribute("list", list);
		
		return "dept/list";
	}
	
	
	
}
