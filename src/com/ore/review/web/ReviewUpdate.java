package com.ore.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.review.service.ReviewService;
import com.ore.review.serviceImpl.ReviewServiceImpl;
import com.ore.review.vo.ReviewVO;

public class ReviewUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String content = request.getParameter("ccontent");
		String num = request.getParameter("rvNum");
		String writer = request.getParameter("writer");
		
		ReviewVO vo = new ReviewVO();
		vo.setReviewTitle(title);
		vo.setReviewContent(content);
		vo.setReviewNum(Integer.parseInt(num));
		vo.setUserId(writer);
		
		ReviewService service = new ReviewServiceImpl();
		service.updateReview(vo);
		
		return "/reviewList.do";
	}

}
