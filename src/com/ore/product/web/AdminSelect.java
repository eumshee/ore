package com.ore.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;

public class AdminSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(id);
		
		ProductServiceImpl service = new ProductServiceImpl();
		service.selectProduct(vo);
		
		
		request.setAttribute("product", vo);
		return "admin/adminSelect.tiles";
	}

}
