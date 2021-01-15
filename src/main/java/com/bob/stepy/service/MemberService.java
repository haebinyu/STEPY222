package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	public String logInProc(MemberDto mDto, RedirectAttributes rttr) {
		

		return null;
	}

	// join stepy
	public void mJoinProc(MemberDto member, RedirectAttributes rttr) {
		
		
	}
	
	public String mLoginProc(MemberDto member, RedirectAttributes rttr) {
		
				
		return null; 
	}
	
	
	

	//kakaoApi_______________
	
	
	public MemberDto mKakaoLogInProc(String code,HttpSession session) {
		
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
		
		return member;
	}
	
	
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
				
				MemberDto memberDto = new MemberDto();
				memberDto.setM_id(kakaoProfileDto.getKakao_account().getEmail()+"_"+kakaoProfileDto.getId());
				memberDto.setM_email(kakaoProfileDto.getKakao_account().getEmail());
				memberDto.setM_name(kakaoProfileDto.getKakao_account().getProfile().getNickname());
				memberDto.setM_nickname(kakaoProfileDto.getKakao_account().getProfile().getNickname());
				memberDto.setM_pwd("mustbekeptwithoutanyleak11!!");//default password for users who logged in from kakaotalk
				System.out.println(memberDto);
				
				//response가 아닌 memberDto 를 보낸다.
		return memberDto;
	}
	
	

	
	public String kakaoAutho(HttpSession session) {
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + restApi + "&redirect_uri=" + redirect_uri + "&response_type=code"; 
		return kakaoUrl;
	}

}
