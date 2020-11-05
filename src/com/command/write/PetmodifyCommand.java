package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;
import com.lec.beans.ReservationDAO;

public class PetmodifyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		PetDAO dao = new PetDAO();
		
		int pet_num = Integer.parseInt(request.getParameter("pet_num"));
		String pet_name = request.getParameter("pet_name");
		int pet_age = Integer.parseInt(request.getParameter("pet_age"));
		int pet_weight = Integer.parseInt(request.getParameter("pet_weight"));
		int pet_image = Integer.parseInt(request.getParameter("pet_image"));
		System.out.println(pet_num+","+pet_name+","+pet_age+","+pet_weight+","+pet_image);
				
			try {
				cnt = dao.modify(pet_num, pet_name, pet_age, pet_weight, pet_image);
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
		request.setAttribute("result", cnt);
	}

}
