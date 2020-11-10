package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CmtDAO;
import com.lec.beans.CmtDTO;
//1028 이호인 15:49
public class CmtSelectCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CmtDAO dao = new CmtDAO();
		CmtDTO [] arr = null;

		System.out.println("못받아옴");
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("miD:  " + num);
		try {
			arr = dao.selectByNum(num); // 읽기
			request.setAttribute("r_cmt", arr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
