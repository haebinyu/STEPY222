package com.bob.stepy.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dao.TravelPlanDao;
import com.bob.stepy.dto.AccompanyPlanDto;
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
	public ModelAndView pRegPlan(TravelPlanDto plan, RedirectAttributes rttr) {
		log.info("service - pRegPlan()");
		long planNum = System.currentTimeMillis();
		
		mv = new ModelAndView();
		
		try {
			plan.setT_plannum(planNum);
			tDao.pRegPlan(plan);
			
			
			mv.addObject("planNum", planNum);
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
			
			//시작일과 종료일의 차이 계산
			long days = getTime(plan.getT_stdate(), plan.getT_bkdate());
			mv.addObject("days", days);
			
			AccompanyPlanDto acPlan = new AccompanyPlanDto();
			
			for(int i = 1; i <= days; i++) {
				acPlan.setAp_plannum(planNum);
				acPlan.setAp_mid(plan.getT_id());
				acPlan.setAp_day(i);
				
				tDao.regPlanContents(acPlan);
			}
			
			mv.setViewName("pPlanFrm");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("redirect:pMakePlanFrm");
			rttr.addFlashAttribute("msg", "아이디를 확인해주세요!");
		}
		
		return mv;
	}
	
	//날짜 차이 계산
	public long getTime(String start, String end) {
		long days = 0;
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			//날짜를 Date형으로 변환
			Date startDate = format.parse(start);
			Date endDate = format.parse(end);
			
			//두 날짜간의 차이(1970년 기준 00:00:00부터 몇 초가 흘렀는지)
			long calDate = startDate.getTime() - endDate.getTime();
			
			//(일*시*분*초) = 일수
			days = calDate / (24*60*60*1000);
			//절대값 변환
			days = Math.abs(days);
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		return days;
	}

	//여행 일정 목록 가져오기
	public ModelAndView pPlanList(String id) {
		log.info("service - pPlanList() - id: " + id);
		mv = new ModelAndView();
		
		List<TravelPlanDto> planList = tDao.getPlanList(id);
		
		//여행 일정 모델에 추가
		mv.addObject("planList", planList);
		
		mv.setViewName("pPlanList");
		
		return mv;
	}

	//여행 일정 내용 가져오기
	public ModelAndView pPlanFrm(int planNum) {
		log.info("service - pPlanFrm() - planNum : " + planNum);
		
		mv = new ModelAndView();
		
		TravelPlanDto plan = tDao.getPlan(planNum);
		
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
		
		//시작일과 종료일의 차이 계산
		long days = getTime(plan.getT_stdate(), plan.getT_bkdate());
		mv.addObject("days", days);
		
		//세션에 현재 여행 번호 저장
		session.setAttribute("curPlan", planNum);
		
		mv.setViewName("pPlanFrm");
		
		return mv;
	}
}
