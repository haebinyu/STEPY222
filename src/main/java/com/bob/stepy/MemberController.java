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
	
	
	
	
	@GetMapping("mLoginFrm")
	public String mLoginFrm() {
		logger.info("mLoginFrm()");
		
		return "mLoginFrm";
	}
	
	@PostMapping("mLoginProc")
	public String mLoginProc(MemberDto mDto, RedirectAttributes rttr) {
		logger.info("mLoginProc()");
		
		return null;
	}
	
	@GetMapping("mJoinFrm")
	public String mJoinFrm() {
		logger.info("mJoinFrm()");
		
		return "mJoinFrm";
	}
	
	@GetMapping("kakaoLogin")
	public String getAuthorizationUrl(HttpSession session) { 
		String kakaoUrl = mServ.kakaoAutho(session);
		return "redirect:"+kakaoUrl; 
		}


	@ResponseBody
	@GetMapping(value = "kakaoLogInProc", produces = "application/json; charset=utf8")
	public MemberDto kakaoLogInProc(String code,HttpSession session) {

		MemberDto member = mServ.mKakaoLogInProc(code,session);
		
		
		return member;
	}
	
	
}
