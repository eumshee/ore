package com.ore.review.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.review.service.ReviewService;
import com.ore.review.vo.ReviewVO;

public class ReviewServiceImpl extends DAO implements ReviewService{
	PreparedStatement psmt;
	ResultSet rs;
	ReviewVO rvo = null;
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
	
	@Override
	public List<ReviewVO> reviewList() {
		sql = "select * from review order by 1 desc";
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new ReviewVO();
				rvo.setReviewNum(rs.getInt("review_num"));
				rvo.setItemImg(rs.getString("item_img"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setReviewTitle(rs.getString("review_title"));
				rvo.setReviewContent(rs.getString("review_content"));
				rvo.setUserId(rs.getString("user_id"));
				rvo.setReviewScore(rs.getInt("review_score"));
				rvo.setReviewDate(rs.getDate("review_date"));
				list.add(rvo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public List<ReviewVO> reviewListPaging(int page) {
		String sql = "select b.*\r\n"
				+ "from(select rownum rn, a.*\r\n"//
				+ "        from (select * from review n order by n.review_num ) a\r\n"
				+ ") b\r\n"
				+ "where b.rn between ? and ?";
		int firstCnt, lastCnt = 0;
		firstCnt = (page - 1) * 10 + 1; // 1, 11
		lastCnt = (page * 10);			// 10, 20
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new ReviewVO();
				rvo.setReviewNum(rs.getInt("review_num"));
				rvo.setItemImg(rs.getString("item_img"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setReviewTitle(rs.getString("review_title"));
				rvo.setReviewContent(rs.getString("review_content"));
				rvo.setUserId(rs.getString("user_id"));
				rvo.setReviewScore(rs.getInt("review_score"));
				rvo.setReviewDate(rs.getDate("review_date"));
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
	public List<ReviewVO> reviewSelectList(String id) {
		sql = "select * from review where user_id= ? order by 1 desc";
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new ReviewVO();
				rvo.setReviewNum(rs.getInt("review_num"));
				rvo.setItemImg(rs.getString("item_img"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setReviewTitle(rs.getString("review_title"));
				rvo.setReviewContent(rs.getString("review_content"));
				rvo.setUserId(rs.getString("user_id"));
				rvo.setReviewScore(rs.getInt("review_score"));
				rvo.setReviewDate(rs.getDate("review_date"));
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
	public ReviewVO reviewSelect(ReviewVO vo) {
		sql = "select * from review where user_id = ? and item_code = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getItemCode());
			rs = psmt.executeQuery();
			if(rs.next()) {
				rvo = new ReviewVO();
				rvo.setReviewNum(rs.getInt("review_num"));
				rvo.setItemImg(rs.getString("item_img"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setItemName(rs.getString("item_name"));
				rvo.setReviewTitle(rs.getString("review_title"));
				rvo.setReviewContent(rs.getString("review_content"));
				rvo.setUserId(rs.getString("user_id"));
				rvo.setReviewScore(rs.getInt("review_score"));
				rvo.setReviewDate(rs.getDate("review_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rvo;
	}

	@Override
	public int insertReview(ReviewVO vo) {
		sql = "insert into review values(review_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemImg());
			psmt.setString(2, vo.getItemCode());
			psmt.setString(3, vo.getItemName());
			psmt.setString(4, vo.getReviewTitle());
			psmt.setString(5, vo.getReviewContent());
			psmt.setInt(6, vo.getReviewScore());
			psmt.setString(7, vo.getUserId());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getUserId()+"님의 "+vo.getItemCode()+" 제품 리뷰 등록");
			} else {
				System.out.println("리뷰 등록 실패..");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int updateReview(ReviewVO vo) {
		sql = "update review set review_title = ?, review_content = ? where user_id = ? and review_num = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getReviewTitle());
			psmt.setString(2, vo.getReviewContent());
			psmt.setString(3, vo.getUserId());
			psmt.setInt(4, vo.getReviewNum());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getUserId()+"리뷰 "+n+"건 수정");
			} else {
				System.out.println("리뷰 수정 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	public ReviewVO selectProduct(ReviewVO vo) {
		sql = "select * from product where item_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemImg(rs.getString("item_img"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		sql = "delete from review where review_num = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getReviewNum());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getReviewNum()+"번 리뷰 삭제");
			} else {
				System.out.println("리뷰 삭제 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

}
