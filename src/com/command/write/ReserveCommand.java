/*예약이 완성되었을때  reserveOk.jsp에서 사용*/

package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.PetDAO;
import com.lec.beans.ReservationDAO;

public class ReserveCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0; //예약테이블에 삽입성공여부 판단할때
		int cnt2 = 0; //강아지 예약여부 바꿀때 사용
		ReservationDAO dao = new ReservationDAO();
		PetDAO pdao = new PetDAO();
		
		// 입력받는 곳
		String res_startdate = request.getParameter("res_startdate");
		String res_lastdate = request.getParameter("res_lastdate");
		String res_message = request.getParameter("res_message");
		String res_sinfo = request.getParameter("res_sinfo");
		int cus_num = Integer.parseInt(request.getParameter("cus_num"));
		
		
		//pet_name을 바탕으로 pet_num을 찾는다. 
		
		int pet_num=Integer.parseInt((request.getParameter("select_pet")));
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(true) {
			
			try {
				cnt = dao.insert(res_startdate, res_lastdate, res_message,res_sinfo,cus_num,pet_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// 예약 체크
		try {
			cnt2=pdao.update(pet_num);
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("result2", cnt2);

	}

}
