package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.dao.TravelPlanDao;

@Service
public class TravelPlanService {
	@Autowired
	private HttpSession session;
	@Autowired
	private TravelPlanDao tDao;
	
	ModelAndView mv;
}
