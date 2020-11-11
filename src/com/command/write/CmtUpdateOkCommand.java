package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.CmtDAO;
// 1028 23:00 이호인
public class CmtUpdateOkCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		CmtDAO dao = new CmtDAO();
		
		//입력한 값을 받아오기
		int cmt_num = Integer.parseInt(request.getParameter("cmt_num"));
		System.out.println("CMT_NUM@: " + cmt_num);
		String content = request.getParameter("content");
		System.out.println("contetnt@: " + content);
		// num으로 가져온 후 제목 내용 별점 등을 수정
		
		if(content != null) {
			try {
				cnt = dao.cmtupdate(cmt_num, content);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

	}

}
