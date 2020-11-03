//package com.command.write;
//
//import java.sql.SQLException;
//import java.util.Arrays;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.lec.beans.CustomerDAO;
//import com.lec.beans.CustomerDTO;
//
//
//
//public class MyinfoCommand implements Command {
//
//	@Override
//	public void execute(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		CustomerDAO dao = new CustomerDAO();
//		CustomerDTO [] arr = null;
//		
//		int c_num = Integer.parseInt((String)(session.getAttribute("c_num")));
//		
//		try {
//			arr = dao.readByNum(c_num);  // 읽기 
//			System.out.println(Arrays.toString(arr));
//			request.setAttribute("data", arr);
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//		
//	}
//
//}
