package com.bob.stepy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.service.SearchService;

import lombok.extern.java.Log;

@Log
@Controller
public class SearchController {
	
	// ModelAndView
	private ModelAndView mv;
	
	// 서비스 객체
	@Autowired
	private SearchService sServ;
	
	
	
	// 검색 페이지 이동
	@GetMapping("sSearchFrm")
	public String sSearchFrm() {
		log.info("sSearchFrm()");
		
		return "sSearchFrm";
	}
	
	
	// 숙소 검색
	@GetMapping("searchHotel")
	public ModelAndView searchHotel(String keyword) {
		log.info("searchHotel()");
		
		mv = sServ.searchHotel(keyword);
		
		return mv;
	}
	
	
	// 음식점 검색
	@GetMapping("searchRestaurant")
	public ModelAndView searchRestaurant(String keyword) {
		log.info("searchRestaurant()");
		
		mv = sServ.searchRestaurant(keyword);
		
		return mv;
	}
	
	
	// 지역시설 검색
	@GetMapping("searchPlay")
	public ModelAndView searchPlay(String keyword) {
		log.info("searchPlay()");
			
		mv = sServ.searchPlay(keyword);
			
		return mv;
	}

}
