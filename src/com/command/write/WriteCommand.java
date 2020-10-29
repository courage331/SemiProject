package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReviewDAO;
// 1028 4:19 이호인 
public class WriteCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		
		// 입력받는 곳
		// 여기가 write문이니까 나중에 cus_num 받아넣을곳도 알아보자
		int star = Integer.parseInt(request.getParameter("star"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int cus_num = Integer.parseInt(request.getParameter("c_num"));
		
		// 유효성 체크 : null 이거나, 빈 문자열이면 
		if(star != 0 && subject != null && subject.trim().length() > 0 && star > 0) {
			try {
				System.out.println("cus_num: ---" + cus_num);
				cnt = dao.insert(subject, content, star, cus_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
		
	}

}
