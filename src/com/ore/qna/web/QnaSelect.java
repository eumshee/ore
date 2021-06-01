package com.ore.qna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("id");
		String id = request.getParameter("id");		

		QnaVO vo = new QnaVO();
		vo.setWriter(writer);
		vo.setId(Integer.parseInt(id));
		
		QnaService service = new QnaServiceImpl();
		QnaVO rvo = service.qnaSelect(vo);
		
		request.setAttribute("qna", rvo);
		
		return "qna/qna.tiles";
	}

}