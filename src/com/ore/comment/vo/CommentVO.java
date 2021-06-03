package com.ore.comment.vo;

import java.sql.Date;

public class CommentVO {
	private int commentNum; 		// 댓글 글번호
	private int commentBoard;		// 게시글 번호
	private String commentId;		// 댓글 작성자
	private Date commentDate;		// 댓글 작성일
	private int commentParent;		// 부모글
	private String commentContent;	// 댓글 내용
	private int commentLevel;		// 댓글- 답변글 깊이

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getCommentBoard() {
		return commentBoard;
	}

	public void setCommentBoard(int commentBoard) {
		this.commentBoard = commentBoard;
	}

	public String getCommentId() {
		return commentId;
	}

	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getCommentParent() {
		return commentParent;
	}

	public void setCommentParent(int commentParent) {
		this.commentParent = commentParent;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}
	
}
