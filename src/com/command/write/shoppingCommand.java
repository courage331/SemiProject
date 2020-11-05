package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.ProductDAO;

public class shoppingCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int dcnt = 0;
		//ProductDAO dao = new ProductDAO();
		HttpSession session = request.getSession(); 
		CustomerDAO cdao = new CustomerDAO();
		CustomerDTO [] cdto = null;
		//System.out.println((String)(session.getAttribute("c_num")));
		//System.out.println(request.getParameter("price"));
		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		//int cus_money = Integer.parseInt(request.getParameter("price"));
		
		//String pName = request.getParameter("pName");
		//System.out.println("!!!!!!!!!!!!"+cus_num);
		
		
		try {
			//dcnt = cdao.delMoney(cus_num,cus_money);
			//cnt = dao.deleteCnt(pName);
			cdto = cdao.selectMoney(cus_num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		//request.setAttribute("result", cnt);
		//request.setAttribute("list", dcnt);
		request.setAttribute("ulist", cdto);
	}

}
