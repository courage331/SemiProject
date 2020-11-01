//로그인 테스트용이니깐 신경 안써도 됨 -지민

package com.command.write;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")==null) {
			//로그인이 안됨
		}else {
			//로그인 됨
			request.setAttribute("loginchk",true);
		}
		
	}

}
