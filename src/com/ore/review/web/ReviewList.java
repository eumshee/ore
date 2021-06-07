package com.ore.review.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.common.Paging;
import com.ore.review.serviceImpl.ReviewServiceImpl;
import com.ore.review.vo.ReviewVO;

public class ReviewList implements DbCommand {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page"); // (원하는) 페이지번호.
		if(page == null) {
			page="1";
		}
		int pageCnt = Integer.parseInt(page);
		
		// 전체 건수를 위해 실행.
		ReviewServiceImpl service = new ReviewServiceImpl();
		List<ReviewVO> total = service.reviewList(); 

		// 현재 페이지 리스트를 위해 실행.
		service = new ReviewServiceImpl();
		List<ReviewVO> list = service.reviewListPaging(pageCnt);
		
		Paging paging = new Paging();
        paging.setPageNo(pageCnt);	// 해당 페이지 이동
        paging.setPageSize(10);
        paging.setTotalCount(total.size());
		
        request.setAttribute("reviewList", list);	 
        request.setAttribute("paging", paging);	
		
		return "review/reviewList.tiles";
	}

}
