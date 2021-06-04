package com.ore.orders.web;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ore.common.DbCommand;
import com.ore.orders.service.OrdersService;
import com.ore.orders.serviceImpl.OrdersServiceImpl;
import com.ore.orders.vo.OrdersVO;

public class OrdersInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 중복하지 않게 ordernum 생성
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 
		 for(int i = 1; i <= 6; i ++) {
		  subNum += (int)(Math.random() * 10);
		 }
		 
		 String ordernum = ymd + "_" + subNum;	

		 // 파라미터 받아오기
		 HttpSession session = request.getSession();
		 String id = (String) session.getAttribute("id");
		 String name = request.getParameter("name");
		 String addr = request.getParameter("addr");
		 String tel = request.getParameter("tel");
		 String mail = request.getParameter("mail");
		 String msg = request.getParameter("msg");
		 String sum = request.getParameter("totalsum");
		 
		 SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		 Date date = new Date();
		 String dateS = format1.format(date);
		 
		 OrdersVO vo = new OrdersVO();
		 vo.setOrderNum(ordernum);
		 vo.setUserId(id);
		 vo.setOrderName(name);
		 vo.setOrderAddr(addr);
		 vo.setOrderTel(tel);
		 vo.setOrderMail(mail);
		 vo.setOrderMsg(msg);
		 vo.setOrderPrice(sum);
		 vo.setOrderDate(dateS);
		 
		 OrdersService service = new OrdersServiceImpl();
		 service.insertOrders(vo);
		 
		return "memberSelect.do";
	}

}
