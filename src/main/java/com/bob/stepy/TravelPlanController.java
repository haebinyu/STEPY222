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
		log.info("pMakePlanFrm() - 페이지 이동");
		
		return "pMakePlanFrm";
	}
	
	@PostMapping("pRegPlan")
	public ModelAndView pRegPlan(TravelPlanDto plan) {
		log.info("pRegPlan() - controller");
		
		mv = tServ.pRegPlan(plan);
		
		return mv;
	}
	
}
