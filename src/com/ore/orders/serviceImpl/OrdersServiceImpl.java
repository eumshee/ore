package com.ore.orders.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.orders.service.OrdersService;
import com.ore.orders.vo.OrdersVO;
import com.ore.qna.vo.QnaVO;

public class OrdersServiceImpl extends DAO implements OrdersService {

	PreparedStatement psmt;
	ResultSet rs;
	String sql;
	OrdersVO rvo = null;
	
	@Override
	public List<OrdersVO> selectOrdersList(String id) {
		sql = "select * from orders where user_id = ? order by 4 desc";
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new OrdersVO();
				rvo.setOrderNum(rs.getString("order_num"));
				rvo.setUserId(rs.getString("user_id"));
				rvo.setOrderName(rs.getString("order_name"));
				rvo.setOrderDate(rs.getString("order_date"));
				rvo.setOrderPrice(rs.getString("order_price"));
				rvo.setOrderTel(rs.getString("order_tel"));
				rvo.setOrderMail(rs.getString("order_mail"));
				rvo.setOrderAddr(rs.getString("order_addr"));
				list.add(rvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	@Override
	public OrdersVO selectOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertOrders(OrdersVO vo) {
		sql = "insert into orders values(?,?,?,TO_DATE(?,'yyyy-MM-dd HH24:mi:ss'),?,?,?,?,?)";
		int r = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getOrderNum());
			psmt.setString(2, vo.getUserId());
			psmt.setString(3, vo.getOrderName());
			psmt.setString(4, vo.getOrderDate());
			psmt.setString(5, vo.getOrderPrice());
			psmt.setString(6, vo.getOrderTel());
			psmt.setString(7, vo.getOrderMail());
			psmt.setString(8, vo.getOrderAddr());
			psmt.setString(9, vo.getOrderMsg());
			r = psmt.executeUpdate();
			System.out.println("주문" + r + "건 등록됨. ");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return r;
	}
	@Override
	public int updateOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteOrders(OrdersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<OrdersVO> ordersListPaging(int page, String category, String sort) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
