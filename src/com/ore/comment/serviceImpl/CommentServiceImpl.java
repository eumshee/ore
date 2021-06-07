package com.ore.comment.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ore.comment.service.CommentService;
import com.ore.comment.vo.CommentVO;
import com.ore.common.DAO;

public class CommentServiceImpl extends DAO implements CommentService {
	PreparedStatement psmt;
	ResultSet rs;

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

	// 시퀀스 호출
	@Override
	public int getSeq() {
		int result = 1;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT QNACOMMENT_SEQ.NEXTVAL FROM DUAL");

			psmt = conn.prepareStatement(sql.toString());
			rs = psmt.executeQuery(); // 쿼리 실행

			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return result;
	}

	// 댓글 목록
	@Override
	public ArrayList<CommentVO> commentList(int boardNum) {
		ArrayList<CommentVO> list = new ArrayList<CommentVO>();
		try {

			/*
			 * 댓글의 페이지 처리를 하고싶다면 이 쿼리를 사용하면 된다. SELECT * FROM (SELECT ROWNUM AS rnum, data.*
			 * FROM (SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE,
			 * COMMENT_PARENT, COMMENT_CONTENT FROM BOARD_COMMENT WHERE COMMENT_BOARD = ?
			 * START WITH COMMENT_PARENT = 0 CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT)
			 * data) WHERE rnum>=? and rnum<=? ;
			 */

			StringBuffer sql = new StringBuffer();
			sql.append("    SELECT LEVEL, COMMENT_NUM, COMMENT_BOARD,");
			sql.append("            COMMENT_ID, COMMENT_DATE,");
			sql.append("            COMMENT_PARENT, COMMENT_CONTENT");
			sql.append("    FROM QNACOMMENT");
			sql.append("    WHERE COMMENT_BOARD = ?");
			sql.append("    START WITH COMMENT_PARENT = 0");
			sql.append("    CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT");

			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, boardNum);

			rs = psmt.executeQuery();
			while (rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setCommentLevel(rs.getInt("LEVEL"));
				comment.setCommentNum(rs.getInt("COMMENT_NUM"));
				comment.setCommentBoard(rs.getInt("COMMENT_BOARD"));
				comment.setCommentId(rs.getString("COMMENT_ID"));
				comment.setCommentDate(rs.getDate("COMMENT_DATE"));
				comment.setCommentParent(rs.getInt("COMMENT_PARENT"));
				comment.setCommentContent(rs.getString("COMMENT_CONTENT"));
				list.add(comment);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			close();
		}
		return list;
	}

	// 댓글 등록
	@Override
	public boolean insertComment(CommentVO vo) {
		boolean result = false;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO QNACOMMENT");
			sql.append(" (COMMENT_NUM, COMMENT_BOARD, COMMENT_ID, COMMENT_DATE");
			sql.append(" , COMMENT_PARENT, COMMENT_CONTENT)");
			sql.append(" VALUES(?,?,?,sysdate,?,?)");
			
			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, vo.getCommentNum());
			psmt.setInt(2, vo.getCommentBoard());
			psmt.setString(3, vo.getCommentId());
			psmt.setInt(4, vo.getCommentParent());
			psmt.setString(5, vo.getCommentContent());

			int flag = psmt.executeUpdate();
			if (flag > 0) {
				result = true;
			}

			String sql2 = "update qna set commentcnt = commentcnt +1 where id = ?";
			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, vo.getCommentBoard());
			int n = psmt.executeUpdate();
			if (n != 0) {
				System.out.println("댓글 수가 증가 되었습니다");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}


	// 댓글 1개의 정보를 가져온다.
	public CommentVO getComment(int comment_num) {
		CommentVO comment = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM QNACOMMENT WHERE COMMENT_NUM = ?");

			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, comment_num);

			rs = psmt.executeQuery();
			while (rs.next()) {
				comment = new CommentVO();
				comment.setCommentNum(rs.getInt("COMMENT_NUM"));
				comment.setCommentBoard(rs.getInt("COMMENT_BOARD"));
				comment.setCommentId(rs.getString("COMMENT_ID"));
				comment.setCommentDate(rs.getDate("COMMENT_DATE"));
				comment.setCommentParent(rs.getInt("COMMENT_PARENT"));
				comment.setCommentContent(rs.getString("COMMENT_CONTENT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return comment;
	}

	// 댓글 삭제
	@Override
	public boolean deleteComment(int commentNum, int commentBoard) {
		boolean result = false;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM QNACOMMENT");
			sql.append(" WHERE COMMENT_NUM IN");
			sql.append(" (SELECT COMMENT_NUM");
			sql.append(" FROM QNACOMMENT");
			sql.append(" START WITH COMMENT_NUM = ?");
			sql.append(" CONNECT BY PRIOR COMMENT_NUM = COMMENT_PARENT) ");

			psmt = conn.prepareStatement(sql.toString());
			psmt.setInt(1, commentNum);

			int flag = psmt.executeUpdate();
			if (flag > 0) {
				result = true;
			}
			
			String sql2 = "update qna set commentcnt = commentcnt -1 where id = ?";
			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, commentBoard);
			int n = psmt.executeUpdate();
			if (n != 0) {
				System.out.println("댓글 수가 감소 되었습니다");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

}
