package com.bob.stepy.dao;

import java.util.List;

import com.bob.stepy.dto.ProductDto;
import com.bob.stepy.dto.StoreDto;

public interface SearchDao {
	
	// 숙소 검색
	public List<StoreDto> searchHotel(String keyword);
	
	// 음식점 검색
	public List<StoreDto> searchRestaurant(String keyword);
		
	// 지역시설 검색
	public List<StoreDto> searchPlay(String keyword);
	
	// 가게의 상품 리스트 가져오기
	public List<ProductDto> productList(String cnum);
	
	// 가게 정보 가져오기
	public StoreDto getStoreInfo(String cnum);

}
