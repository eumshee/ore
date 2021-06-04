package com.ore.comment.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.comment.service.CommentService;
import com.ore.comment.serviceImpl.CommentServiceImpl;
import com.ore.comment.vo.CommentVO;

@SuppressWarnings("serial")
@WebServlet("/commentWriteAction")
public class CommentWriteAction extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommentService service = new CommentServiceImpl();
		CommentVO vo = new CommentVO();
		
		// 파리미터 값을 가져온다.
		int commentBoard = Integer.parseInt(req.getParameter("commentBoard"));
		String commentId = req.getParameter("commentId");
		String commentContent = req.getParameter("commentContent");
		
		vo.setCommentNum(service.getSeq()); // 댓글번호는 시퀀스값
		vo.setCommentBoard(commentBoard);
		vo.setCommentId(commentId);
		vo.setCommentContent(commentContent);

		service = new CommentServiceImpl();
		boolean result = service.insertComment(vo);

		if (result) {
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.println("1");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
