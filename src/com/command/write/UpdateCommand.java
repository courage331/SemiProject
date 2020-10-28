package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReviewDAO;
// 1028 23:00 이호인
public class UpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ReviewDAO dao = new ReviewDAO();
		
		//입력한 값을 받아오기
		int num = Integer.parseInt(request.getParameter("num"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));
		// num으로 가져온 후 제목 내용 별점 등을 수정
		if(subject != null && subject.trim().length() > 0) {
			try {
				cnt = dao.update(num, subject, content, star);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} 
		
		request.setAttribute("result", cnt);

	}

}
