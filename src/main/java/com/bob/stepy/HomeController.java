package com.bob.stepy;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bob.stepy.service.BoardService;
import com.bob.stepy.service.MemberService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardService bServ;
	
	@Autowired
	private MemberService mServ;
	private ModelAndView mv;
	
	@GetMapping("/")
	public ModelAndView home(Integer pageNum) {
		logger.info("home()");
		
		mv = bServ.HomeList(pageNum);
		mv = mServ.mGetMainView(mv);
		return mv;
	}
	
}
