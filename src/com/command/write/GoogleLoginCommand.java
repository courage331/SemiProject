package com.command.write;

import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;

public class GoogleLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		
		CustomerDTO[] arr = null;
		CustomerDAO dao = new CustomerDAO();

		String c_id = request.getParameter("c_id");
		String c_pw = request.getParameter("c_pw");
		String c_name = request.getParameter("c_name");
		String c_phone = request.getParameter("c_phone");
		String c_email = request.getParameter("c_email");
		
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
				if(c_id != null && c_id.trim().length() > 0 && c_pw != null && c_pw.trim().length() > 0) {
					try {
						arr = dao.find_accountinfo(c_id, c_pw);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				
					request.setAttribute("list", arr);  //세션에 result-cnt 쌍으로 속성 설정
				
	}

}
