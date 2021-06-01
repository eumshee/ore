package com.ore.cart.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.cart.serviceImpl.CartServiceImpl;
import com.ore.cart.vo.CartVO;
import com.ore.common.DbCommand;


public class CartList implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		  
		CartServiceImpl service = new CartServiceImpl();
		List<CartVO> list = service.cartSelectList(id);
		
		request.setAttribute("clist", list);
		
		CartServiceImpl service2 = new CartServiceImpl();
		int cartCnt = service2.getCountCart(id);
		
		session.setAttribute("cartCnt", cartCnt);
		
		return "product/cartList.tiles";
	}

}
