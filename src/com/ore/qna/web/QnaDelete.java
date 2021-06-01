package com.ore.qna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("did");
		String writer = request.getParameter("dwriter");
		
		QnaVO vo = new QnaVO();
		vo.setId(Integer.parseInt(id));
		vo.setWriter(writer);
		
		QnaService service = new QnaServiceImpl();
		service.deleteQna(vo);
		
		return "/qnaList.do";
	}

}
