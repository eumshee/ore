package com.ore.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.common.Paging;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class ProductListPaging implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");	// 페이지 번호
		String category = request.getParameter("cate");	
		String sort = request.getParameter("sort");	
		
		if (page == null) 
			page = "1";
		int pageCnt = Integer.parseInt(page);
		ProductServiceImpl service = new ProductServiceImpl();
		List<ProductVO> total = service.selectProductList(category, sort); // 전체 데이터 가져올때 
		
		// 전체 건수를 위해 실행
		service = new ProductServiceImpl();
		List<ProductVO> list = service.productListPaging(pageCnt, category, sort);//
		
		//현재 페이지 리스트를 위해 실행
        Paging paging = new Paging();
        paging.setPageNo(pageCnt);	
        paging.setPageSize(9);		//페이지 크기
        paging.setTotalCount(total.size());
		
        request.setAttribute("ProductList", list);
        request.setAttribute("paging", paging);
        request.setAttribute("category", category);
        request.setAttribute("sort", sort);
        return "product/productList.tiles";
	}

}
