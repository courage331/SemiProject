package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ProductDAO;


public class ShopWriteCommand implements Command {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		ProductDAO dao = new ProductDAO();
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		String pKind = request.getParameter("pKind");
		int price = Integer.parseInt(request.getParameter("price"));
		int pCnt = Integer.parseInt(request.getParameter("pCnt"));
		String pName = request.getParameter("pName");
		
			
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(pKind.trim().length() != 0 && price != 0 && pCnt != 0 && pName.trim().length() > 0 ) {
			try {
				System.out.println("pro_num: ---" + pNum);
				cnt = dao.insert(pNum, pKind, price, pCnt, pName);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		
	}
}
