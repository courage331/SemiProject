package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;
import com.lec.beans.ReservationDAO;
import com.lec.beans.ReviewDAO;

public class ReserveDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int cnt2 = 0; //강아지 예약여부 바꿀때 사용
		ReservationDAO dao = new ReservationDAO();
		PetDAO pdao = new PetDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pet_num = Integer.parseInt(request.getParameter("pet_num"));
		
		try {
			cnt = dao.deleteByNum(num);
			cnt2= pdao.update2(pet_num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		
		
		request.setAttribute("result", cnt);
	}

}
