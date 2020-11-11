package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CmtDAO;
import com.lec.beans.CmtDTO;

public class CmtUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		CmtDAO dao = new CmtDAO();
		CmtDTO [] arr = null;
		
		int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));
		System.out.println("CMT_NUM: " + cmt_num);
		String content = request.getParameter("content");
		System.out.println("CONTENT: " + content);
		
			try {
				arr = dao.selectByNum(cmt_num);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		request.setAttribute("result", arr);
	}

}
