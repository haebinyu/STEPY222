package com.bob.stepy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.TravelPlanDto;
import com.bob.stepy.service.TravelPlanService;

import lombok.extern.java.Log;

@Controller
@Log
public class TravelPlanController {
	
	@Autowired
	TravelPlanService tServ;
	
	ModelAndView mv;
	
	@GetMapping("pMakePlanFrm")
	public String pMakePlanFrm() {
		log.info("controller - pMakePlanFrm()");
		
		return "pMakePlanFrm";
	}
	
	@PostMapping("pRegPlan")
	public ModelAndView pRegPlan(TravelPlanDto plan, RedirectAttributes rttr) {
		log.info("controller - pRegPlan()");
		
		return tServ.pRegPlan(plan, rttr);
	}
	
	@GetMapping("pPlanList")
	public ModelAndView pPlanList(String id) {
		log.info("controller - pPlanList()");
		//여행 정보 가져오기
		mv = tServ.pPlanList(id);
		
		return mv;
	}
	
	@GetMapping("pPlanFrm")
	public ModelAndView pPlanFrm(int planNum) {
		log.info("controller - pPlanFrm()");
		
		return tServ.pPlanFrm(planNum);
	}
	
}
