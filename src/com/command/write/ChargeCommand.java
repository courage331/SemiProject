package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;

public class ChargeCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO[] arr = null;

		HttpSession session = request.getSession();
		int cus_num = Integer.parseInt((String) (session.getAttribute("c_num")));
		
		try {
			arr = dao.selectByUid(cus_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("list", arr);
	}

}
