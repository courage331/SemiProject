package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;

public class GoogleInsertCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cnt =0;
		CustomerDAO dao = new CustomerDAO();
		String c_id = request.getParameter("c_id");
		String c_pw = request.getParameter("c_pw");
		String c_name = request.getParameter("c_name");
		String c_phone = request.getParameter("c_phone");
		String c_email = request.getParameter("c_email");
		
		try {
			cnt = dao.c_insert(c_pw, c_name, c_phone, c_email, c_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}
