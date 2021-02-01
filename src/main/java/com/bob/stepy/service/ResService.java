package com.bob.stepy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.dao.ResDao;
import com.bob.stepy.dto.ProductDto;
import com.bob.stepy.dto.StoreDto;

import lombok.extern.java.Log;

@Log
@Service
public class ResService {
	
	// Dao 객체
	@Autowired
	private ResDao rDao;
	
	// ModelAndView 객체
	private ModelAndView mv;
	
	
	
	// 예약하려는 가게 정보, 상품(룸) 정보 가져오기
	public ModelAndView getStoreInfo(String cnum, Integer plnum) {
		log.info("getStoreInfo() cnum : " + cnum + ", plnum : " + plnum);
		
		mv = new ModelAndView();
		
		StoreDto store = rDao.getStoreInfo(cnum);
		ProductDto product = rDao.getProductInfo(plnum);
		
		mv.addObject("store", store);
		mv.addObject("product", product);
		
		mv.setViewName("rReservation");
		
		return mv;
	}

}
