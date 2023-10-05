package com.example.comtroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homecontroller {
	
	@GetMapping
	String home() {
		return"home";
	}
	
}
