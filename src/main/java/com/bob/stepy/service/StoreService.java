package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.dao.StoreDao;

import lombok.extern.java.Log;

@Service
@Log
public class StoreService {
	
	@Autowired
	private StoreDao stDao;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mv;		
		
	//사업자번호 중복체크
	public String stIdCheck(String c_num) {
		log.info("stIdCheck() cnum: " + c_num);
			
		String result = null;
		int cnt = stDao.stIdCheck(c_num); // 0 OR 1
			
		if(cnt == 0) {
			result = "success";
		} else {
			result = "fail";
		}
		return result;
	}

}
