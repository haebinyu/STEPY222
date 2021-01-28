package com.bob.stepy.dao;

import java.util.List;
import java.util.Map;

import com.bob.stepy.dto.LikedDto;
import com.bob.stepy.dto.PostDto;
import com.bob.stepy.dto.PostDto2;
import com.bob.stepy.dto.PostFileDto;
import com.bob.stepy.dto.ReplyDto;

public interface BoardDao {
	
	//게시글 번호대로
	public List<PostDto> getList_1(int pageNum);
	//메이트 게시글
	public List<PostDto> getList_2(int pageNum);
	//자유 게시글
	public List<PostDto> getList_3(int pageNum);
	//자유 게시글
	public List<PostDto> getList_4(int pageNum);
	//메이트 게시글 전체 개수 구하기
	public int getPostCnt_1();
	//자유 게시글 전체 개수 구하기
	public int getPostCnt_2();
	//리뷰 게시글 전체 개수 구하기
	public int getPostCnt_3();
	//공지 게시글 전체 개수 구하기
	public int getPostCnt_4();
	//조회수 증가
	public void viewUpdate(Integer pnum);
	//메이트 내용 가져오기(1레코드 행)
	public PostDto2 getContent_1(Integer pnum);
	//자유 내용 가져오기(1레코드 행)
	public PostDto2 getContent_2(Integer pnum);
	//리뷰 내용 가져오기(1레코드 행)
	public PostDto2 getContent_3(Integer pnum);
	//공지 내용 가져오기(1레코드 행)
	public PostDto2 getContent_4(Integer pnum);
	//카테고리 가져오기
	public String getcategory(Integer pnum);
	//게시글 저장 메소드
	public boolean PostInsert(PostDto post);
	//파일 저장 메소드
	public boolean fileInsert(Map<String, String> fmap);
	//게시글에 해당하는 파일 목록 가져오기
	public List<PostFileDto> getpostFile(Integer pnum);
	//파일의 기존 이름 구하기
	public String getOriName(String sysName);
	//개별 파일 삭제(게시글 수정)
	public boolean fileDelete(String sysName);
	//게시글 수정(업데이트)
	public boolean boardUpdate(PostDto post);
	//댓글 저장 메소드
	public boolean replyInsert(ReplyDto reply);
	//댓글 목록 가져오기
	public List<ReplyDto> getReplyList(Integer pnum);
	//댓글 1행 삭제하기
	public void Delete(Integer rnum);
	//게시글 삭제 + 댓글 삭제
	public void replyDelete(Integer pnum);
	//게시글 삭제 + 파일 삭제
	public void fileListDelete(Integer pnum);
	//게시글 삭제
	public void boardDelet(Integer pnum);
	//갯수 구하기
	public int getlike(LikedDto like);
	//Like 테이블 저장.
	public boolean setLike(LikedDto like);
	//게시글 좋아요 증가
	public void likeup(Integer pnum);
	//게시글 좋아요 감소
	public void likeupdown(Integer pnum);
	//좋아요 삭제
	public void dellike(LikedDto like);

}