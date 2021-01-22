package com.bob.stepy.dao;

import java.util.List;
import java.util.Map;

import com.bob.stepy.dto.AccompanyPlanDto;
import com.bob.stepy.dto.CheckListDto;
import com.bob.stepy.dto.ChecklistViewDto;
import com.bob.stepy.dto.HouseholdDto;
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
	public void regAccompanyPlan(AccompanyPlanDto acPlan);
	//여행 내용 삭제
	public void delAccompanyPlan(Map<String, Long> apMap);
	//여행 내용 수정
	public void pEditAccompanyPlan(AccompanyPlanDto acPlan);
	//여행 번호 카운트 정렬
	public void reduceNumCnt(Map<String, Long> apMap);
	//가계부 내용 등록
	public void regHousehold(HouseholdDto household);
	//가계부 목록 가져오기
	public List<HouseholdDto> getHouseholdList(long planNum);
	//가계부 내용 가져오기
	public HouseholdDto getHouseholdContentes(Map<String, Long> hList);
	//가계부 수정
	public void ModHousehold(HouseholdDto household);
	//가계부 내용 카운트 정렬
	public void reduceHouseholdCnt(Map<String, Long> hMap);
	//가계부 내용 삭제
	public void delHousehold(Map<String, Long> hMap);
	//예산 등록
	public void pRegBudget(Map<String, Long> rbMap);
	//예산 전체 조회
	public Long getBalance(Long planNum);
	//체크리스트 내용 가져오기
	public List<CheckListDto> getCheckList(long planNum);
	//체크리스트 카테고리 개수 가져오기
	public int getCategoryNum(long planNum);
	//체크리스트 레이아웃 생성용 뷰 가져오기
	public List<ChecklistViewDto> getCV(long planNum);
	//체크리스트 상태 변경
	public void pChangeCheck(Map<String, Long> clMap);
	//체크리스트 특정 항목 가져오기
	public CheckListDto getACheck(Map<String, Long> clMap);
	//준비물 추가하기
	public void pAddCheckItem(CheckListDto checklist);
	//준비물 삭제하기
	public void delCheckItem(CheckListDto checklist);
	//준비물 카운트 정렬하기
	public void reduceCheckItemCnt(CheckListDto checklist);
	//체크리스트 카테고리 삭제하기
	public void delCheckCategory(ChecklistViewDto cv);
	//체크리스트 카테고리 정렬하기
	public void reduceCheckCategoryCnt(ChecklistViewDto cv);
	//준비물 수정하기
	public void pEditCheckItem(CheckListDto checklist);
	//카테고리 수정하기
	public void pEditCheckCategory(CheckListDto checklist);
}
