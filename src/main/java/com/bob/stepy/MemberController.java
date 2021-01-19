package com.bob.stepy;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.MemberDto;
import com.bob.stepy.service.MemberService;



@Controller
public class MemberController {

	static String restApi = "3a7921c9c86e805003cd07a8e548f149";
	static String redirect_uri= "http://localhost/stepy/kakaoLogInProc";
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	
	@Autowired
	private MemberService mServ;
	
	
	
	@GetMapping("mMyPage")
	public String mMyPage() {
		
		mServ.mMyPage();
		
		return "mMyPage";
	}
	
	@GetMapping("mLogoutProc")
	public String mLogoutProc() {
	
		return mServ.mLogoutProc();
	}
	
	@PostMapping("mLoginProc")
	public String mLoginProc(MemberDto member, RedirectAttributes rttr) {
		logger.info("mLoginProc()");
		
		String path = mServ.mLoginProc(member);
		return path;
	}
	
	@GetMapping("mLoginFrm")
	public String mLoginFrm() {
		logger.info("mLoginFrm()");
		
		return "mLoginFrm";
	}
	

	@GetMapping(value = "mIdDuplicationCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String mIdDuplicationCheck(String tempid) {
		
		logger.info("mIdDuplicationCheck()");
		
		System.out.println(tempid);
		String id = mServ.mIdDuplicationCheck(tempid);
		System.out.println(id);
		
		return id;
	}
	
	
	
	@PostMapping("mJoinProc")
	public String mJoinProc(MemberDto member) {
		logger.info("mJoinProc()");
		
		String path = mServ.mJoinProc(member);
		
		return path;
	}
	
	
	@GetMapping("mJoinFrm")
	public String mJoinFrm() {
		logger.info("mJoinFrm()");
		
		return "mJoinFrm";
	}
	
	

	@GetMapping(value = "kakaoLogInProc", produces = "application/json; charset=utf8")
	public String kakaoLogInProc(String code,RedirectAttributes rttr) {

		String path = mServ.mKakaoLogInProc(code,rttr);
	
		return path;
	}
	
	
	@GetMapping("kakaoLogin")
	public String mGetAuthorizationUrl(RedirectAttributes rttr) { 
		
		String kakaoUrl = mServ.mKakaoAutho();
		
		return "redirect:"+kakaoUrl; 
		}

	
}
