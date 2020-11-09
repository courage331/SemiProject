package com.command.write;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;

public class emailCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CustomerDAO dao = new CustomerDAO();
		int chk = 0;
		String c_email = request.getParameter("userEmail");
		
		
		try {
			// 존재하면 chk <- 1 / 이니면 0
			chk = dao.emailchk(c_email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// chk 값을 그대
		//plain/ text 타입  response
		try {
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().print(chk);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
