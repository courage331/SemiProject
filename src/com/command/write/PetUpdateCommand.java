package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;


public class PetUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		PetDAO dao = new PetDAO();
		PetDTO [] arr =null;
		
		HttpSession session = request.getSession();
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		
		try {
			arr = dao.selectByUid(cus_num);
			request.setAttribute("list", arr);
		}catch(SQLException e) {
			e.printStackTrace();
		}

	}

}
