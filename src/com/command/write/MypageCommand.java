package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;
import com.lec.beans.ReservationDAO;
import com.lec.beans.ReservationDTO;

public class MypageCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CustomerDAO dao = new CustomerDAO();
		CustomerDTO [] arr = null;
		
		ReservationDAO rdao = new ReservationDAO();
		ReservationDTO [] rarr= null;
		
		PetDAO pdao = new PetDAO();
		PetDTO [] parr= null;
		
		HttpSession session = request.getSession();
		
		
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		System.out.println(cus_num);
		
		try {
			arr = dao.selectByUid(cus_num);
			request.setAttribute("list", arr);
			
			rarr=rdao.selectByNum(cus_num);
			request.setAttribute("rlist", rarr);
			
			parr=pdao.PetNameList();
			request.setAttribute("plist", parr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
