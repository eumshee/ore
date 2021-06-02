package com.ore.product.web;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.product.serviceImpl.ProductServiceImpl;
import com.ore.product.vo.ProductVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setCharacterEncoding("UTF-8");
		
		ServletContext sc = this.getServletContext();
		String path = sc.getRealPath("bootstrap/img/product");
		
		MultipartRequest multi = new MultipartRequest(req, path, 8 * 1024 * 1024, "UTF-8",
				new DefaultFileRenamePolicy());

		Enumeration en = multi.getFileNames();
		String code = multi.getParameter("code");
		String name = multi.getParameter("name");
		String price = multi.getParameter("price");
		String stock = multi.getParameter("stock");
		String date = multi.getParameter("date");
		String desc = multi.getParameter("desc");
		String img = multi.getParameter("img");
		String fileN = multi.getParameter("fileN");
		String newfile = multi.getParameter("newfile");
		
		String file = null;
		System.out.println("기존파일 : " + fileN);
		System.out.println("새 파일 : " + newfile);
		
		while (en.hasMoreElements()) {
			String name2 = (String) en.nextElement();
			String fileName = multi.getFilesystemName(name2);
			file = fileName;
		}
		
		ProductVO vo = new ProductVO();
		vo.setItemCode(code);
		vo.setItemName(name);
		vo.setItemPrice(Integer.parseInt(price));
		vo.setItemStock(Integer.parseInt(stock));
		vo.setItemDate(date);
		vo.setItemDesc(desc);
		if (!newfile.isEmpty()) {
			vo.setItemImg(newfile);
		}
		else { 
			vo.setItemImg(fileN);
		}
		
		ProductServiceImpl service = new ProductServiceImpl();
		service.updateProduct(vo);
	}
}
