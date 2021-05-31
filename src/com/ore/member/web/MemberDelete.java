package com.ore.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.member.service.MemberService;
import com.ore.member.serviceImpl.MemberServiceImpl;
import com.ore.member.vo.MemberVO;

public class MemberDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberVO vo = new MemberVO();
		vo.setUserId(id);
		
		MemberService service = new MemberServiceImpl();
		service.deleteMember(vo);
		session.invalidate();
		
		return "member/memberDelete.tiles";
	}

}
