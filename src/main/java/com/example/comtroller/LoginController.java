package com.example.comtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.mapper.MemberMapper;

@Controller
public class LoginController {
	
	@GetMapping("/login")
	void login(){
		
	}
	
	@GetMapping("/register")
	void register(){
		
	}
	
	@Autowired
	MemberMapper mapper;
	
	@PostMapping("/signup")
	String register(String id, String password) {
		var list = mapper.insert(id, password, "USER");
		return "redirect:/login";
	}

}
