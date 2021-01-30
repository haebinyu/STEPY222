package com.bob.stepy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.service.ResService;

import lombok.extern.java.Log;

@Log
@Controller
public class ResController {
	
	// 서비스 객체
	@Autowired
	private ResService rServ;
	
	// ModelAndView 객체
	private ModelAndView mv;
	
	
	
	// 예약하려는 가게 정보, 상품(룸) 정보 가져오기
	@GetMapping("rReservation")
	public ModelAndView getStoreInfo(String cnum, Integer plnum) {
		log.info("getStoreInfo() cnum : " + cnum + ", plnum : " + plnum);
		
		mv = rServ.getStoreInfo(cnum, plnum);
		
		return mv;
	}
	
}
