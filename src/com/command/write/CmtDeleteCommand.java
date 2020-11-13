package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CmtDAO;

public class CmtDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CmtDAO dao = new CmtDAO();
		
		int num = Integer.parseInt(request.getParameter("cmt_num"));
		
		int num2 = Integer.parseInt(request.getParameter("num"));
		
		try {
			cnt = dao.deleteByNum(num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("result2", num2);
	}

}
