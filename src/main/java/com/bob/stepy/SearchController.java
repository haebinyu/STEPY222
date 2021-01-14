package com.bob.stepy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class SearchController {
	
	// 검색 페이지 이동
	@GetMapping("searchFrm")
	public String searchFrm() {
		log.info("searchFrm()");
		
		return "searchFrm";
	}

}
