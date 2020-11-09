package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ProductDAO;
import com.lec.beans.ProductDTO;

public class ShopUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO dao = new ProductDAO();
		ProductDTO [] arr = null;
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		
		try {
			arr = dao.readBypNum(pNum);  // 읽기 
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}


	

}
