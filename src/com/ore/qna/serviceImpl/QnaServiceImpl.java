package com.ore.qna.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.qna.service.QnaService;
import com.ore.qna.vo.QnaVO;

public class QnaServiceImpl extends DAO implements QnaService{
	PreparedStatement psmt;
	ResultSet rs;
	QnaVO rvo = null;
	String sql = null;
	
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
	public List<QnaVO> qnaSelectList() {
		sql = "select * from qna order by 1";
		List<QnaVO> list = new ArrayList<QnaVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new QnaVO();
				rvo.setId(rs.getInt("id"));
				rvo.setTitle(rs.getString("title"));
				rvo.setContent(rs.getString("content"));
				rvo.setRegDate(rs.getDate("reg_date"));
				rvo.setHit(rs.getInt("hit"));
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
	public QnaVO qnaSelect(QnaVO vo) {
		return null;
	}

	@Override
	public int insertQna(QnaVO vo) {
		return 0;
	}

	@Override
	public int updateQna(QnaVO vo) {
		return 0;
	}

	@Override
	public int deleteQna(QnaVO vo) {
		return 0;
	}

}
