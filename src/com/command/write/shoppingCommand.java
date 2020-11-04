package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.ProductDAO;

public class shoppingCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ProductDAO dao = new ProductDAO();
		HttpSession session = request.getSession(); 

		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		
		String pName = request.getParameter("pName");
		
		try {
			cnt = dao.deleteCnt(pName);
			System.out.println("pName: ---" + pName);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}
