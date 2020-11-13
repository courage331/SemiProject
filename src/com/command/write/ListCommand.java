package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReviewDAO;
import com.lec.beans.ReviewDTO;

// 1028 이호인 15:49
public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewDAO dao = new ReviewDAO(); // DAO
		ReviewDTO[] arr = null;

//		System.out.println("하이요");
		System.out.println("request: " + request.getParameter("target"));
		System.out.println("request: " + request.getParameter("keyword"));
		String target = request.getParameter("target");
		String keyword = request.getParameter("keyword");
		
		if(target == null) {
			target = "";
		}
		if(keyword == null) {
			keyword = "";
		}
		
		
		if (target.equals("content")) {
			System.out.println("CONTENT임");
			try {
				arr = dao.searchByContent(keyword);

				request.setAttribute("list", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else if (target.equals("subject")) {
			System.out.println("SUBJECT임");
			
			try {
				arr = dao.searchBySubject(keyword);

				request.setAttribute("list", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("기본임");
			try {
				arr = dao.select();

				request.setAttribute("list", arr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
//		try {
//			arr = dao.select();
//			request.setAttribute("list", arr);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}

	}
}
