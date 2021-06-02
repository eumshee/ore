package com.ore.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class AdminSearch implements DbCommand{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		
		ProductServiceImpl service = new ProductServiceImpl();
		List<ProductVO> list = service.productSearch(name);
		
		request.setAttribute("proList", list);
		
		return "/adminList.do";
	}
}
