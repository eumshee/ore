package com.ore.cart.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ore.cart.service.CartService;
import com.ore.cart.vo.CartVO;
import com.ore.common.DAO;

public class CartServiceImpl extends DAO implements CartService {
	PreparedStatement psmt;
	ResultSet rs;
	
	CartVO rvo = null;
	String sql = null;
	int n = 0;
	
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 장바구니 전체조회
	@Override
	public List<CartVO> cartSelectList(String uid) {
		sql = "select c.user_id, c.item_code, p.item_name, count(c.item_qty) as item_qty, p.item_price, sum(p.item_price) as sum\r\n"
				+ "from cart c\r\n"
				+ "left outer join product p\r\n"
				+ "on (c.item_code=p.item_code)\r\n"
				+ "group by c.user_id, c.item_code, p.item_name, p.item_price\r\n"
				+ "having c.user_id=?";
		List<CartVO> list = new ArrayList<CartVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new CartVO();
				rvo.setUserId(rs.getString("user_id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setItemQty(rs.getInt("item_qty"));
				rvo.setItemPrice(rs.getInt("item_price"));
				rvo.setSum(rs.getInt("sum"));
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
	public CartVO cartSelect(CartVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 회원별 장바구니 상품수
	public int getCountCart(String id) {
		sql = "select count(*) from cart where user_id = ? ";
		int rCnt = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				rCnt = rs.getInt(1); // 첫번째 칼럼 명시; alias(alias지정시)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rCnt;
	}
	
	@Override
	public void addCart(String id, String item, int qty) {
		sql = "insert into cart values(?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, item);
			psmt.setInt(3, qty);
			n = psmt.executeUpdate();
			System.out.println(id+"회원님"+item+" "+n+"건 주문");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	@Override
	public int updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(CartVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
