package com.ore.product.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.product.service.ProductService;
import com.ore.product.vo.ProductVO;

public class ProductServiceImpl extends DAO implements ProductService {

	PreparedStatement psmt;
	ResultSet rs;
	String sql;

	// 상품 전체조회
	@Override
	public List<ProductVO> selectProductList() {
		sql = "select * from product order by 1";
		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	// OUTER 전체조회
	@Override
	public List<ProductVO> selectOuterList() {
		sql = "select * from product where item_code like 'O%'";
		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	// TOP 전체조회
	@Override
	public List<ProductVO> selectTopList() {
		sql = "select * from product where item_code like 'T%'";
		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	// BOTTM 전체조회
	@Override
	public List<ProductVO> selectBottomList() {
		sql = "select * from product where item_code like 'B%'";
		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	
	// Acc 전체조회
	@Override
	public List<ProductVO> selectAccList() {
		sql = "select * from product where item_code like 'A%'";
		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 한건 조회
	@Override
	public ProductVO selectProduct(ProductVO vo) {
		sql = "select * from product where item_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getDate("item_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	// 한건 입력
	@Override
	public int insertProduct(ProductVO vo) {
		sql = "insert into product values(?,?,?,?,?,?,?)";
		int r = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			psmt.setString(2, vo.getItemName());
			psmt.setString(3, vo.getItemImg());
			psmt.setInt(4, vo.getItemPrice());
			psmt.setInt(5, vo.getItemStock());
			psmt.setString(6, vo.getItemDesc());
			psmt.setDate(7, vo.getItemDate());
			r = psmt.executeUpdate();
			System.out.println(r + "건 등록됨. ");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return r;
	}

	// 한건 수정
	@Override
	public int updateProduct(ProductVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 한건 삭제
	@Override
	public int deleteProduct(ProductVO vo) {
		String SQL = "delete from product where item_code=?";
		int r = 0;
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, vo.getItemCode());
			r = psmt.executeUpdate();
			System.out.println(r + "건 삭제됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return r;
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
