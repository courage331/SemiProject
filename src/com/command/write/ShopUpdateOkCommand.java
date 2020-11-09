package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ProductDAO;

public class ShopUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ProductDAO dao = new ProductDAO();
		
		int pNum = Integer.parseInt(request.getParameter("pNum"));
		String pKind = request.getParameter("pKind");
		int price = Integer.parseInt(request.getParameter("price"));
		int pCnt = Integer.parseInt(request.getParameter("pCnt"));
		String pName = request.getParameter("pName");
		
		//입력한 값을 받아오기
//		int pNum = -1;
//		String pkind = null;
//		int price = -1;
//		int pCnt = -1;
//		String pName =null;
		
//		if(request.getParameter("pNum")!= null) {
//			pNum = Integer.parseInt(request.getParameter("pNum"));
//		System.out.println(pNum+"업데이트ok pNum");
//		}
//
//		if(request.getParameter("pKind") !=null) {
//			pKind = request.getParameter("pKind");
//			System.out.println(pName+"업데이트ok pKind");
//		}
//		
//		if(request.getParameter("price") != null) {
//			price = Integer.parseInt(request.getParameter("price"));
//			System.out.println(price+"업데이트ok price");
//		}
//		
//		if(request.getParameter("pCnt") != null) {
//			pCnt = Integer.parseInt(request.getParameter("pCnt"));
//			System.out.println(pCnt+"업데이트ok pCnt");
//		}
//		
//		if(request.getParameter("pName") !=null) {
//			pName = request.getParameter("pName");
//			System.out.println(pName+"업데이트ok pName");
//		}
		
//		if(pNum != -1  && kind != null && price != -1 && pCnt != -1 && pName != null) {
			try {
				cnt = dao.update(pNum, pKind, price, pCnt, pName);
				System.out.println(cnt+"업데이트ok cnt");
			} catch(SQLException e) {
				e.printStackTrace();
			}
//		} 
		
		request.setAttribute("result", cnt);

	}

	

}
