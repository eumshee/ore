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
	public List<CartVO> cartSelectList(String id) {
		sql = "select c.user_id, c.item_code, p.item_name, sum(c.item_qty) as item_qty, p.item_price, p.item_img\r\n"
				+ "from cart c\r\n"
				+ "left outer join product p\r\n"
				+ "on (c.item_code=p.item_code)\r\n"
				+ "group by c.user_id, c.item_code, p.item_name, p.item_price, p.item_img\r\n"
				+ "having c.user_id=?";
		List<CartVO> list = new ArrayList<CartVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new CartVO();
				rvo.setUserId(rs.getString("user_id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setItemQty(rs.getInt("item_qty"));
				rvo.setItemPrice(rs.getInt("item_price"));
				rvo.setItemImg(rs.getString("item_img"));
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
		sql = "select sum(ITEM_QTY) from cart where user_id = ?";
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
		sql = "insert into cart values(?,?,?,cart_seq.nextval)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, item);
			psmt.setInt(3, qty);
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(id+"회원님"+item+" "+n+"건 주문");
			} else {
				System.out.println("주문입력 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	@Override
	public int updateCart(int qty, String id, String code) {
		String sql2 = "delete from cart \r\n"
				+ "where item_code=? and order_code <> (select min(order_code)\r\n"
				+ "                                          from cart \r\n"
				+ "                                          where item_code=?\r\n"
				+ "                                          group by item_code)";
		
		sql = "update cart set item_qty = ?\r\n"
				+ "where user_id = ? and item_code = ?";
		try {
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, code);
			psmt.setString(2, code);
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(id+"님 "+code+"제품 중복"+n+"건 주문삭제");				
			}
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, qty);
			psmt.setString(2, id);
			psmt.setString(3, code);
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(id+"님 "+code+"제품"+n+"건 주문변경");				
			} else {
				System.out.println("주문변경 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int deleteCart(CartVO vo) {
		sql = "delete from cart where user_id=? and item_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getUserId()+"님"+vo.getItemCode()+"제품"+n+"건 주문삭제");
			} else {
				System.out.println("주문삭제 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}



}
