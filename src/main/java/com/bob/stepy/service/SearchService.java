package com.bob.stepy.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.dao.SearchDao;
import com.bob.stepy.dto.StoreDto;

import lombok.extern.java.Log;

@Log
@Service
public class SearchService {
	
	// DAO 객체
	@Autowired
	private SearchDao sDao;
	
	// ModelAndView 객체
	private ModelAndView mv;
	
	// 세션 객체
	@Autowired
	private HttpSession session;
	
	
	// 숙소 검색
	public ModelAndView searchHotel(String keyword) {
		log.info("searchHotel()");
		
		mv = new ModelAndView();

		if(keyword != "") {
			List<StoreDto> sList = sDao.searchHotel(keyword);
			
			mv.addObject("sList", sList); // DB에서 조회한 데이터 목록을 모델에 추가
			mv.setViewName("sSearchFrm");
				
			if(sList.isEmpty()) {
				mv.addObject("msg", "검색 결과가 없습니다.");
				mv.setViewName("sSearchFrm");
			}
		}
		
		else {
			mv.addObject("msg", "검색할 키워드를 입력해주세요.");
			mv.setViewName("sSearchFrm");
		}
		
		return mv;
	}
	
	
	// 음식점 검색
	public ModelAndView searchRestaurant(String keyword) {
		log.info("searchRestaurant()");
		
		mv = new ModelAndView();
		
		if(keyword != "") {
			List<StoreDto> sList = sDao.searchRestaurant(keyword);
			
			mv.addObject("sList", sList); // DB에서 조회한 데이터 목록을 모델에 추가
			mv.setViewName("sSearchFrm");
				
			if(sList.isEmpty()) {
				mv.addObject("msg", "검색 결과가 없습니다.");
				mv.setViewName("sSearchFrm");
			}
		}
		
		else {
			mv.addObject("msg", "검색할 키워드를 입력해주세요.");
			mv.setViewName("sSearchFrm");
		}
		
		return mv;
	}
	
	
	// 지역시설 검색
	public ModelAndView searchPlay(String keyword) {
		log.info("searchPlay()");
		
		mv = new ModelAndView();
		
		if(keyword != "") {
			List<StoreDto> sList = sDao.searchPlay(keyword);
			
			mv.addObject("sList", sList); // DB에서 조회한 데이터 목록을 모델에 추가
			mv.setViewName("sSearchFrm");
				
			if(sList.isEmpty()) {
				mv.addObject("msg", "검색 결과가 없습니다.");
				mv.setViewName("sSearchFrm");
			}
		}
		
		else {
			mv.addObject("msg", "검색할 키워드를 입력해주세요.");
			mv.setViewName("sSearchFrm");
		}
		
		return mv;
	}
	
}
