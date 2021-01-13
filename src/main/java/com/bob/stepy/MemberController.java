package com.bob.stepy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@GetMapping("mLoginFrm")
	public String mLoginFrm() {
		logger.info("mLoginFrm()");
		
		return "mLoginFrm";
	}
	

	
	
}
