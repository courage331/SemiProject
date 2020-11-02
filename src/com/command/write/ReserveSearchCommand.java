/*예약 하는중에 reservation.do*/

package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.PetDAO;
import com.lec.beans.PetDTO;
import com.lec.beans.ReservationDAO;
import com.lec.beans.ReservationDTO;

public class ReserveSearchCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		PetDAO pdao = new PetDAO();
		//세션을 여기서 체크하기...
		PetDTO [] pdto =null;
		int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
		//System.out.println("c_num 의 값은요? "+cus_num);

		ReservationDAO rdao = new ReservationDAO();
		ReservationDTO [] rdto = null;
		
		//접속중인 session의 c_num을 토대로 주인이 소유한 강아지 리스트를 보여준다.
		try {
			pdto = pdao.FindByOwner(cus_num);
			request.setAttribute("list", pdto);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		//예약 리스트...
		try {
			rdto = rdao.select();
			request.setAttribute("res_list", rdto);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
		
	}

}
