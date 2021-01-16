package com.bob.stepy.dao;

import com.bob.stepy.dto.MemberDto;

public interface MemberDao {

	public int duplicationCheck(String tempid);

	public MemberDto getMemeberInfo(String idPreCheck);
	
	public void memberInsert (MemberDto member);

	public String getEncryptizedPass(String m_id);
	
}
