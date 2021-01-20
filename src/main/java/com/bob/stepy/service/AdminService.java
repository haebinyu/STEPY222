package com.bob.stepy.service;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bob.stepy.dao.AdminDao;
import com.bob.stepy.dto.EmailDto;
import com.bob.stepy.dto.MemberDto;
import com.bob.stepy.util.*;

//서비스 클래스임을 인지하도록 어노테이션 처리
@Service
public class AdminService {
	//DAO 임포트+와이어드
	@Autowired
	private AdminDao aDao;

	//특정 데이터들이 담길 모델뷰
	private ModelAndView mv;

	//세션 객체+와이어드
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
	}//어드민 전용 로그인 Proc 끝

	//회원 전부 보기 리스트 SELECT
	public ModelAndView getMemberList(Integer pageNum) {
		//빈 모델뷰를 새로 만들어내 데이터 추가 대기 (데이터를 넣을 때 까지는 속이 빈 null상태)
		mv= new ModelAndView();

		//조건식 (식)? T일 때:F일 때
		//들어온 pageNum이 null이 맞으면 T에 해당하는 1을
		//숫자가 들어온 것이 있다면 F에 해당하는 자기 자신의 숫자를 대입
		int num = (pageNum==null)? 1 : pageNum;
		System.out.println("num : "+num);

		//DAO에서 SELECT처리후 결과물 레코드들을 리스트 mList에 누적해 리스트화
		List<MemberDto> mList = aDao.getMemberList(num);

		//정리된 리스트 mList를 모델뷰에 똑같은 이름을 재사용해 통째로 등록
		//모델은 리스트와 같은 객체도 기억 가능
		mv.addObject("mList", mList);

		//페이징 처리 - 오브젝트 paging에
		//getPaging 메소드의 결과물 문자열들 삽입
		//이 paging은 리스트 페이지에서
		//EL {paging}을 통해 페이징 버튼들로 출력됨
		mv.addObject("paging", getPaging(num));

		//세션에 현재 페이지 번호(1,2,3,...) 기억시킴
		session.setAttribute("pageNum", num);

		//목적지 페이지를 모델뷰에 기억시킴
		mv.setViewName("aMemberList");

		//정리된 mv를 리턴시켜 컨트롤러에서 실제 이동 처리
		return mv;
	}//getBoardList 메소드 끝

	private String getPaging(int num) {
		//전체 글 개수 구하기(DB에서의 게시글 레코드 수량과 같음 - SELECT)
		int maxNum = aDao.getBoardCnt();
		//설정값(페이지 당 보여줄 글 개수, 한 페이지 그룹에 보여줄 페이지 수, 게시판 이름(A게시판,B게시판) 등) 각인
		int pageCnt = 5;//한 페이지 그룹당 페이지 수
		int listCnt = 10;//한 페이지당 게시글 수
		String listName="list";//게시판 이름

		//결정된 설정값들을 Paging 생성자에 파라미터해 값 세트
		Paging paging = new Paging
				(maxNum, num, listCnt,
						pageCnt, listName);

		//세트된 값을 바탕으로 페이징 메소드 실행
		//리턴받은 String pagingHtml은 태그를 포함한 리스트 SELECT결과를 전부 합친 문장
		String pagingHtml = paging.makePaing();

		return pagingHtml;
	}//getPaging 메소드 끝

	//리스트 보기 통합 메소드(스위치 사용)
	public ModelAndView listSet (Integer pageNum, Integer listSelect) {
		mv = new ModelAndView();

		switch (listSelect) {
		case 1://일반회원 전체보기
			//빈 모델뷰를 새로 만들어내 데이터 추가 대기 (데이터를 넣을 때 까지는 속이 빈 null상태)
			mv= new ModelAndView();

			//조건식 (식)? T일 때:F일 때
			//들어온 pageNum이 null이 맞으면 T에 해당하는 1을
			//숫자가 들어온 것이 있다면 F에 해당하는 자기 자신의 숫자를 대입
			int num = (pageNum==null)? 1 : pageNum;
			System.out.println("num : "+num);

			//DAO에서 SELECT처리후 결과물 레코드들을 리스트 mList에 누적해 리스트화
			List<MemberDto> mList = aDao.getMemberList(num);

			//정리된 리스트 mList를 모델뷰에 똑같은 이름을 재사용해 통째로 등록
			//모델은 리스트와 같은 객체도 기억 가능
			mv.addObject("mList", mList);

			//페이징 처리 - 오브젝트 paging에
			//getPaging 메소드의 결과물 문자열들 삽입
			//이 paging은 리스트 페이지에서
			//EL {paging}을 통해 페이징 버튼들로 출력됨
			mv.addObject("paging", getPaging(num));

			//세션에 현재 페이지 번호(1,2,3,...) 기억시킴
			session.setAttribute("pageNum", num);

			//목적지 페이지를 모델뷰에 기억시킴
			mv.setViewName("aMemberList");

			break;
		case 2://승인 완료,대기 여부 불문, 업체 회원 전부 보기
			//빈 모델뷰를 새로 만들어내 데이터 추가 대기 (데이터를 넣을 때 까지는 속이 빈 null상태)
			mv= new ModelAndView();

			//조건식 (식)? T일 때:F일 때
			//들어온 pageNum이 null이 맞으면 T에 해당하는 1을
			//숫자가 들어온 것이 있다면 F에 해당하는 자기 자신의 숫자를 대입
			int num2 = (pageNum==null)? 1 : pageNum;
			System.out.println("num : "+num2);

			List<MemberDto> allCeoList = aDao.getAllCeoList(num2);

			mv.addObject("ceoList", allCeoList);

			//페이징 처리 - 오브젝트 paging에
			//getPaging 메소드의 결과물 문자열들 삽입
			//이 paging은 리스트 페이지에서
			//EL {paging}을 통해 페이징 버튼들로 출력됨
			mv.addObject("paging", getPaging(num2));

			//세션에 현재 페이지 번호(1,2,3,...) 기억시킴
			session.setAttribute("pageNum", num2);

			//목적지 페이지를 모델뷰에 기억시킴
			mv.setViewName("aAllCeoList");
			break;
		case 3://승인완료 업체보기
			//빈 모델뷰를 새로 만들어내 데이터 추가 대기 (데이터를 넣을 때 까지는 속이 빈 null상태)
			mv= new ModelAndView();

			//조건식 (식)? T일 때:F일 때
			//들어온 pageNum이 null이 맞으면 T에 해당하는 1을
			//숫자가 들어온 것이 있다면 F에 해당하는 자기 자신의 숫자를 대입
			int num3 = (pageNum==null)? 1 : pageNum;
			System.out.println("num : "+num3);

			List<MemberDto> approvedList = aDao.getApproveList(num3);

			mv.addObject("ceoList", approvedList);

			//페이징 처리 - 오브젝트 paging에
			//getPaging 메소드의 결과물 문자열들 삽입
			//이 paging은 리스트 페이지에서
			//EL {paging}을 통해 페이징 버튼들로 출력됨
			mv.addObject("paging", getPaging(num3));

			//세션에 현재 페이지 번호(1,num3,3,...) 기억시킴
			session.setAttribute("pageNum", num3);

			//목적지 페이지를 모델뷰에 기억시킴
			mv.setViewName("aAuthList");

			break;
		case 4://승인대기 업체보기
			//빈 모델뷰를 새로 만들어내 데이터 추가 대기 (데이터를 넣을 때 까지는 속이 빈 null상태)
			mv= new ModelAndView();

			//조건식 (식)? T일 때:F일 때
			//들어온 pageNum이 null이 맞으면 T에 해당하는 1을
			//숫자가 들어온 것이 있다면 F에 해당하는 자기 자신의 숫자를 대입
			int num4 = (pageNum==null)? 1 : pageNum;
			System.out.println("num : "+num4);

			//DAO에서 SELECT처리후 결과물 레코드들을 리스트 mList에 누적해 리스트화
			List<MemberDto> pendingList = aDao.getPendingList(num4);

			//정리된 리스트 sList2를 모델뷰에 똑같은 이름을 재사용해 통째로 등록
			//모델은 리스트와 같은 객체도 기억 가능
			mv.addObject("ceoList", pendingList);

			//페이징 처리 - 오브젝트 paging에
			//getPaging 메소드의 결과물 문자열들 삽입
			//이 paging은 리스트 페이지에서
			//EL {paging}을 통해 페이징 버튼들로 출력됨
			mv.addObject("paging", getPaging(num4));

			//세션에 현재 페이지 번호(1,2,3,...) 기억시킴
			session.setAttribute("pageNum", num4);

			//목적지 페이지를 모델뷰에 기억시킴
			mv.setViewName("aPendingList");

			break;
		}//스위치 끝

		//스위치가 결정하고 데이터를 담아온 mv를 리턴해 각 스위치별 페이지로 이동
		//모델에 담긴 리스트를 꺼내는건 각 페이지에서 EL로 처리함
		return mv;
	}//셀렉트 스위치 메소드 끝

	//승인 요청 수락하기 UPATE 메소드
	//DB를 고치는 작업이므로 트랜젝셔널 처리 추가
	@Transactional
	public String aPertmitStore(String c_num) {
		//결과는 해당 리스트 페이지에서 볼 수 있으므로 결과 메시지 생략
		String view = null;
		int res = aDao.permitStore(c_num);
		if (res > 0) {//UPDATE 처리시 res는 1이 됨 (executeQuery의 처리와 유사)
			System.out.println("처리 결과 res : "+res);
			//처리 성공으로 판단, 승인 리스트에서 찾게 함
			view = "aAuthList";
		} else {
			System.out.println("처리 결과 res : "+res);
			//처리 실패로 판단, 대기 리스트에서 찾게 함
			view = "aPendingList";
		}
		return view;
	}

	//삭제 스위치 (일반 회원, 업체 회원 통합 스위치)
	public ModelAndView deleteSwitch(String id, int deleteSelect) {
		String view = null;
		int resInt = 0;
		String resStr = null;
		switch(deleteSelect) {
		case 1:
			resInt = aDao.deleteMember(id);
			if (resInt >0) {
				resStr = "삭제에 성공했습니다, 전체 회원 리스트로 이동합니다";				
			} else {
				resStr = "삭제에 실패했습니다, 전체 회원 리스트로 이동합니다";
			}
			mv.addObject("msg", resStr);
			view = "redirect:getMemberList";
			break;
		case 2:
			resInt = aDao.deleteStore(id);
			if (resInt >0) {
				resStr = "삭제에 성공했습니다, 전체 업체 회원 리스트로 이동합니다";				
			} else {
				resStr = "삭제에 실패했습니다, 전체 업체 회원 리스트로 이동합니다";
			}
			mv.addObject("msg", resStr);
			view = "redirect:aAllCeoList";
			break;
		}

		mv.setViewName(view);
		return mv;
	}

	//메일 전송 처리
	public void sendMail(EmailDto email) {
		List<String> eMails = aDao.getMailList_M();
		for (int i=0; i<eMails.size(); i++) {
			System.out.println(eMails.get(i));			
		}

	}

	public String mailSend
	(EmailDto email, int mailType)
			throws AddressException, MessagingException {
		String resStr = "";
		List<String> mailList = null;

		// 네이버일 경우 smtp.naver.com을 입력
		// Google일 경우 smtp.gmail.com을 입력
		try {
			String host = "smtp.naver.com";
			final String username = "worldwar1914";
			final String password = "1qw23er4";
			int port=465; //포트번호

			//메일 내용
			//받는 사람의 메일주소들 가져오기
			switch(mailType) {
			case 1:
				mailList = aDao.getMailList_M();
				break;
			case 2:
				mailList = aDao.getMailList_C();
				break;
			}
			System.out.println("DAO에서 이메일 리스트 가져오기 완료");

			//메일리스트(M 또는 C에서 가져온 이메일 레코드 리스트)의 길이만큼만 반복해 수신자 목록에 추가
			InternetAddress[] toAddr = new InternetAddress[mailList.size()];
			for(int i=0; i<mailList.size(); i++) {
				toAddr[i]= new InternetAddress(mailList.get(i));
			}

			//메일 제목
			String subject = email.getSubject();

			//메일 내용 가져와서 스트링버퍼에 옮겨 담기
			StringBuffer sb = new StringBuffer();
			String body = email.getMessage();
			sb.append(body);

			//어펜드로 종합된 버퍼들을 하나의 String으로 포장
			String content = sb.toString();

			// 정보를 담기 위한 객체 생성
			Properties props = System.getProperties();
			// SMTP 서버 정보 설정
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			System.out.println("props 설정 완료");

			//Session 생성
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=username;
				String pw=password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			session.setDebug(true);//for debug

			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();
			MimeBodyPart mFilePart = null;

			//MimeMessage 생성 - 메일의 각각의 요소를 기억
			Message mimeMessage = new MimeMessage(session);

			//발신자 세팅 , 보내는 사람의 이메일 주소를 한번 더 입력
			mimeMessage.setFrom(new InternetAddress("worldwar1914@naver.com"));

			//수신자 세팅 (배열도 가능)
			mimeMessage.setRecipients(Message.RecipientType.TO, toAddr );

			//제목 세팅
			mimeMessage.setSubject(subject);

			//멀티파트도 내용으로 기억가능, 멀티파트 mParts에 몰아 담기
			mTextPart.setText(content);
			mParts.addBodyPart(mTextPart);

			mimeMessage.setContent(mParts); //내용 세팅

			//mimeMessage.setFileName();//첨부파일명으로 쓰일 이름 세팅

			System.out.println("메시지에 모든 요소 세팅 완료");

			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용

			resStr = "메일 발송이 완료되었습니다";
		} catch (AddressException e) {
			resStr = "메일 발송에 실패했습니다";
		}
		return resStr;
	}//메일 발송 메소드 끝
	
	
}//서비스 클래스 끝