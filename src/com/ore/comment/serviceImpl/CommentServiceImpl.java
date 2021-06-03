package com.ore.comment.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ore.comment.service.CommentService;
import com.ore.comment.vo.CommentVO;
import com.ore.common.DAO;

public class CommentServiceImpl extends DAO implements CommentService{
	PreparedStatement psmt;
    ResultSet rs;
    CommentVO rvo = null;
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
    public int getSeq() {
    	int result = 1;
        try {
            sql="select qnacomment_seq.nextval from dual";
 
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery(); // 쿼리 실행
 
            if (rs.next()) {
            	result = rs.getInt(1);
            }
 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        } finally {
        	close();
		}
        return result;

    }

	@Override
	public ArrayList<CommentVO> commentList(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertComment(CommentVO vo) {
		return false;
	}

	@Override
	public void updateComment(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	
}
