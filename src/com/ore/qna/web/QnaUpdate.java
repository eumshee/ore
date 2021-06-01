package com.ore.qna.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String writer = request.getParameter("writer");
		
		QnaVO vo = new QnaVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setId(Integer.parseInt(id));
		vo.setWriter(writer);
		
		QnaService service = new QnaServiceImpl();
		service.updateQna(vo);
		
		return "/qnaList.do";
	}

}
