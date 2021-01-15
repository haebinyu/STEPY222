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
	@PostMapping("aHome")
	public String aLogin(MemberDto member,RedirectAttributes rttr) {
		String view = null;
		view = aServ.loginProc(member, rttr);
		System.out.println("결정된 view : "+view);
		return view;
	}
	//전체 회원 페이지로 이동
	@GetMapping("aMemberList")
	public String allMemberList() {
		System.out.println("전체 회원 리스트 페이지로 이동");
		return "aMemberList";
	}
	//승인 완료 업소 리스트 페이지로 이동
	@GetMapping("aAuthList")
	public String authStoreList() {
		System.out.println("승인 완료 업소 리스트 페이지로 이동");
		return "aMemberList";
	}
	//승인 대기 업소 리스트 페이지로 이동
	@GetMapping("aPendingList")
	public String pendingMemberList() {
		System.out.println("승인 대기 업소 리스트 페이지로 이동");
		return "aMemberList";
	}
	//단체 메일 선택 페이지로 이동
	@GetMapping("aGroupMailFrm")
	public String aGroupMailFrm() {
		System.out.println("단체 메일 선택 페이지로 이동");
		return "aMemberList";
	}
	//이벤트 관리 페이지로 이동
	@GetMapping("aEvent")
	public String aEvent() {
		System.out.println("이벤트 관리 페이지로 이동");
		return "aMemberList";
	}
	//신고 관리 페이지로 이동
	@GetMapping("aReport")
	public String aReport() {
		System.out.println("신고 관리 페이지로 이동");
		return "aMemberList";
	}
}//컨트롤러 끝
