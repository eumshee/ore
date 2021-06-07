package com.ore.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.review.service.ReviewService;
import com.ore.review.serviceImpl.ReviewServiceImpl;
import com.ore.review.vo.ReviewVO;

public class ReviewDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		
		ReviewVO vo = new ReviewVO();
		vo.setReviewNum(Integer.parseInt(num));
		
		ReviewService service = new ReviewServiceImpl();
		service.deleteReview(vo);
		
		return "/reviewList.do";
	}

}
