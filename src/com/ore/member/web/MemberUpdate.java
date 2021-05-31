package com.ore.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.member.service.MemberService;
import com.ore.member.serviceImpl.MemberServiceImpl;
import com.ore.member.vo.MemberVO;

public class MemberUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String pw = request.getParameter("userPw");
		
		MemberVO vo = new MemberVO();
		
		if(pw !=null) {			
			vo.setUserPw(pw);
		} else {
			vo.setUserPw("");
		}		

		vo.setUserId(id);
		
		MemberService service = new MemberServiceImpl();
		int n  = service.updateMember(vo);
		
		request.setAttribute("update", n);
		
		return "/memberSelect.do";
	}

}
