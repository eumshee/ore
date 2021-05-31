package com.ore.notice.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;
import com.ore.notice.service.NoticeService;
import com.ore.notice.serviceImpl.NoticeServiceImpl;
import com.ore.notice.vo.NoticeVO;

public class NoticeSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");		

		NoticeVO vo = new NoticeVO();
		vo.setId(Integer.parseInt(id));
		
		NoticeService service = new NoticeServiceImpl();
		NoticeVO rvo = service.noticeSelect(vo);
		
		request.setAttribute("notice", rvo);
		
		return "notice/notice.tiles";
	}

}
