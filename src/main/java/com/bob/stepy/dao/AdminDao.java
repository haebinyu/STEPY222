package com.bob.stepy.dao;

import com.bob.stepy.dto.MemberDto;

public interface AdminDao {
	public String loginProc (String id);

	//로그인을 위한 대조용 비밀번호를 DB에서 가져오기 (SELECT)
	public String getPwd(String id);

	//로그인후 사용될 사용자(관리자)의 DTO 정보 가져오기
	public MemberDto getMemberInfo(String id);
}
