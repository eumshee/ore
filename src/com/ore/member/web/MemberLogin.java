package com.ore.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.member.serviceImpl.MemberServiceImpl;
import com.ore.member.vo.MemberVO;

public class MemberLogin implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// id, pwd 확인 --> 결과를 return
		// 정상적인 회원이면 이름을 화면으로 보여주도록.
		
		// 현재 세션 정보
		HttpSession session = request.getSession();
		
		String id = request.getParameter("memberId");
		String pwd = request.getParameter("memberPwd");
		
		MemberVO vo = new MemberVO();
		vo.setUserId(id);
		vo.setUserPw(pwd);
		
		MemberServiceImpl service = new MemberServiceImpl();
		MemberVO rvo = service.loginCheck(vo);
		String path = "";
		if(rvo == null) {
			// 회원존재X --> memberLoginFail.jsp
			path = "member/memberLoginFail.tiles";
		} else {
			// 로그인처리 --> memberLoginSuccess.jsp
			session.setAttribute("id", rvo.getUserId());// 세션유지하는동안
			session.setAttribute("member", vo);
			request.setAttribute("vo", rvo);		// 해당 페이지에서만
			
			path = "/index.do";
		}
		
		return path;
	}

}
