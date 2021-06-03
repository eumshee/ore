package com.ore.qna.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.common.Paging;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaList implements DbCommand {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page"); // (원하는) 페이지번호.
		if(page == null) {
			page="1";
		}
		int pageCnt = Integer.parseInt(page);
		
		// 전체 건수를 위해 실행.
		QnaServiceImpl service = new QnaServiceImpl();
		List<QnaVO> total = service.qnaList(); 

		// 현재 페이지 리스트를 위해 실행.
		service = new QnaServiceImpl();
		List<QnaVO> list = service.qnaListPaging(pageCnt);
		
		Paging paging = new Paging();
        paging.setPageNo(pageCnt);	// 해당 페이지 이동
        paging.setPageSize(10);
        paging.setTotalCount(total.size());
		
        request.setAttribute("qnaList", list);	 
        request.setAttribute("paging", paging);	
		
		return "qna/qnaList.tiles";
	}

}
