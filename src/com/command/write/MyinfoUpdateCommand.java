package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;


public class MyinfoUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CustomerDAO dao = new CustomerDAO();
		
		HttpSession session = request.getSession();
		//입력한 값을 받아오기
		int c_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		String cus_pw = request.getParameter("c_pw");
		String cus_name = request.getParameter("c_name");
		String cus_phone = request.getParameter("c_phone");
		String cus_email = request.getParameter("c_email");
		String cus_id = request.getParameter("c_id");
		// num으로 가져온 후 제목 내용 별점 등을 수정
		//if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.myinfo_update(c_num, cus_pw, cus_name, cus_phone, cus_email);	//TODO 1104
			} catch(SQLException e) {
				e.printStackTrace();
			}
		//} 
		
		request.setAttribute("result", cnt);

		
	}

}
