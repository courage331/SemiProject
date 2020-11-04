package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;

public class FindpwCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		CustomerDTO[] arr = null;
		CustomerDAO dao = new CustomerDAO();

		String c_id = request.getParameter("c_id");
		String c_name = request.getParameter("c_name");
		String c_email = request.getParameter("c_email");

		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
				if(c_name != null && c_name.trim().length() > 0 && c_email != null && c_email.trim().length() > 0) {
					try {
						System.out.println("c_id: ---" + c_id);
						System.out.println("c_name: ---" + c_name);
						System.out.println("c_email: ---" + c_email);
						arr = dao.find_pw(c_name, c_email, c_id);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
		request.setAttribute("list", arr);  //세션에 result-cnt 쌍으로 속성 설정
		
	}

}
