package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dao.MemberDao;
import com.bob.stepy.dto.MemberDto;
import com.bob.stepy.dto.MemberKaKaoTokenDto;
import com.bob.stepy.dto.MemberKakaoProfileDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class MemberService {

	static String restApi = "3a7921c9c86e805003cd07a8e548f149";
	static String redirect_uri= "http://localhost/stepy/kakaoLogInProc";
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private HttpSession session;
	

	
	

	


	

	//_______________
	
	
	
	public String mKakaoAutho() {
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + restApi + "&redirect_uri=" + redirect_uri + "&response_type=code"; 
		return kakaoUrl;
	}

	
	
	public String mKakaoLogInProc(String code,RedirectAttributes rttr) {
		
		String path;
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add( "Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//body
		MultiValueMap<String,String>params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", restApi);
		params.add("redirect_uri", redirect_uri);
		params.add("code", code);
	
		HttpEntity<MultiValueMap<String,String>> kakaoTokenRequest = 
				new HttpEntity<>(params, headers);
		
		//request-Method:Post-And get Response Answer
		ResponseEntity<String> response = rt.exchange(
				//request
				"https://kauth.kakao.com/oauth/token",
				//method
				HttpMethod.POST,
				//body entity, header entity
				kakaoTokenRequest,
				//response Type
				String.class
				);
		
		//Mapping process
		ObjectMapper objectMapper = new ObjectMapper();
		MemberKaKaoTokenDto tokenDto = null;
		
		try {
			tokenDto = objectMapper.readValue(response.getBody(), MemberKaKaoTokenDto.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("Get access token for kakato : "+tokenDto.getAccess_token());
		
		//retrieve user info from kakao server by Post Method
		MemberDto member = mKakaoProfileRequest(tokenDto);
		
		if(member.getM_email().equals("no_email_detected")) {
			rttr.addAttribute("msg", "eamil 정보수집에 동의해주세요");
			return "redirect:mLoginFrm";
		}
		
		session.setAttribute("member", member);
		rttr.addAttribute("msg", "카카오 아이디로 로그인되었습니다 ");
		
		return "redirect:/";
	}
	
	
	
	@Transactional
	public MemberDto mKakaoProfileRequest(MemberKaKaoTokenDto tokenDto) {
		
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer "+tokenDto.getAccess_token());
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	 
		HttpEntity<MultiValueMap<String,String>> kakaoProfileRequest = 
				new HttpEntity<>(headers);
		
		//request-Method:Post-And get Response Answer
		ResponseEntity<String> response = rt.exchange(
				//request
				"https://kapi.kakao.com/v2/user/me",
				//method
				HttpMethod.POST,
				//body entity, header entity
				kakaoProfileRequest,
				//response Type
				String.class
				);
		
		//Mapping
				ObjectMapper objectMapper = new ObjectMapper();
				MemberKakaoProfileDto kakaoProfileDto = null;
				
				try {
					kakaoProfileDto = objectMapper.readValue(response.getBody(), MemberKakaoProfileDto.class);
					System.out.println(kakaoProfileDto);
					//여기서 myPage 썸네일 다운받고 설정하고. 
					
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
				
				
				System.out.println("kakao Id : "+kakaoProfileDto.getId());
				System.out.println("kakao email : "+kakaoProfileDto.getKakao_account().getEmail());
				System.out.println("The format of user id fot stepy is "+kakaoProfileDto.getKakao_account().getEmail()+"_"+kakaoProfileDto.getId());
				System.out.println("The format of user enamil for stepy is "+kakaoProfileDto.getKakao_account().getEmail());
				System.out.println("Nickname and user name have the same value for deafult set");
				
				
				String idPreCheck = kakaoProfileDto.getKakao_account().getEmail()+"_"+kakaoProfileDto.getId();
				String dbCheckResult = mIdDuplicationCheck(idPreCheck);
				MemberDto memberDto = new MemberDto();
				
				if(kakaoProfileDto.getKakao_account().getEmail() == "" || kakaoProfileDto.getKakao_account().getEmail() == null) {
					memberDto.setM_email("no_email_detected");
					return memberDto;
				}
				
				if(dbCheckResult == "0") {
					memberDto.setM_id(kakaoProfileDto.getKakao_account().getEmail()+"_"+kakaoProfileDto.getId());
					memberDto.setM_email(kakaoProfileDto.getKakao_account().getEmail());
					memberDto.setM_name(kakaoProfileDto.getKakao_account().getProfile().getNickname());
					memberDto.setM_nickname(kakaoProfileDto.getKakao_account().getProfile().getNickname());
					memberDto.setM_pwd("mustbekeptwithoutanyleak11!!");//default password for users who logged in from kakaotalk
					//System.out.println(memberDto);
					
					try {
						mJoinProc(memberDto);
						//memberDto = mDao.getMemeberInfo(memberDto.getM_id());
						System.out.println("This is if version of memberDto "+memberDto);
					}catch(Exception e){
						System.out.println("mKakaoProfileRequest Member insult failure" );
					}
					
				}
				else {
						memberDto = mDao.getMemeberInfo(idPreCheck);
						System.out.println("this is else version of memberDto "+memberDto);
				}

				//response가 아닌 memberDto 를 보낸다.
		return memberDto;
	}
	


//_____________
	
	
	// join stepy
	@Transactional
	public String mJoinProc(MemberDto member) {
		
		String path = null;
		String actualpwd;
		String realaddr = null;
		
		BCryptPasswordEncoder pwdEncrypt = new BCryptPasswordEncoder();
		
		actualpwd = pwdEncrypt.encode(member.getM_pwd());
		member.setM_pwd(actualpwd);
		
		
		if(member.getAddress_without_specific() != "" && member.getAddress_without_specific() != null ) {
			if(member.getAddress_with_specific() !="") {
				realaddr = member.getAddress_without_specific() +" "+ member.getAddress_with_specific();
				member.setM_addr(realaddr);
			}
			else if(member.getAddress_with_specific()== ""){
				realaddr = member.getAddress_without_specific();
				member.setM_addr(realaddr);
			}
		}
		
		try {
			mDao.memberInsert(member);
			path="redirect:/";
			System.out.println(member);
		}catch(Exception e) {
			path="redirect:mJoinFrm";
			e.printStackTrace();
		}

		return path;
	}
	
	
	
	public String mIdDuplicationCheck(String tempid) {
		
		String msg;
		
		int i = mDao.duplicationCheck(tempid);
		if (i == 1) {
			msg="1";
					//"이미 존재하는 아이디입니다. 다른 아이디를 선택해주세요 (already existing id. select another, please)";
		}else {
			msg = "0";
					//"사용가능한 아이디입니다. (usable id)";
		}
		
		return msg;
		
	}
	

	public String mLoginProc(MemberDto member) {
		
		String path;
		String encryptPass = mDao.getEncryptizedPass(member.getM_id());
		
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		
		if(encryptPass != null) {
			if(pwdEncoder.matches(member.getM_pwd(), encryptPass)) {
				
				member = mDao.getMemeberInfo(member.getM_id());
				session.setAttribute("member", member);
				path = "redirect:/";
				System.out.println("login success, "+member);
			}else {
				// right id, but pass typo
				path="redirect:mLoginFrm";
			}
			
		}else {
			//no memberinfo exist
			path="redirect:mLoginFrm";
		}
		
		return path; 
	}
	
	
	
	
	public String mLogoutProc() {
		
		session.invalidate();
		
		return "home";
	}



	
	
	

}
