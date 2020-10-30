package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO [] arr = null;
		
		int cus_num = Integer.parseInt(request.getParameter("c_num"));
		
		try {
			arr = dao.selectByUid(17);
			
			request.setAttribute("list", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
