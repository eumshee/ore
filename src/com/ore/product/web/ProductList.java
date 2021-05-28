package com.ore.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.product.service.ProductService;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class ProductList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = request.getParameter("memberId");
		
		ProductService service = new ProductServiceImpl();
		List<ProductVO> list = service.selectProductList();

		request.setAttribute("id", id);
		request.setAttribute("ProductList", list);
		
		return "product/productList.tiles";
	}

}
