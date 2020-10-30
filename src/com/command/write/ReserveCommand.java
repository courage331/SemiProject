package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;
import com.lec.beans.ReservationDAO;

public class ReserveCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReservationDAO dao = new ReservationDAO();
		
		PetDAO pdao = new PetDAO();
		
		// 입력받는 곳
		String res_startdate = request.getParameter("res_startdate");
		String res_lastdate = request.getParameter("res_lastdate");
		String message = request.getParameter("message");
		String res_sinfo = request.getParameter("res_sinfo");
		int cus_num = Integer.parseInt(request.getParameter("cus_num"));
		
		
		//pet_name을 바탕으로 pet_num을 찾는다. 
		
		int pet_num=Integer.parseInt((request.getParameter("select_pet")));
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(true) {
			
			try {
				cnt = dao.insert(res_startdate, res_lastdate, message,res_sinfo,cus_num,pet_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
