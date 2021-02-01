package com.bob.stepy.dao;

import com.bob.stepy.dto.ProductDto;
import com.bob.stepy.dto.StoreDto;

public interface ResDao {
	
	// 예약하려는 가게 정보 가져오기
	public StoreDto getStoreInfo(String cnum);
	
	// 예약하려는 상품(룸) 정보 가져오기
	public ProductDto getProductInfo(Integer plnum);

}
