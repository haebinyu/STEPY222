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
import com.bob.stepy.dto.HouseholdDto;
import com.bob.stepy.dto.StoreDto;
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
	
	//여행 등록
	@Transactional
	public ModelAndView pRegPlan(TravelPlanDto plan, RedirectAttributes rttr) {
		log.info("service - pRegPlan()");
		long planNum = System.currentTimeMillis();
		
		mv = new ModelAndView();
		
		try {
			plan.setT_plannum(planNum);
			tDao.pRegPlan(plan);
			
			/*
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
			*/
			
			mv.addObject("plan", plan);
			
			//시작일과 종료일의 차이 계산
			long days = getTime(plan.getT_stdate(), plan.getT_bkdate());
			mv.addObject("days", days);
			
			AccompanyPlanDto acPlan = new AccompanyPlanDto();
			
			for(int i = 1; i <= days; i++) {
				acPlan.setAp_plannum(planNum);
				acPlan.setAp_mid(plan.getT_id());
				acPlan.setAp_day(i);
				
				//초기 여행 일정 설정
				tDao.regPlanContents(acPlan);
			}
			session.setAttribute("curPlan", planNum);
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

	//여행 목록 가져오기
	public ModelAndView pPlanList(String id) {
		log.info("service - pPlanList() - id: " + id);
		mv = new ModelAndView();
		
		List<TravelPlanDto> planList = tDao.getPlanList(id);
		
		//여행 일정 모델에 추가
		mv.addObject("planList", planList);
		
		mv.setViewName("pPlanList");
		
		return mv;
	}

	//일정 페이지 이동
	public ModelAndView pPlanFrm(long planNum) {
		log.info("service - pPlanFrm() - planNum : " + planNum);
		
		long num = (planNum == 0)? (long)session.getAttribute("curPlan") : planNum;
		
		mv = new ModelAndView();
		
		TravelPlanDto plan = tDao.getPlan(num);
		
		
		mv.addObject("plan", plan);
		
		//시작일과 종료일의 차이 계산
		long days = getTime(plan.getT_stdate(), plan.getT_bkdate());
		mv.addObject("days", days);
		
		//여행일별로 데이터 저장
		//Map<String, Long> planContentsMap = new HashMap<String, Long>();
		
		//for(long i = 1; i <= days; i++) {
		//	planContentsMap.put("planNum", planNum);
		//	planContentsMap.put("days", i);
		
		//여행 내용 가져오기	
		List<AccompanyPlanDto> planContentsList = tDao.getPlanContents(num);
		mv.addObject("planContentsList", planContentsList);
		//}
		
		//세션에 현재 여행 번호 저장
		session.setAttribute("curPlan", num);
		
		//가게 목록 불러오기
		List<StoreDto> sList = tDao.getStoreList();
		mv.addObject("sList", sList);
		
		mv.setViewName("pPlanFrm");
		
		return mv;
	}

	//장소 검색 페이지 이동
	public ModelAndView pStoreSearch(long day, long planCnt) {
		log.info("service - pStoreSearch");
		
		mv = new ModelAndView();
		//가게 목록 불러오기
		List<StoreDto> sList = tDao.getStoreList();
		mv.addObject("sList", sList);
		mv.addObject("day", day);
		mv.addObject("planCnt", planCnt);
		
		return mv;
	}
	
	//여행 내용 등록
	@Transactional
	public String RegAccompanyPlan(AccompanyPlanDto acPlan, RedirectAttributes rttr) {
		log.info("service - RegAccompanyPlan");
		
		try {
			//여행 내용 등록
			tDao.regAccompanyPlan(acPlan);
			
			//목록 다시 불러오기
			//mv = pPlanFrm(acPlan.getAp_plannum());
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		return "redirect:pPlanFrm?planNum=0";
	}

	//여행 내용 삭제
	@Transactional
	public String delAccompanyPlan(long planNum, long day, long num, RedirectAttributes rttr) {
		log.info("service - delAccompanyPlan");
		
		Map<String, Long> apMap = new HashMap<String, Long>();
		apMap.put("planNum", planNum);
		apMap.put("day", day);
		apMap.put("num", num);
		try {
			//데이터 삭제
			tDao.delAccompanyPlan(apMap);
			//남은 데이터 카운트 정렬
			tDao.reduceNumCnt(apMap);
			
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		return "redirect:pPlanFrm?planNum=0";
	}
	
	//가계부 페이지 이동
	public ModelAndView pHouseholdFrm(long planNum) {
		log.info("service - pHouseholdFrm() - planNum : " + planNum);
		
		long num = (planNum == 0)? (long)session.getAttribute("curPlan") : planNum;
		
		mv = new ModelAndView();
		
		TravelPlanDto plan = tDao.getPlan(num);
		
		mv.addObject("plan", plan);
		
		//시작일과 종료일의 차이 계산
		long days = getTime(plan.getT_stdate(), plan.getT_bkdate());
		mv.addObject("days", days);
		
		//가계부 내용 가져오기
		List<HouseholdDto> hList = tDao.getHouseholdContents(num);
		mv.addObject("hList", hList);
		
		mv.setViewName("pHouseholdFrm");
		
		return mv;
	}

	//가계부 내용 작성페이지 이동
	public ModelAndView pWriteHousehold(long householdCnt, long days) {
		log.info("service - pWriteHousehold() - householdCnt : " + householdCnt + ", days : " + days);
		
		long num = (days == 0)? (long)session.getAttribute("curDays") : days;
		session.setAttribute("cruDays", days);
		
		mv.addObject("householdCnt", householdCnt);
		mv.addObject("days", num);
		
		//가게 목록 불러오기
		List<StoreDto> sList = tDao.getStoreList();
		mv.addObject("sList", sList);
				
		mv.setViewName("pWriteHousehold");
		
		return mv;
	}

	//가계부 내용 등록
	@Transactional
	public String regHousehold(HouseholdDto household, RedirectAttributes rttr) {
		log.info("service - regHousehold()");
		String view = null;
	
		try {
			tDao.regHousehold(household);
			view = "redirect:pHouseholdFrm?planNum=0";
			
		} catch (Exception e) {
			e.printStackTrace();
			String cnt = Long.toString(household.getH_cnt());
			view = "redirect:pWriteHousehold?householdCnt=" + cnt + "&days=0";
		}
		
		return view;
	}

}
