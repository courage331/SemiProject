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

		HttpSession session = request.getSession();
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		int cus_money = Integer.parseInt(request.getParameter("bone_rs"));
		
		try {
			cnt = dao.update(cus_num, cus_money);
			System.out.println("짠");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	request.setAttribute("result", cnt);
	}

}
