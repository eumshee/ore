package com.ore.qna.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.comment.service.CommentService;
import com.ore.comment.serviceImpl.CommentServiceImpl;
import com.ore.comment.vo.CommentVO;
import com.ore.common.DbCommand;
import com.ore.qna.service.QnaService;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class QnaSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String id = request.getParameter("id");		
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String img = request.getParameter("img");
		
		QnaVO vo = new QnaVO();
		vo.setWriter(writer);
		vo.setItemName(name);
		vo.setItemImg(img);
		vo.setId(Integer.parseInt(id));
		
		// 게시글
		QnaService service = new QnaServiceImpl();
		QnaVO rvo = service.qnaSelect(vo);
		request.setAttribute("qna", rvo);

		// 댓글
		CommentService service2 = new CommentServiceImpl();
		ArrayList<CommentVO> list = service2.commentList(Integer.parseInt(id));
		request.setAttribute("commentList", list);
		
		// 상품명
		QnaServiceImpl service3 = new QnaServiceImpl();
		QnaVO rvo2 = service3.itemCodeName(code);
		request.setAttribute("item", rvo2);
		
		return "qna/qna.tiles";
	}

}
