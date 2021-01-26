package com.bob.stepy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Log
@Controller
public class ResController {
	
	// 예약 페이지 이동
	@GetMapping("rReservation")
	public String rReservation() {
		log.info("rReservation()");
		
		return "rReservation";
	}
}
