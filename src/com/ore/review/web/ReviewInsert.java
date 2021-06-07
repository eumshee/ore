package com.ore.review.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.review.service.ReviewService;
import com.ore.review.serviceImpl.ReviewServiceImpl;
import com.ore.review.vo.ReviewVO;

public class ReviewInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("itemCode");
		String title = request.getParameter("title");
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("id");
		String content = request.getParameter("content");
		String score = request.getParameter("score");
		
		ReviewServiceImpl service = new ReviewServiceImpl();
		ReviewVO pvo = new ReviewVO();
		pvo.setItemCode(code);

		ReviewVO rvo = service.selectProduct(pvo);
		ReviewVO vo = new ReviewVO();
		vo.setItemImg(rvo.getItemImg());
		vo.setItemCode(rvo.getItemCode());
		vo.setItemName(rvo.getItemName());
		
		vo.setReviewTitle(title);
		vo.setReviewContent(content);
		vo.setReviewScore(Integer.parseInt(score));
		vo.setUserId(writer);
		
		ReviewService service2 = new ReviewServiceImpl();
		service2.insertReview(vo);
		
		return "/reviewList.do";
	}

}
