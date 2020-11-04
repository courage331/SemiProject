package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;


public class AccountDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CustomerDAO dao = new CustomerDAO();
		HttpSession session = request.getSession();
		
		int c_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		
		try {
			cnt = dao.deleteByNum(c_num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		
	}

}
