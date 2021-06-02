package com.ore.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;
import com.ore.qna.serviceImpl.QnaServiceImpl;
import com.ore.qna.vo.QnaVO;

public class ProductSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(code);
		
		ProductServiceImpl service = new ProductServiceImpl();
		service.selectProduct(vo);
		
		request.setAttribute("product", vo);
		
		QnaServiceImpl service2 = new QnaServiceImpl();
		List<QnaVO> list = service2.qnaCodeList(code);
		
		request.setAttribute("qnaList", list);
		
		return "product/productSelect.tiles";
	}

}
