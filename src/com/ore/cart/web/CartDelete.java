package com.ore.cart.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.cart.service.CartService;
import com.ore.cart.serviceImpl.CartServiceImpl;
import com.ore.cart.vo.CartVO;
import com.ore.common.DbCommand;

public class CartDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String code = request.getParameter("itemCd");
		
		CartVO vo = new CartVO();
		vo.setUserId(id);
		vo.setItemCode(code);
		
		CartService service = new CartServiceImpl();
		service.deleteCart(vo);
		
		return "/cartList.do";
	}

}
