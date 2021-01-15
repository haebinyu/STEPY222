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
	
	//여행 일정 만들기 페이지 이동
	@GetMapping("pMakePlanFrm")
	public String pMakePlanFrm() {
		log.info("controller - pMakePlanFrm()");
		
		return "pMakePlanFrm";
	}
	
	//여행 일정 등록
	@PostMapping("pRegPlan")
	public ModelAndView pRegPlan(TravelPlanDto plan, RedirectAttributes rttr) {
		log.info("controller - pRegPlan()");
		
		return tServ.pRegPlan(plan, rttr);
	}
	
	//여행 목록 페이지 이동
	@GetMapping("pPlanList")
	public ModelAndView pPlanList(String id) {
		log.info("controller - pPlanList()");
		//여행 정보 가져오기
		mv = tServ.pPlanList(id);
		
		return mv;
	}
	
	//여행 내용 페이지 이동
	@GetMapping("pPlanFrm")
	public ModelAndView pPlanFrm(int planNum) {
		log.info("controller - pPlanFrm()");
		
		return tServ.pPlanFrm(planNum);
	}
	
	//가계부 페이지 이동
	@GetMapping("pHouseholdFrm")
	public String pHouseholdFrm(int planNum) {
		log.info("controller - pHouseholdFrm()");
		
		return "pHouseholdFrm";
	}
	
	//체크리스트 페이지 이동
	@GetMapping("pCheckSupFrm")
	public String pCheckSupFrm(int planNum) {
		log.info("controller - pCheckSupFrm()");
		
		return "pCheckSupFrm";
	}
	
}
