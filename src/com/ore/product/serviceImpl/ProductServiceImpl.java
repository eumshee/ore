package com.ore.product.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.notice.vo.NoticeVO;
import com.ore.product.service.ProductService;
import com.ore.product.vo.ProductVO;

public class ProductServiceImpl extends DAO implements ProductService {

	PreparedStatement psmt;
	ResultSet rs;
	String sql;

	// 페이징 기능
	public List<ProductVO> productListPaging(int page, String category, String sort) {
		String sql = "select b.* " + "from (select rownum rn,a.* "
				+ "      from(select * from product where substr(item_code, 1, 1) = nvl(?,substr(item_code, 1, 1)) ";
		if (sort.equals("new")) {
			sql += "order by item_date desc";
		} else if (sort.equals("name")) {
			sql += "order by item_name";
		} else if (sort.equals("lowest")) {
			sql += "order by item_price";
		} else if (sort.equals("highest")) {
			sql += "order by item_price desc";
		}
		sql += ")a ";
		sql += "      )b ";
		sql += "where b.rn between ? and ?";
		List<ProductVO> list = new ArrayList<>();
		int firstCnt = 0, lastCnt = 0;
		firstCnt = (page - 1) * 9 + 1; // 1 , 11
		lastCnt = (page * 9); // 10, 20

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, category);
			psmt.setInt(2, firstCnt);
			psmt.setInt(3, lastCnt);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getString("item_date").substring(0, 10));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 상품 전체조회
	@Override
	public List<ProductVO> selectProductList(String cate, String sort) {
		sql = "select * from product p where substr(p.ITEM_CODE, 1, 1)=nvl(?, substr(p.ITEM_CODE, 1, 1))";
		if (sort.equals("new")) {
			sql += "order by item_date desc";
		} else if (sort.equals("name")) {
			sql += "order by item_name";
		} else if (sort.equals("lowest")) {
			sql += "order by item_price";
		} else if (sort.equals("highest")) {
			sql += "order by item_price desc";
		}

		List<ProductVO> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, cate);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getString("item_date").substring(0, 10));
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
				vo.setItemDate(rs.getString("item_date"));
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
				vo.setItemDate(rs.getString("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// BOTTOM 전체조회
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
				vo.setItemDate(rs.getString("item_date"));
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
				vo.setItemDate(rs.getString("item_date"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public boolean cdCheck(String cd) {
		boolean exist = false;
		String SQL = "select item_code from product where item_code=?";
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, cd);
			rs = psmt.executeQuery();
			if (rs.next()) {
				exist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return exist;
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
				vo.setItemDate(rs.getString("item_date").substring(0, 10));
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
			psmt.setString(7, vo.getItemDate());
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
		String SQL = "update product set item_name=?, item_price=?, item_stock=?, item_date=?, item_desc=?, item_img=?"
				+ "where item_code=?";
		int r = 0;
		try {
			psmt = conn.prepareStatement(SQL);
			psmt.setString(1, vo.getItemName());
			psmt.setInt(2, vo.getItemPrice());
			psmt.setInt(3, vo.getItemStock());
			psmt.setString(4, vo.getItemDate());
			psmt.setString(5, vo.getItemDesc());
			psmt.setString(6, vo.getItemImg());
			psmt.setString(7, vo.getItemCode());
			r = psmt.executeUpdate();
			System.out.println(r + "건 수정됨.");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return r;
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

	public List<ProductVO> productSearch(String itemName) {
		sql = "select * from product\r\n" + "where item_name like initcap(?)";
		List<ProductVO> list = new ArrayList<ProductVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + itemName + "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO vo = new ProductVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
				vo.setItemPrice(rs.getInt("item_price"));
				vo.setItemStock(rs.getInt("item_stock"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemDate(rs.getString("item_date").substring(0, 10));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
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
