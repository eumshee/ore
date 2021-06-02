package com.ore.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.member.service.MemberService;
import com.ore.member.serviceImpl.MemberServiceImpl;
import com.ore.member.vo.MemberVO;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class MemberSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		MemberService service = new MemberServiceImpl();
		MemberVO vo = service.selectMember(id);
		
		request.setAttribute("vo", vo);
		
		QnaService service2 = new QnaServiceImpl();
		List<QnaVO> list = service2.qnaSelectList(id);
		
		request.setAttribute("qnaList", list);

		QnaService service3 = new QnaServiceImpl();
		List<QnaVO> list2 = service3.qnaList();		
		request.setAttribute("qnaAll", list2);
		
		return "member/memberSelect.tiles";
	}

}
