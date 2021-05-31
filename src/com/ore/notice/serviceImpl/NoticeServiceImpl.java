package com.ore.notice.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.notice.service.NoticeService;
import com.ore.notice.vo.NoticeVO;

public class NoticeServiceImpl extends DAO implements NoticeService {
	PreparedStatement psmt;
	ResultSet rs;
	NoticeVO rvo = null;
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
	
	public List<NoticeVO> noticeListPaging(int page) {
		String sql = "select b.*\r\n"
				+ "from(select rownum rn, a.*\r\n"//
				+ "        from (select * from notice n order by n.id ) a\r\n"
				+ ") b\r\n"
				+ "where b.rn between ? and ?";
		int firstCnt, lastCnt = 0;
		firstCnt = (page - 1) * 10 + 1; // 1, 11
		lastCnt = (page * 10);			// 10, 20
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, firstCnt);
			psmt.setInt(2, lastCnt);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new NoticeVO();
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
	public List<NoticeVO> noticeSelectList() {
		sql = "select * from notice order by 1";
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new NoticeVO();
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
	public NoticeVO noticeSelect(NoticeVO vo) {
		sql = "select * from notice where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				rvo = new NoticeVO();
				hitCount(vo.getId()); // 조회수 증가
				rvo.setId(rs.getInt("id"));
				rvo.setTitle(rs.getString("title"));
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

	public List<NoticeVO> noticeSearch(String title, String content){
		String sql = "select * from notice "
				+ "where title like ? "
				+ "or content like ?";
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+title+"%");
			psmt.setString(2, "%"+content+"%");
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new NoticeVO();
				rvo.setId(rs.getInt("id"));
				rvo.setHit(rs.getInt("hit"));
				rvo.setTitle(rs.getString("title"));
				rvo.setContent(rs.getString("content"));
				rvo.setRegDate(rs.getDate("reg_date"));
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
	public int insertNotice(NoticeVO vo) {
		int n = 0;
		sql = "insert into notice values(notice_seq.nextval, ?, ?, sysdate, 0)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(n+"건 입력");
			} else {
				System.out.println("입력 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		int n = 0;
		sql = "update notice set title=?, content=? where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getId());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(n+"건 수정");
			} else {
				System.out.println("수정 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int deleteNotice(NoticeVO vo) {
		int n = 0;
		sql = "delete from notice where id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getId());
			n = psmt.executeUpdate();
			if(n!=0) {
				System.out.println(n+"건 삭제");
			} else {
				System.out.println("삭제 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}
	
	public void hitCount(int id) { // 호출하는 값의 cnt 증가.
		String sql = "update notice set hit = hit+1 where id = ?";
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
