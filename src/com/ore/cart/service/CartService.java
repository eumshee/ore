package com.ore.cart.service;

import java.util.List;

import com.ore.cart.vo.CartVO;

public interface CartService {
	List<CartVO> cartSelectList(String uid);
	CartVO cartSelect(CartVO vo);
	void addCart(String id, String item, int qty);
	int updateCart(CartVO vo);
	int deleteCart(CartVO vo);
}
