package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;
import com.lec.beans.ReservationDAO;
import com.lec.beans.ReservationDTO;

public class ReserveModifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReservationDAO dao = new ReservationDAO();
		ReservationDTO [] arr =null;
		
		PetDAO pdao = new PetDAO();
		PetDTO [] parr = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pet_num = Integer.parseInt(request.getParameter("pet_num"));
		
		try {
			arr = dao.selectByResNum(num);
			parr = pdao.selectByPetNum(pet_num);
			request.setAttribute("rlist", arr);
			request.setAttribute("plist", parr);
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
