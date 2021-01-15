package com.bob.stepy.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dao.AdminDao;
import com.bob.stepy.dto.MemberDto;

//서비스 클래스임을 인지하도록 어노테이션 처리
@Service
public class AdminService {
	@Autowired
	private AdminDao aDao;

	//세션 객체
	@Autowired
	private HttpSession session;

	public String loginProc(MemberDto member, RedirectAttributes rttr) {
		//목적지가 담길 String view
		String view =null;

		String id = member.getM_id();

		//파라미터받은 DTO내의 m_id를 기반으로 DB에서 SELECT로 비밀번호 가져오기
		String pw = aDao.getPwd(id);
		if (pw != null) {
			//가져온 아이디가 있다면 pw에 데이터 들어감
			//사용자가 입력한 값이 있는 DTO의 m_pwd와 DB에서 가져온 m_pwd를 대조
			//이 둘이 일치한다면 아이디와 비밀번호가 모두 맞음

			if (pw.equals(member.getM_pwd()) ) {
				//ID도 PW도 맞는 사용자이므로 화면에 출력할 해당 사용자 정보를 가져오기
				//사용자 정보를 다시 가져옴 (getMemberInfo)
				//DTO에서 @data 어노테이션으로 인해 자동으로 세트되어있음

				if(id.equals("admin")) {
					member = aDao.getMemberInfo(member.getM_id());

					//회원정보는 다른 페이지들에서도 돌려 쓰므로 세션에 DTO째로 등록
					session.setAttribute("mb", member);
					view = "aHome";
				} else {
					view = "redirect:aLoginFrm";
					rttr.addFlashAttribute("msg", "접속 권한이 없습니다");
				}
			}//ID도 PW도 맞는 경우의 if 끝

			else {
				//ID는 맞았으나 비밀번호를 틀린 경우
				//로그인 페이지로 돌아감, 보여줄 메시지를 리다이렉트의 플래시 어트리뷰트에 등록
				view ="redirect:aLoginFrm";

				//애드 '플래시' 어트리뷰트여야 리다이렉트 시에도 데이터를 담을 수 있음
				//애드 어트리뷰트시 주소창에 get방식으로 데이터 담김
				rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
			}//ID는 맞고 PW는 틀린 경우의 else 끝
		}//ID는 맞는 경우의 IF 끝

		else {
			//아이디부터 DB에 없어 아예 없는 계정으로 판단
			//로그인 페이지로 돌아감, 보여줄 메시지를 리다이렉트의 플래시 어트리뷰트에 등록
			view ="redirect:aLoginFrm";
			rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다");
		}
		//'list'를 받는 대상은 페이지가 아닌
		//보드 컨트롤의 list맵핑 메소드가 받아
		//컨트롤러-컨트롤러 연계 처리도 가능함	
		return view;
	}

}
