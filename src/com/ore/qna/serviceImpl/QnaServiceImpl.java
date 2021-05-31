package com.ore.qna.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public List<QnaVO> qnaListPaging(int page) {
		String sql = "select b.*\r\n"
				+ "from(select rownum rn, a.*\r\n"//
				+ "        from (select * from qna n order by n.id ) a\r\n"
				+ ") b\r\n"
				+ "where b.rn between ? and ?";
		int firstCnt, lastCnt = 0;
		firstCnt = (page - 1) * 10 + 1; // 1, 11
		lastCnt = (page * 10);			// 10, 20
		List<QnaVO> list = new ArrayList<QnaVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new QnaVO();
				rvo.setId(rs.getInt("id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setTitle(rs.getString("title"));
				rvo.setWriter(rs.getString("writer"));
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
	public List<QnaVO> qnaSelectList() {
		sql = "select * from qna order by 1 desc";
		List<QnaVO> list = new ArrayList<QnaVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new QnaVO();
				rvo.setId(rs.getInt("id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setTitle(rs.getString("title"));
				rvo.setWriter(rs.getString("writer"));
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
	
	public List<QnaVO> itemCodeList(String code) {
		sql = "select item_code\r\n"
				+ "from product\r\n"
				+ "where substr(item_code,1,1) = upper(substr(?,1,1))";
		List<QnaVO> list = new ArrayList<QnaVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, code);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new QnaVO();
				rvo.setId(rs.getInt("id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setTitle(rs.getString("title"));
				rvo.setWriter(rs.getString("writer"));
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
		sql = "select * from qna where writer = ? and id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getWriter());
			psmt.setInt(2, vo.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				rvo = new QnaVO();
				hitCount(vo.getId());
				rvo.setId(rs.getInt("id"));
				rvo.setItemCode(rs.getString("item_code"));
				rvo.setTitle(rs.getString("title"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setContent(rs.getString("content"));
				rvo.setRegDate(rs.getDate("reg_date"));
				rvo.setHit(rs.getInt("hit"));			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rvo;
	}

	@Override
	public int insertQna(QnaVO vo) {
		sql = "insert into qna values(qna_seq.nextval, ?, ?, ?, ?, sysdate, 0)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getContent());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getId()+"번 Q&A 입력");
			} else {
				System.out.println("Q&A 입력 실패..");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int updateQna(QnaVO vo) {
		sql = "update qna set title = ?, content = ? where id = ? and writer = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getId());
			psmt.setString(4, vo.getWriter());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getId()+"번 Q&A 수정");
			} else {
				System.out.println("Q&A 수정 실패..");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int deleteQna(QnaVO vo) {
		sql = "delete from qna where id = ? and item_code = ? and writer = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getId());
			psmt.setString(2, vo.getItemCode());
			psmt.setString(3, vo.getWriter());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(vo.getId()+"번 Q&A 삭제");
			} else {
				System.out.println("Q&A 삭제 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	public void hitCount(int id) { // 호출하는 값의 cnt 증가.
		String sql = "update qna set hit = hit+1 where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			int n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(id+"번글 조회수 증가!");				
			} else {
				System.out.println("실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
