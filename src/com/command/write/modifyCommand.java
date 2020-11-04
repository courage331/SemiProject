package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReservationDAO;

public class modifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReservationDAO dao = new ReservationDAO();
		

		
		//입력한 값을 받아오기
		String res_startdate = request.getParameter("res_startdate");
		String res_lastdate = request.getParameter("res_lastdate");
		String res_message = request.getParameter("res_message");
		String res_sinfo = request.getParameter("res_sinfo");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
			try {
				cnt = dao.update(num, res_startdate, res_lastdate, res_message, res_sinfo);
				
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		request.setAttribute("result", cnt);
	}

}
