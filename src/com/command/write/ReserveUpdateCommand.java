package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReservationDAO;
import com.lec.beans.ReservationDTO;

public class ReserveUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO [] arr =null;
		int num = Integer.parseInt(request.getParameter("num"));
		
		try {
			arr = dao.selectByResNum(num);
			request.setAttribute("rlist", arr);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
