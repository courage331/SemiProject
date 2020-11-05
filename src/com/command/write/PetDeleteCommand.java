package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;

public class PetDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		PetDAO dao = new PetDAO();
		
		int pet_num = Integer.parseInt(request.getParameter("pet_num"));
		
		try {
			cnt = dao.deleteByPetNum(pet_num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}
