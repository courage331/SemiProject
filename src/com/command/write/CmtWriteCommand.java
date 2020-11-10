package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.lec.beans.CmtDAO;
import com.lec.beans.ReviewDAO;
// 1028 4:19 이호인 
public class CmtWriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		CmtDAO dao = new CmtDAO();
		
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		System.out.println("id:" + id);
		System.out.println("content: " + content);
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		System.out.println("r_num : " + r_num);
		HttpSession session = request.getSession();
		int c_num = Integer.parseInt((String)session.getAttribute("c_num"));
		System.out.println("c_num : " + c_num);
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(id != null && content != null && r_num != 0 && c_num != 0) {
			try {
				System.out.println("cus_num: ---" + r_num);
				cnt = dao.insert(id, content, r_num, c_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("cmt", cnt);
		
	}

}
