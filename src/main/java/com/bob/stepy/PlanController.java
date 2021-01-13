package com.bob.stepy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Controller
@Log
public class PlanController {
	@GetMapping("pMakePlanFrm")
	public String pMakePlanFrm() {
		log.info("pMakePlanFrm() - 페이지 이동");
		
		return "pMakePlanFrm";
	}
	
}
