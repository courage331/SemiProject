package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO [] arr = null;
		HttpSession session = request.getSession(); 
		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		System.out.println(cus_num);
		
		try {
			arr = dao.selectByUid(cus_num);
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
