package com.command.write;
//구매하기 완료시 뼈다귀 차감 금액 차감
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.ProductDAO;

public class buyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int dcnt = 0;
		ProductDAO dao = new ProductDAO();
		HttpSession session = request.getSession(); 
		CustomerDAO cdao = new CustomerDAO();
		System.out.println("씨넘!!!!!!!!!!!!!"+(String)(session.getAttribute("c_num")));
		System.out.println("가격!!!!!!!!!!!!!!!!!"+request.getParameter("price"));
		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		int cus_money = Integer.parseInt(request.getParameter("price"));
		System.out.println(cus_money);
		
		String pName = request.getParameter("pName");
		System.out.println("!!!!!!!!!!!!"+cus_num);
		
		
		
		try {
			dcnt = cdao.delMoney(cus_num,cus_money);
			cnt = dao.deleteCnt(pName);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("list", dcnt);
	}

}