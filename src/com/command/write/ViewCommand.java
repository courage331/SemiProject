package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CmtDAO;
import com.lec.beans.CmtDTO;
import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.ReviewDAO;
import com.lec.beans.ReviewDTO;

// 1028 23:14 이호인
public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO[] arr = null;

		CmtDAO dao2 = new CmtDAO();
		CmtDTO[] arr2 = null;

		CustomerDAO dao3 = new CustomerDAO();
		CustomerDTO[] arr3 = null;

		HttpSession session = request.getSession();
//		
//		System.out.println(cus_num);

		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("numL = " + num);
 
		if (session.getAttribute("c_num") != null) {
			try {
				int cus_num = Integer.parseInt((String) (session.getAttribute("c_num")));
				arr = dao.readByNum(num); // 읽기
				request.setAttribute("list", arr);
				arr2 = dao2.selectByNum(num); // 읽기
				request.setAttribute("r_cmt", arr2);
				arr3 = dao3.selectByUid(cus_num);
				request.setAttribute("c_list", arr3);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {

			try {
				arr = dao.readByNum(num); // 읽기
				request.setAttribute("list", arr);
				arr2 = dao2.selectByNum(num); // 읽기
				request.setAttribute("r_cmt", arr2);
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
