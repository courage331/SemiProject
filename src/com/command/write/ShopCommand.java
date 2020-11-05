package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.ProductDAO;
import com.lec.beans.ProductDTO;

public class ShopCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ProductDAO dao = new ProductDAO(); // DAO
		HttpSession session = request.getSession(); 
		CustomerDAO cdao = new CustomerDAO();
		CustomerDTO [] cdto = null;

		//int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		
		ProductDTO [] arr = null;
		
		try {
			arr = dao.select();
//			cdto = cdao.selectByUid(cus_num);
			
			request.setAttribute("list", arr);
//			request.setAttribute("clist", cdto);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
