package com.bob.stepy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.CeoDto;
import com.bob.stepy.dto.StoreDto;
import com.bob.stepy.service.StoreService;

import lombok.extern.java.Log;

@Controller
@Log
public class StoreController {
	
	@Autowired
	private StoreService stServ;
	
	private ModelAndView mv;
	
	@GetMapping("stHome")
	public String stHome() {
		log.info("stHome()");
		return "stHome";
	}
	
	@GetMapping("stJoinFrm")
	public String stJoinFrm() {
		log.info("stJoinFrm()");
		return "stJoinFrm";
	}
	
	@GetMapping(value="stIdCheck", produces="application/text; charset=utf-8")
	@ResponseBody
	public String stIdCheck(String c_num) {
		log.info("stIdCheck() cnum: " + c_num);
		String result = stServ.stIdCheck(c_num);
		return result;
	}
	


}
