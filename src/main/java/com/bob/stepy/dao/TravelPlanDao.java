package com.bob.stepy.dao;

import java.util.List;

import com.bob.stepy.dto.TravelPlanDto;

public interface TravelPlanDao {
	//여행 일정 등록
	public void pRegPlan(TravelPlanDto plan);
	//여행 일정 리스트 가져오기
	public List<TravelPlanDto> getPlanList(String id);
	//여행 일정 내용 가져오기
	public TravelPlanDto getPlan(int planNum);
}
