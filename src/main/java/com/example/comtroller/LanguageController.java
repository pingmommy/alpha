package com.example.comtroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.mapper.LanguageMapper;

@Controller
@RequestMapping("/language")
public class LanguageController {

	@Autowired
	LanguageMapper mapper;
	
	@GetMapping("/list")
	void selectAll(Model model) {
		var list = mapper.selectAll();
		model.addAttribute("list",list);
	}
}
