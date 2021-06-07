package com.ore.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class ReviewInsertCodeForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("itemCode");
		String cate = request.getParameter("itemCode");
		
		QnaServiceImpl service = new QnaServiceImpl();
		List<QnaVO> list = service.itemCodeList(code);
		
		request.setAttribute("code", list);
		request.setAttribute("cate", cate);
		System.out.println(cate);
		
		return "review/reviewCodeForm.tiles";
	}

}
