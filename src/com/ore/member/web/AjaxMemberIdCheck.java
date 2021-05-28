package com.ore.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.member.serviceImpl.MemberServiceImpl;


@WebServlet("/ajaxMemberIdCheck")
@SuppressWarnings("serial")
public class AjaxMemberIdCheck extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// $.ajax에서 넘긴 파라미터
		String id = req.getParameter("id");
		
		MemberServiceImpl service = new MemberServiceImpl();
		int cnt = 0; // id 존재하지 않으면
		if(service.idCheck(id)) {
			cnt = 1; // id 존재하면
		};
		resp.getWriter().print(cnt);
	}

}
