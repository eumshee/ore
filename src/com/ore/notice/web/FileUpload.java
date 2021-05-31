package com.ore.notice.web;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/fileUpload")
@SuppressWarnings("serial")
public class FileUpload extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		
		String path = "c:/tmp";
		ServletContext sc = this.getServletContext();
		path = sc.getRealPath("upload"); // 서버상 경로지정; WebContent>upload
		
		MultipartRequest multi = new MultipartRequest(req, // 요청정보
				path,		// 저장위치
				8*1024*1024,// 파일용량
				"UTF-8",	// 인코딩
				new DefaultFileRenamePolicy()); // cos.jar
		
		// 여러 개의 파일 처리
		Enumeration en = multi.getFileNames();
		String fileN = null;		
		while(en.hasMoreElements()) {
			String name = (String) en.nextElement(); // 업로드 파일
			String fileName = multi.getFilesystemName(name);
			fileN = fileName;
		}
		JsonObject json = new JsonObject();
		json.addProperty("uploaded", 1);
		json.addProperty("fileName", fileN);
		json.addProperty("url", req.getContextPath()+"/upload/"+fileN);
		
		// ckeditor로 넘기는 값
		resp.getWriter().print(json);
	}
}
