package com.ore.product.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.product.serviceImpl.ProductServiceImpl;

@WebServlet("/ajaxCodeCheck")
public class ajaxCodeCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cd = req.getParameter("code");

		ProductServiceImpl service = new ProductServiceImpl();
		int cnt = 0;
		if (service.cdCheck(cd)) {
			cnt = 1; // 존재하지 않으면 0, 존재하면 1이 리턴되게
		}
		resp.getWriter().print(cnt);

	}

}
