package com.ore.member.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ore.common.DAO;
import com.ore.member.service.MemberService;
import com.ore.member.vo.MemberVO;

public class MemberServiceImpl extends DAO implements MemberService {
	PreparedStatement psmt;
	ResultSet rs;
	MemberVO rvo = null;
	String sql = null;
	int n = 0;
	
	// id 중복체크 메소드
	// 중복이면 true, 아니면 false.
	public boolean idCheck(String id) {
		boolean exist = false;
		sql = "select user_id from member where user_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				exist = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return exist;
	}
	
	// id, passwd를 체크해주는 메소드
	public MemberVO loginCheck(MemberVO vo) {
		sql = "select * from member where user_id=? and user_pw=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getUserPw());
			rs = psmt.executeQuery();
			if(rs.next()) {
				rvo = new MemberVO();
				rvo.setUserId(rs.getString("user_id"));
				rvo.setUserPw(rs.getString("user_pw"));
				rvo.setUserName(rs.getString("user_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rvo;
	}
	
	@Override
	public List<MemberVO> selectMemberList() {
		sql = "select * from member order by 1";
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rvo = new MemberVO();
				rvo.setUserId(rs.getString("user_id"));
				rvo.setUserPw(rs.getString("user_pw"));
				rvo.setUserName(rs.getString("user_name"));
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
	public MemberVO selectMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(MemberVO vo) {
		sql = "insert into member values(?,?,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			psmt.setString(2, vo.getUserName());
			psmt.setString(3, vo.getUserPw());
			n = psmt.executeUpdate();
			if(n != 0) {
				System.out.println(n+"건 입력");
			} else {
				System.out.println("입력 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int updateMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(MemberVO vo) {
		sql = "delete from member where user_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUserId());
			n = psmt.executeUpdate();
			if(n != 0) {
				System.out.println(n+"건 삭제");
			} else {
				System.out.println("삭제 실패..");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
