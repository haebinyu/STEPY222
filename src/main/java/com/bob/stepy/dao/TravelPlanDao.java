package com.bob.stepy.dao;

import java.util.List;

import com.bob.stepy.dto.AccompanyPlanDto;
import com.bob.stepy.dto.StoreDto;
import com.bob.stepy.dto.TravelPlanDto;

public interface TravelPlanDao {
	//여행 일정 등록
	public void pRegPlan(TravelPlanDto plan);
	//여행 일정 리스트 가져오기
	public List<TravelPlanDto> getPlanList(String id);
	//여행 일정 정보 가져오기
	public TravelPlanDto getPlan(long planNum);
	//여행 일정 설정하기
	public void regPlanContents(AccompanyPlanDto acPlan);
	//여행 전체 일수 가져오기
	public int getTravelDays(long planNum);
	//여행 일정 내용 가져오기
	public List<AccompanyPlanDto> getPlanContents(long planNum);
	//가게 정보 가져오기
	public List<StoreDto> getStoreList();
	//여행 내용 등록
	public void RegAccompanyPlan(AccompanyPlanDto acPlan);
}
