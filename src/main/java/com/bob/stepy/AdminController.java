package com.bob.stepy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.MemberDto;
import com.bob.stepy.service.AdminService;

//'컨트롤러'임을 인지, 자동실행 하도록 어노테이션 처리
@Controller
public class AdminController {
	@Autowired
	private AdminService aServ;

	@GetMapping("aLoginFrm")
	public String adminLogin() {
		System.out.println("어드민 로그인 시도");
		return "aLoginFrm";
	}

	//로그인 처리
	@PostMapping("aLogin")
	public String aLogin(MemberDto member,RedirectAttributes rttr) {
		String view = null;
		view = aServ.loginProc(member, rttr);
		return view;
	}
}
