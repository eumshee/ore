package com.ore.cart.service;

import java.util.List;

import com.ore.cart.vo.CartVO;

public interface CartService {
	List<CartVO> cartSelectList(String uid);
	String codeCount(String code);
	void addCart(String id, String item, int qty);
	int updateCart(int qty, String id, String code);
	int deleteCart(CartVO vo);
}
