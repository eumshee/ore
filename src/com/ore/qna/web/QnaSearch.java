package com.ore.qna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaSearch implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		QnaServiceImpl service = new QnaServiceImpl();
		List<QnaVO> list = service.qnaSearch(title, content);

		request.setAttribute("qnaList", list);
		
		return "qna/qnaSearchList.tiles";
	}

}
