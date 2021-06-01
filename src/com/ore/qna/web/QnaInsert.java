package com.ore.qna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("itemCode");
		String title = request.getParameter("title");
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("id");
		String content = request.getParameter("content");
		
		QnaVO vo = new QnaVO();
		vo.setItemCode(code);
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		
		QnaService service = new QnaServiceImpl();
		service.insertQna(vo);
		
		return "/qnaList.do";
	}

}
