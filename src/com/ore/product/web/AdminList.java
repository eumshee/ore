package com.ore.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.common.Paging;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class AdminList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");	// 페이지 번호
		String category = request.getParameter("category");	
		if (page == null) 
			page = "1";
		int pageCnt = Integer.parseInt(page);
		ProductServiceImpl service = new ProductServiceImpl();
		List<ProductVO> total = service.selectProductList(); // 전체카운트
		
		// 전체 건수를 위해 실행
		service = new ProductServiceImpl();
		List<ProductVO> list = service.productListPaging(pageCnt, "");
		
		//현재 페이지 리스트를 위해 실행
        Paging paging = new Paging();
        paging.setPageNo(pageCnt);	
        paging.setPageSize(9);		//페이지 크기
        paging.setTotalCount(total.size());
        
        request.setAttribute("ProductList", list);
        request.setAttribute("paging", paging);

        if(request.getAttribute("proList")!=null) {
        	List<ProductVO> list2 = (List<ProductVO>) request.getAttribute("proList");
        	request.setAttribute("proList", list2);      	
        }
        
        return "admin/adminList.tiles";
	}

}
