package com.example.comtroller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper.CountryMapper;
import com.example.model.Country;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/country")
public class CountryController {
  
	
	
	@Autowired
	CountryMapper mapper;
	
	@GetMapping("/list")
	void list(String continent, String region,Model model) {
		/*
		 * log.info("list...");
		 */		
		List<Country> list = null;
		
		if(continent == null || continent.trim().equals("")) {
			  list = mapper.selectAll();
			  	}
	    else {
		    	if (region == null || region .trim().equals("")){
		    		list = mapper.selectByContinent(continent);
		    }
		   
		    else {
		    	list = mapper.selectByContinentAndRegion(continent, region);	
		    }
		
	    }
		
		model.addAttribute("list", list);
		
		var continents = mapper.selectContinent();
		
		model.addAttribute("continents", continents);
		
	}
	
	@GetMapping("/region")
	@ResponseBody
	List<String> getRegions(String continent) {
		
		var regions = mapper.selectRegions(continent);
		return regions;
	}
	
} 
