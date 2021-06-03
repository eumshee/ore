package com.ore.comment.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.comment.service.CommentService;
import com.ore.comment.serviceImpl.CommentServiceImpl;
import com.ore.comment.vo.CommentVO;
import com.ore.common.DbCommand;

public class CommentInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		CommentService service = new CommentServiceImpl();
		CommentVO vo = new CommentVO();
		
		// 파리미터 값을 가져온다.
		int commentBoard = Integer.parseInt(request.getParameter("commentBoard"));
		String commentId = request.getParameter("commentId");
		String commentContent = request.getParameter("commentContent");
		String commentParent;
		
		vo.setCommentNum(service.getSeq()); // 댓글번호는 시퀀스값
		vo.setCommentBoard(commentBoard);
		vo.setCommentId(commentId);
		if(request.getParameter("commentParent")!=null) {
			commentParent = request.getParameter("commentParent");
			vo.setCommentParent(Integer.parseInt(commentParent));
		} else {
			commentParent = "0";
			vo.setCommentParent(Integer.parseInt(commentParent));
		}
		vo.setCommentContent(commentContent);

		service.insertComment(vo);
		
		return "";
	}

}
