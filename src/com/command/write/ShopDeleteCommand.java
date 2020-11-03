package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ProductDAO;

public class ShopDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ProductDAO dao = new ProductDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
//		try {
//			cnt = dao.deleteByNum(pNum); 쿼리문 작성해야함
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		
		request.setAttribute("result", cnt);
	}
}
