package com.ore.comment.web;

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
@WebServlet("/deleteComment")
public class DeleteComment extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommentService service = new CommentServiceImpl();
		
		int commentNum = Integer.parseInt(req.getParameter("commentNum"));
		int commentBoard = Integer.parseInt(req.getParameter("boardNum"));

		service = new CommentServiceImpl();
		boolean result = service.deleteComment(commentNum, commentBoard);

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
