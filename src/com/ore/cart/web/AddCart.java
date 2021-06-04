package com.ore.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.cart.serviceImpl.CartServiceImpl;
import com.ore.common.DbCommand;


public class AddCart implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// cart 테이블에 한건 추가(회원아이디, 상품코드, 수량(=1))
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String itemCode = request.getParameter("itemCode");
		String qty = request.getParameter("qty");
		
		CartServiceImpl service = new CartServiceImpl();
		service.addCart(id, itemCode, Integer.parseInt(qty));
		
		service = new CartServiceImpl();
		int cartCnt = service.getCountCart(id);
		
		session.setAttribute("cartCnt", cartCnt);
		
		return "";
	}

}
