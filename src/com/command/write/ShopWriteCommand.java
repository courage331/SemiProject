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
		String pCtt = request.getParameter("pCtt");
		System.out.println("!!!!!!!!!!"+pKind+"," + pPrice + ", " + pCnt + "," + pName);
			
			try {
				cnt = dao.insert(pKind, pPrice, pCnt, pName,pCtt);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		request.setAttribute("result", cnt);
		
	}
}
