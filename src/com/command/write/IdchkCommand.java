package com.command.write;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CustomerDAO;

public class IdchkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CustomerDAO dao = new CustomerDAO();
		int chk = 0;
		String c_id = request.getParameter("userId");
		
		
		try {
			// c_id 아이디를 가진 사용자 존재 여부 혹인
			// 존재하면 chk <- 1 / 이니면 0
			chk = dao.idchk(c_id);
			//request.setAttribute("chk", chk);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// chk 값을 그대
		//plain/ text 타입  response
		try {
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().print(chk);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
