package com.ore.orders.service;

import java.util.List;

import com.ore.orders.vo.OrdersVO;

public interface OrdersService {
	// 리스트, 한건조회, 입력, 수정, 삭제
	List<OrdersVO> selectOrdersList(String id);
	OrdersVO selectOrders(OrdersVO vo);
	int insertOrders(OrdersVO vo);
	int updateOrders(OrdersVO vo);
	int deleteOrders(OrdersVO vo);
	
	public List<OrdersVO> ordersListPaging(int page, String category, String sort);

}
