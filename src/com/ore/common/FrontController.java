package com.ore.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.cart.web.AddCart;
import com.ore.cart.web.CartDelete;
import com.ore.cart.web.CartList;
import com.ore.cart.web.CartUpdate;
import com.ore.member.web.MemberDelete;
import com.ore.member.web.MemberJoin;
import com.ore.member.web.MemberJoinForm;
import com.ore.member.web.MemberLogin;
import com.ore.member.web.MemberLoginForm;
import com.ore.member.web.MemberLoginOut;
import com.ore.member.web.MemberSelect;
import com.ore.member.web.MemberUpdate;
import com.ore.notice.web.NoticeDelete;
import com.ore.notice.web.NoticeInsert;
import com.ore.notice.web.NoticeInsertForm;
import com.ore.notice.web.NoticeList;
import com.ore.notice.web.NoticeSearch;
import com.ore.notice.web.NoticeSelect;
import com.ore.notice.web.NoticeUpdate;
import com.ore.orders.web.OrdersInsert;
import com.ore.product.web.AdminDelete;
import com.ore.product.web.AdminInsertForm;
import com.ore.product.web.AdminList;
import com.ore.product.web.AdminSearch;
import com.ore.product.web.AdminSelect;
import com.ore.product.web.LookBook;
import com.ore.product.web.ProductListPaging;
import com.ore.product.web.ProductSelect;
import com.ore.qna.web.QnaDelete;
import com.ore.qna.web.QnaInsert;
import com.ore.qna.web.QnaInsertCodeForm;
import com.ore.qna.web.QnaInsertForm;
import com.ore.qna.web.QnaList;
import com.ore.qna.web.QnaSearch;
import com.ore.qna.web.QnaSelect;
import com.ore.qna.web.QnaUpdate;
import com.ore.review.web.ReviewDelete;
import com.ore.review.web.ReviewInsert;
import com.ore.review.web.ReviewInsertCodeForm;
import com.ore.review.web.ReviewInsertForm;
import com.ore.review.web.ReviewList;
import com.ore.review.web.ReviewSelect;
import com.ore.review.web.ReviewUpdate;

@SuppressWarnings("serial")
public class FrontController extends HttpServlet {
	private HashMap<String, DbCommand> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException { // ??????????????? - ???????????????
		// ??????
		map.put("/index.do", new IndexPage());
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/memberLoginOut.do", new MemberLoginOut());
		map.put("/memberSelect.do", new MemberSelect());
		map.put("/memberUpdate.do", new MemberUpdate());
		map.put("/memberDelete.do", new MemberDelete());
		
		// ??????
		map.put("/productList.do", new ProductListPaging());
		map.put("/productSelect.do", new ProductSelect());
		map.put("/lookbook.do", new LookBook());
		
		// ?????????
		map.put("/adminList.do", new AdminList());
		map.put("/adminSelect.do", new AdminSelect());
		map.put("/adminInsertForm.do", new AdminInsertForm());
		map.put("/adminDelete.do", new AdminDelete());
		map.put("/adminSearch.do", new AdminSearch());
		
		// ????????????
		map.put("/addCart.do", new AddCart());
		map.put("/cartList.do", new CartList());
		map.put("/cartUpdate.do", new CartUpdate());
		map.put("/cartDelete.do", new CartDelete());
		
		// ??????
		map.put("/ordersInsert.do", new OrdersInsert());
		
		// ??????
		map.put("/noticeList.do", new NoticeList());
		map.put("/noticeSelect.do", new NoticeSelect());
		map.put("/noticeSearch.do", new NoticeSearch());
		map.put("/noticeInsertForm.do", new NoticeInsertForm());
		map.put("/noticeInsert.do", new NoticeInsert());
		map.put("/noticeUpdate.do", new NoticeUpdate());
		map.put("/noticeDelete.do", new NoticeDelete());
		
		// qna
		map.put("/qnaList.do", new QnaList());
		map.put("/qnaSelect.do", new QnaSelect());
		map.put("/qnaSearch.do", new QnaSearch());
		map.put("/qnaInsertForm.do", new QnaInsertForm());
		map.put("/qnaInsertCodeForm.do", new QnaInsertCodeForm());
		map.put("/qnaInsert.do", new QnaInsert());
		map.put("/qnaUpdate.do", new QnaUpdate());
		map.put("/qnaDelete.do", new QnaDelete());
		
		// review
		map.put("/reviewList.do", new ReviewList());
		map.put("/reviewSelect.do", new ReviewSelect());
		map.put("/reviewInsertForm.do", new ReviewInsertForm());
		map.put("/reviewInsertCodeForm.do", new ReviewInsertCodeForm());
		map.put("/reviewInsert.do", new ReviewInsert());
		map.put("/reviewUpdate.do", new ReviewUpdate());
		map.put("/reviewDelete.do", new ReviewDelete());
		

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		// ????????? ?????? ??????
		String uri = req.getRequestURI();
		String cpath = req.getContextPath();
		String path = uri.substring(cpath.length());
		DbCommand command = map.get(path);
		String viewPage = command.execute(req, resp);

		// ????????? ?????????
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
