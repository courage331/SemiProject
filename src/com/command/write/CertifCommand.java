package com.command.write;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CertifCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		int chk = 0;
		
		String certif = request.getParameter("certifNum");
		String session_certif = (String)session.getAttribute("certif");
		
		System.out.println(certif + "//" + session_certif);
		
		if(certif.equals(session_certif)) {
			chk = 1;
		}else {
			chk = 0;
		}
		
		try {
			response.setContentType("text/plain; charset=utf-8");
			response.getWriter().print(chk);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
