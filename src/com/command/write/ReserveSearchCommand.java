package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;

public class ReserveSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		PetDAO pdao = new PetDAO();
		//세션을 여기서 체크하기...
		
		
		PetDTO [] pdto =null;
		//System.out.println("cus_num++"+request.getParameter("c_num"));
		int cus_num = Integer.parseInt(request.getParameter("c_num"));
		
		try {
			pdto = pdao.FindByOwner(cus_num);
			request.setAttribute("list", pdto);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
