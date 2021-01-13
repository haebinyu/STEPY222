package com.bob.stepy.dao;

import com.bob.stepy.dto.TravelPlanDto;

public interface TravelPlanDao {
	//여행 일정 등록
	public void pRegPlan(TravelPlanDto plan);
}
