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

@Slf4j  
@Controller
@RequestMapping("/city")
public class CityController {
	
	@Autowired
	CityMapper citymapper; 
	
	@GetMapping("/list")
   String list(Long population, String code, Model model) { 
		log.info("list...");
		
		List<City> list = null;

		list = citymapper.searchAll(code, population);
		
		model.addAttribute("list", list);
		
		var codes =  citymapper.selectCountryCodes();
		model.addAttribute("codes",codes);
		
		return"city/list";
	}
}
