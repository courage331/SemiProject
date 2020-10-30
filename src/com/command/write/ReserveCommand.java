package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReservationDAO;

public class ReserveCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReservationDAO dao = new ReservationDAO();
		
		// 입력받는 곳
		String res_startdate = request.getParameter("res_startdate");
		String res_lastdate = request.getParameter("res_lastdate");
		String message = request.getParameter("message");
		int cus_num = Integer.parseInt(request.getParameter("cus_num"));
		int pet_num = Integer.parseInt(request.getParameter("pet_num"));
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(true) {
			
			try {

				cnt = dao.insert(res_startdate, res_lastdate, message,cus_num,pet_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
