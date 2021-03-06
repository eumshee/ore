package com.ore.comment.service;

import java.util.ArrayList;

import com.ore.comment.vo.CommentVO;

public interface CommentService {
	ArrayList<CommentVO> commentList(int boardNum);
	boolean insertComment(CommentVO vo);
	boolean deleteComment(int commentNum, int commentBoard);
	int getSeq();

}
