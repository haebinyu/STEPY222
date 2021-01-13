package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dao.TravelPlanDao;
import com.bob.stepy.dto.TravelPlanDto;

import lombok.extern.java.Log;

@Service
@Log
public class TravelPlanService {
	@Autowired
	private HttpSession session;
	@Autowired
	private TravelPlanDao tDao;
	
	ModelAndView mv;
	
	//여행 일정 등록
	@Transactional
	public ModelAndView pRegPlan(TravelPlanDto plan) {
		log.info("pRegPlan() - service");
		String view = null;
		String msg = null;
		
		mv = new ModelAndView();
		
		try {
			tDao.pRegPlan(plan);
			
			
			mv.addObject("planNum", plan.getT_plannum());
			mv.addObject("planName", plan.getT_planname());
			mv.addObject("leader", plan.getT_id());
			mv.addObject("spot", plan.getT_spot());
			mv.addObject("start", plan.getT_stdate());
			mv.addObject("end", plan.getT_bkdate());
			mv.addObject("member1", plan.getT_member1());
			mv.addObject("member2", plan.getT_member2());
			mv.addObject("member3", plan.getT_member3());
			mv.addObject("member4", plan.getT_member4());
			mv.addObject("member5", plan.getT_member5());
			
			mv.setViewName("pPlanFrm");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("pMakePlanFrm");
		}
		
		return mv;
	}
}
