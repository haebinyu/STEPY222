package com.bob.stepy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.AccompanyPlanDto;
import com.bob.stepy.dto.HouseholdDto;
import com.bob.stepy.dto.TravelPlanDto;
import com.bob.stepy.service.TravelPlanService;

import lombok.extern.java.Log;

@Controller
@Log
public class TravelPlanController {
	
	@Autowired
	TravelPlanService tServ;
	
	ModelAndView mv;
	
	//여행 만들기 페이지 이동
	@GetMapping("pMakePlanFrm")
	public String pMakePlanFrm() {
		log.info("controller - pMakePlanFrm()");
		
		return "pMakePlanFrm";
	}
	
	//여행 등록
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
	
	//일정 페이지 이동
	@GetMapping("pPlanFrm")
	public ModelAndView pPlanFrm(long planNum) {
		log.info("controller - pPlanFrm()");
		
		return tServ.pPlanFrm(planNum);
	}
	
	//장소 검색 페이지 이동
	@GetMapping("pStoreSearch")
	public ModelAndView pStoreSearch(long day, long planCnt) {
		log.info("controller - pStoreSearch()");
		
		return tServ.pStoreSearch(day, planCnt);
	}
	
	//여행 내용 등록
	@GetMapping("RegAccompanyPlan")
	public String RegAccompanyPlan(AccompanyPlanDto acPlan, RedirectAttributes rttr) {
		log.info("controller - RegAccompanyPlan");
		
		return tServ.RegAccompanyPlan(acPlan, rttr);
	}
	
	//여행 내용 삭제
	@GetMapping("delAccompanyPlan")
	public String delAccompanyPlan(long planNum, long day, long num, RedirectAttributes rttr) {
		log.info("controller - delAccompanyPlan - planNum : " + planNum + ", day : " + day + ", num : " + num);
		
		return tServ.delAccompanyPlan(planNum, day, num, rttr);
	}
	
	//가계부 페이지 이동
	@GetMapping("pHouseholdFrm")
	public ModelAndView pHouseholdFrm(long planNum) {
		log.info("controller - pHouseholdFrm()");
		
		return tServ.pHouseholdFrm(planNum);
	}
	
	//가계부 내용 작성 페이지 이동
	@GetMapping("pWriteHousehold")
	public ModelAndView pWriteHousehold(long householdCnt, long days, long dayCnt) {
		log.info("controller - pWriteHousehold() - householdCnt : " + householdCnt + ", days : " + days + " , dayCnt : " + dayCnt);
		
		return tServ.pWriteHousehold(householdCnt, days, dayCnt);
	}
	
	//가계부 내용 등록
	@GetMapping("regHousehold")
	public String regHousehold(HouseholdDto household, RedirectAttributes rttr) {
		log.info("controller - regHousehold()");
		
		return tServ.regHousehold(household, rttr);
	}
	
	//가계부 수정 페이지 이동
	@GetMapping("pModHouseholdFrm")
	public ModelAndView pModHouseholdFrm(long planNum, long days, long dayCnt, long householdCnt) {
		log.info("controller - pModHouseholdFrm()");
		
		return tServ.pModHouseholdFrm(planNum, days, dayCnt, householdCnt);
	}
	
	//가계부 내용 수정
	@GetMapping("modHousehold")
	public String ModHousehold(HouseholdDto household, RedirectAttributes rttr) {
		log.info("controller - modHousehold()");
		
		return tServ.modHousehold(household, rttr);
	}
	
	//가계부 내용 삭제
	@GetMapping("delHousehold")
	public String delHousehold(long planNum, long day, long householdCnt, RedirectAttributes rttr) {
		log.info("contorller - delHousehold()");
		
		return tServ.delHousehold(planNum, day, householdCnt, rttr);
	}
	
	//체크리스트 페이지 이동
	@GetMapping("pCheckSupFrm")
	public String pCheckSupFrm(long planNum) {
		log.info("controller - pCheckSupFrm()");
		
		return "pCheckSupFrm";
	}
	
	//예산 입력
	@GetMapping(value = "pRegBudget", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Long> pRegBudget(long planNum, long budget){
		log.info("controller - tServ.pRegBudget() - planNum : " + planNum + ", budget : " + budget);
		
		return tServ.pRegBudget(planNum, budget);
	}
}
