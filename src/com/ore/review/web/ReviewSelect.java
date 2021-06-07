package com.ore.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;
import com.ore.review.service.ReviewService;
import com.ore.review.serviceImpl.ReviewServiceImpl;
import com.ore.review.vo.ReviewVO;

public class ReviewSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String code = request.getParameter("code");
		
		ReviewVO vo = new ReviewVO();
		vo.setUserId(writer);
		vo.setItemCode(code);
		
		// 게시글
		ReviewService service = new ReviewServiceImpl();
		ReviewVO rvo = service.reviewSelect(vo);
		request.setAttribute("review", rvo);
		
		// 상품명
		QnaServiceImpl service2 = new QnaServiceImpl();
		QnaVO rvo2 = service2.itemCodeName(code);
		request.setAttribute("item", rvo2);
		return "review/review.tiles";
	}

}
