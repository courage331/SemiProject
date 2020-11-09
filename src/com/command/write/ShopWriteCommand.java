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
		
		System.out.println(request.getParameter("content"));
		String pKind = request.getParameter("pKind");
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		int pCnt = Integer.parseInt(request.getParameter("pCnt"));
		String pName = request.getParameter("pName");
		System.out.println("!!!!!!!!!!"+pKind+"," + pPrice + ", " + pCnt + "," + pName);
			
		// 유효성 체크 : null 이거나, 빈 문자열이면 
			try {
				cnt = dao.insert(pKind, pPrice, pCnt, pName);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		request.setAttribute("result", cnt);
		
	}
}
