package com.ore.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class AdminDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(code);
		
		ProductServiceImpl service = new ProductServiceImpl();
		service.deleteProduct(vo);
		
		return "/adminList.do";	
	}
}
