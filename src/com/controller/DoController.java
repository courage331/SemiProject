package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;


@WebServlet("*.do")
public class DoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() 호출");

		request.setCharacterEncoding("utf-8"); // 한글 인코딩

		// URL로부터 URI, ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		// 컨트롤러는 아래 두가지를 결정해야 한다.
		Command command = null; // 1. 어떠한 로직을 수행할지 결정
		String viewPage = null; // 2. 어떠한 페이지를(뷰) 보여줄지 결정

		//예시니깐 보구 하세요

//			switch(com) {  // Java7 부터 switch 에 String 가능
//			case "/list.do":
//				command = new ListCommand();  // 1. 커맨드(로직) 결정
//				command.execute(request, response); // 커맨드 실행
//				viewPage = "list.jsp";   // 2. 페이지(뷰) 결정
//				break;
//			} // end switch



		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);

			dispatcher.forward(request, response);
		}

	}// end actionDo()

}// end Controller
