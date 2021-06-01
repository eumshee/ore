package com.ore.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.cart.service.CartService;
import com.ore.cart.serviceImpl.CartServiceImpl;
import com.ore.common.DbCommand;

public class CartUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String qty = request.getParameter("itemQty");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String code = request.getParameter("itemCode");
		System.out.println(qty+" "+id+" "+code);
		
		CartService service = new CartServiceImpl();
		service.updateCart(Integer.parseInt(qty),id,code);
		
		return "/cartList.do";
	}

}
