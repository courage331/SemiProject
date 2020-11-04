package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;
import com.lec.beans.ReviewDAO;
import com.lec.beans.ReviewDTO;

public class PetCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PetDAO dao = new PetDAO(); // DAO
		int cnt = 0;
		HttpSession session = request.getSession(); 

		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		String p_name = request.getParameter("p_name");
		int p_age = Integer.parseInt(request.getParameter("p_age"));
		int p_weight = Integer.parseInt(request.getParameter("p_weight"));

			try {
				cnt = dao.insert(cus_num, p_name, p_age, p_weight);
				System.out.println("짠");
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		request.setAttribute("result", cnt);
	}

}
