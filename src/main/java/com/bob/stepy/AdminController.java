package com.bob.stepy;


import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dto.CeoDto;
import com.bob.stepy.dto.EmailDto;
import com.bob.stepy.dto.EventDto;
import com.bob.stepy.dto.MemberDto;
import com.bob.stepy.dto.ReportDto;
import com.bob.stepy.service.AdminService;

//'컨트롤러'임을 인지, 자동실행 하도록 어노테이션 처리
@Controller
public class AdminController {
	@Autowired
	private AdminService aServ;

	//모델 데이터,뷰네임을 동시에 기억
	private ModelAndView mv;

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
	public ModelAndView allMemberList(Integer pageNum) {
		System.out.println("전체 회원 리스트 페이지로 이동");
		//파라미터된 pageNum이 있으면 해당 페이지를, 없다면 미리 설정해둔 1 페이지로 간주
		//리턴되는 모델뷰에는 모델=회원 리스트mList+뷰=리스트 페이지를 동시에 담고 있음
		mv = aServ.listSet(pageNum, 1);
		return mv;
	}

	//전체 업체 회원 리스트 페이지로 이동
	@GetMapping("aCeoList")
	public ModelAndView ceoList(Integer pageNum) {
		System.out.println("전체 업체 회원 리스트 페이지로 이동");
		mv = aServ.listSet(pageNum, 2);
		return mv;
	}

	//승인 완료 업소 리스트 페이지로 이동
	@GetMapping("aAuthList")
	public ModelAndView authStoreList(Integer pageNum) {
		System.out.println("승인 완료 업체 회원 리스트 페이지로 이동");
		mv = aServ.listSet(pageNum, 3);
		return mv;
	}
	//승인 대기 업소 리스트 페이지로 이동
	@GetMapping("aPendingList")
	public ModelAndView pendingMemberList(Integer pageNum) {
		System.out.println("승인 대기 업체 회원 리스트 페이지로 이동");
		mv = aServ.listSet(pageNum, 4);
		return mv;
	}

	//승인 완료로 업데이트하기 (UPDATE - 단일 레코드)
	@GetMapping("aPermitStore")
	public String permitStore (String c_num) {
		String view = null;
		view = aServ.aPertmitStore(c_num);
		return view;
	}

	//선택한 회원의 데이터를 삭제하기 (일반) (DELETE - 단일 레코드)
	@GetMapping("aDeleteMember")
	public String deleteMember (String m_id) {

		String view = aServ.deleteSwitch(m_id, 1);

		return view;
	}

	//선택한 회원의 데이터를 삭제하기 (업체) (DELETE - 단일 레코드)
	@GetMapping("aDeleteStore")
	public String deleteStore (String c_num) {
		String view = aServ.deleteSwitch(c_num, 2);
		return view;
	}

	//회원 관리 구역 끝//

	//단체 메일 선택 페이지로 이동
	@GetMapping("aGroupMailFrm")
	public String aGroupMailFrm() {
		System.out.println("단체 메일 선택 페이지로 이동");
		return "aGroupMailFrm";
	}

	@GetMapping("aGroupMail_M")
	public String aGroupMail_M() {
		System.out.println("단체 메일 작성_M");
		return "aGroupMailFrm_M";		
	}
	@GetMapping("aGroupMail_C")
	public String aGroupMail_C() {
		System.out.println("단체 메일 작성_C");
		return "aGroupMailFrm_C";		
	}

	//일반 회원,업체 회원 메일 발송 메소드 - 관련 API 사용
	@PostMapping("aSendMemberMail")
	public String aSendMemberMail
	(EmailDto email, RedirectAttributes rttr)
			throws AddressException, MessagingException {
		System.out.println("메일 전송 서비스 실행");

		String msg = aServ.mailSend(email, 1);
		rttr.addFlashAttribute(msg);

		return "redirect:aGroupMailFrm";
	}

	@PostMapping("aSendStoreMail")
	public String aSendStoreMail
	(EmailDto email, RedirectAttributes rttr)
			throws AddressException, MessagingException {
		System.out.println("메일 전송 서비스 실행");

		String msg = aServ.mailSend(email, 2);
		rttr.addFlashAttribute(msg);

		return "redirect:aGroupMailFrm";
	}
	//회원 관리 구역 끝//

