package com.ore.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.cart.serviceImpl.CartServiceImpl;

public class IndexPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		 
		CartServiceImpl service = new CartServiceImpl();
		int cartCnt = service.getCountCart(id);
		
		session.setAttribute("cartCnt", cartCnt);
		
		return "common/section.tiles";
	}

}
