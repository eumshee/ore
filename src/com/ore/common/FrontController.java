package com.ore.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.member.web.MemberJoin;
import com.ore.member.web.MemberJoinForm;
import com.ore.member.web.MemberLogin;
import com.ore.member.web.MemberLoginForm;
import com.ore.member.web.MemberLoginOut;
import com.ore.product.web.LookBook;
import com.ore.product.web.ProductAccList;
import com.ore.product.web.ProductBottomList;
import com.ore.product.web.ProductListPaging;
import com.ore.product.web.ProductOuterList;
import com.ore.product.web.ProductSelect;
import com.ore.product.web.ProductTopList;

@SuppressWarnings("serial")
public class FrontController extends HttpServlet {
	private HashMap<String, DbCommand> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException { // 요청페이지 - 실행컨트롤
		// 회원
		map.put("/index.do", new IndexPage());
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/memberLoginOut.do", new MemberLoginOut());
		
		// 상품
		map.put("/productList.do", new ProductListPaging());
		map.put("/productOuterList.do", new ProductOuterList());
		map.put("/productTopList.do", new ProductTopList());
		map.put("/productBottomList.do", new ProductBottomList());
		map.put("/productAccList.do", new ProductAccList());
		map.put("/productSelect.do", new ProductSelect());
		map.put("/lookbook.do", new LookBook());
		
		// 공지
//		map.put("/noticeList.do", new NoticeList());
//		map.put("/noticeListPaging.do", new NoticeListPaging());
//		map.put("/noticeSelect.do", new NoticeSelect());
//		map.put("/noticeUpdate.do", new NoticeUpdate());
//		map.put("/noticeInsertForm.do", new NoticeInsertForm());
//		map.put("/noticeInsert.do", new NoticeInsert());
//		map.put("/noticeDelete.do", new NoticeDelete());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// 페이지 정보 읽기
		String uri = req.getRequestURI();
		String cpath = req.getContextPath();
		String path = uri.substring(cpath.length());
		DbCommand command = map.get(path);
		String viewPage = command.execute(req, resp);

		// 보여줄 페이지
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