	//이벤트 관리 페이지로 이동
	@GetMapping("aEvent")
	public String aEvent() {
		System.out.println("이벤트 관리 페이지로 이동");
		return "aEvent";
	}

	//이벤트 리스트 보기 - 복수 레코드 SELECT 필요
	@GetMapping("aEventList")
	public ModelAndView aEventList(Integer pageNum) {
		mv = new ModelAndView();

		System.out.println("이벤트 리스트 페이지로 이동");

		mv = aServ.listSet(pageNum, 5);

		return mv;
	}

	//이벤트 추가 페이지로 이동
	@GetMapping("aEventWriteFrm")
	public String aEventWriteFrm() {
		System.out.println("이벤트 작성 페이지로 이동");
		return "aEventWriteFrm";
	}

	//이벤트 실제 추가 DB 연동 INSERT
	@PostMapping("aWriteEvent")
	public String aWriteEvent
	(MultipartHttpServletRequest multi, RedirectAttributes rttr) {
		System.out.println("이벤트 추가 실행");

		String view = aServ.addEvent(multi,rttr);
		return view;
	}

	@GetMapping("aDeleteEvent")
	public String aDeleteEvent(int e_num) {
		System.out.println("이벤트 삭제 실행");
		String view =  aServ.deleteEvent(e_num);

		System.out.println("이벤트 삭제 완료");
		return view;
	}
	//이벤트 관리 구역 끝//

	//신고 관리 페이지로 이동
	@GetMapping("aReport")
	public String aReport() {
		System.out.println("신고 관리 페이지로 이동");
		return "aReport";
	}

	@GetMapping("aReportStoreList")
	public ModelAndView aReportStoreList(Integer pageNum) {
		mv = new ModelAndView();
		System.out.println("이벤트 리스트 페이지로 이동");

		mv = aServ.listSet(pageNum, 6);
		return mv;
	}
	@GetMapping("aReportPostList")
	public ModelAndView aReportPostList(Integer pageNum) {
		mv = new ModelAndView();
		System.out.println("이벤트 리스트 페이지로 이동");

		mv = aServ.listSet(pageNum, 7);
		return mv;
	}
	@GetMapping("aReportReplyList")
	public ModelAndView aReportReplyList(Integer pageNum) {
		mv = new ModelAndView();
		System.out.println("이벤트 리스트 페이지로 이동");

		mv = aServ.listSet(pageNum, 8);
		return mv;
	}

	@GetMapping("aReportDetail")
	public ModelAndView aReportDetail (int rp_num) {
		System.out.println("(컨트롤러) 파라미터된 rp_num : " +rp_num);
		mv = new ModelAndView();
		mv = aServ.reportDetail(rp_num);

		return mv;
	}

	@GetMapping("aReportDispose")
	public ModelAndView aReportDispose (int rp_num) {

		mv = aServ.reportDetail(rp_num);
		//같은 SELECT대상이지만 서비스에서 뷰네임을 정했으므로 처리 페이지로 뷰네임 재설정
		mv.setViewName("aReportDispose");
		return mv;
	}

	@PostMapping("aSendMail")
	public String aSendMail
	(EmailDto email, RedirectAttributes rttr, CeoDto ceo, ReportDto report)
			throws AddressException, MessagingException {
		System.out.println("(신고 처리) 메일 전송 서비스 실행");
		System.out.println(email);
		
		int res = 0;
		String c_num = ceo.getC_num();
		String msg = null;
		
		res = aBlockStore(c_num);
		if (res >0) {			
			msg = aServ.mailSend(email, 3);
			aServ.aReportFinished(report.getRp_num());
		}
		rttr.addFlashAttribute(msg);

		return "redirect:aReport";
	}

	public int aBlockStore(String c_num) {
		int res = 0;
		String resStr = aServ.deleteSwitch(c_num, 2);
		if (resStr != "") {
			res = 1;
		}

		return res;
	}

	public void aBlockPost(int p_num) {
		aServ.deletePandR(p_num,  1);
	}

	public void aBlockReply(int r_num) {
		aServ.deletePandR(r_num, 2);
	}

	//신고 관리 구역 끝//


}//컨트롤러 끝
