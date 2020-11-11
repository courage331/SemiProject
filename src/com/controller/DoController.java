package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.AccountDeleteCommand;
import com.command.write.ChargeCommand;
import com.command.write.CmtDeleteCommand;
import com.command.write.CmtUpdateCommand;
import com.command.write.CmtUpdateOkCommand;
import com.command.write.CmtWriteCommand;
import com.command.write.Command;
import com.command.write.DeleteCommand;
import com.command.write.FileUploadCommand;
import com.command.write.FindidCommand;
import com.command.write.FindpwCommand;
import com.command.write.ListCommand;
import com.command.write.LoginCommand;
import com.command.write.MyinfoUpdateCommand;
import com.command.write.MypageCommand;
import com.command.write.PetCommand;
import com.command.write.PetDeleteCommand;
import com.command.write.PetListCommand;
import com.command.write.PetUpdateCommand;
import com.command.write.PetmodifyCommand;
import com.command.write.ReserveCommand;
import com.command.write.ReserveDeleteCommand;
import com.command.write.ReserveModifyCommand;
import com.command.write.ReserveSearchCommand;
import com.command.write.ReserveUpdateCommand;
import com.command.write.SelectCommand;
import com.command.write.ShopCommand;
import com.command.write.ShopDeleteCommand;
import com.command.write.ShopFileUploadCommand;
import com.command.write.ShopUpdateCommand;
import com.command.write.ShopUpdateOkCommand;
import com.command.write.ShopWriteCommand;
import com.command.write.SignupCommand;
import com.command.write.UpdateCommand;
import com.command.write.ViewCommand;
import com.command.write.WriteCommand;
import com.command.write.buyCommand;
import com.command.write.modifyCommand;
import com.command.write.shoppingCommand;

@WebServlet("*.do")
public class DoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
		System.out.println("doGet() 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
		System.out.println("doPost() 호출");

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

		// 예시니깐 보구 하세요 -E : 옙

//			switch(com) {  // Java7 부터 switch 에 String 가능
//			case "/list.do":
//				command = new ListCommand();  // 1. 커맨드(로직) 결정
//				command.execute(request, response); // 커맨드 실행
//				viewPage = "list.jsp";   // 2. 페이지(뷰) 결정
//				break;
//			} // end switch

		// 1028 23:25 이호인 추가
		switch (com) { // Java7 부터 switch 에 String 가능
		case "/review.do":
			command = new ListCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "review.jsp"; // 2. 페이지(뷰) 결정
			break;

		case "/write.do":
			viewPage = "write.jsp";
			break;

		case "/writeOk.do":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "writeOk.jsp";
			break;
			
		case "/cmtOk.do":
			command = new CmtWriteCommand();
			command.execute(request, response);
			viewPage = "cmtOk.jsp";
			break;
		
			// 호인 : update하기
		case "/cmtupdate.do":
			command = new CmtUpdateCommand();
			command.execute(request, response);
			viewPage = "cmtupdate.jsp";
			break;
			
		case "/cmtupdateOk.do":
			command = new CmtUpdateOkCommand();
			command.execute(request, response);
			viewPage = "cmtupdateOk.jsp";
			break;

		case "/view.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "view.jsp";
			break;

		case "/update.do":
			command = new SelectCommand();
			command.execute(request, response);
			viewPage = "update.jsp";
			break;

		case "/updateOk.do":
			command = new UpdateCommand();
			command.execute(request, response);
			viewPage = "updateOk.jsp";
			break;

		case "/deleteOk.do":
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
			break;
			
		case "/fileUpload.do":
			command = new FileUploadCommand();
			command.execute(request, response);
			break;

		// 지민 1029 예약하기
		case "/reservation.do":
			// 이쪽에서 로그인 여부 체크하기...
//			HttpSession session = request.getSession(); 
//			command = new LoginCheckCommand();
//			command.execute(request, response);
//			if(request.getAttribute("loginchk")==null) {
//				//로그인 안함
//			}else {
//			}
			command = new ReserveSearchCommand();
			command.execute(request, response);
			viewPage = "reservation.jsp"; // 2. 페이지(뷰) 결정
			break;

		case "/reserveOk.do":
			command = new ReserveCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "reserveOk.jsp"; // 2. 페이지(뷰) 결정
			break;

		case "/reserve_deleteOk.do":
			command = new ReserveDeleteCommand();
			command.execute(request, response);
			viewPage = "reserve_deleteOk.jsp";
			break;

		case "/reserve_update.do":
			command = new ReserveUpdateCommand();
			command.execute(request, response);
			viewPage = "reserve_update.jsp";
			break;

		case "/reserve_modify.do":
			command = new ReserveModifyCommand();
			command.execute(request, response);
			viewPage = "reserve_modify.jsp";
			break;

		case "/modifyOk.do":
			command = new modifyCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "reserveOk.jsp"; // 2. 페이지(뷰) 결정
			break;

		// 정호 1030 뼈다귀
		case "/mypage.do":
			command = new MypageCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "mypage.jsp"; // 2. 페이지(뷰) 결정
			break;
		// 정호 1103 펫

		case "/pet.do":
			command = new PetListCommand();
			command.execute(request, response);
			viewPage = "pet.jsp";
			break;

		case "/petOk.do":
			command = new PetCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "petOk.jsp"; // 2. 페이지(뷰) 결정
			break;
		case "/pet_update.do":
			command = new PetUpdateCommand();
			command.execute(request, response);
			viewPage = "pet_update.jsp";
			break;
		case "/pet_modify.do":
			command = new PetmodifyCommand();
			command.execute(request, response);
			viewPage = "pet_modify.jsp";
			break;
			
		case "/pet_deleteOk.do":
			command = new PetDeleteCommand();
			command.execute(request, response);
			viewPage = "pet_deleteOk.jsp";
			break;	

		case "/charge.do":
			viewPage = "charge.jsp";
			break;

		case "/chargeOk.do":
			command = new ChargeCommand(); // 1. 커맨드(로직) 결정
			command.execute(request, response); // 커맨드 실행
			viewPage = "chargeOk.jsp"; // 2. 페이지(뷰) 결정
			break;

		case "/login.do":
			viewPage = "login.jsp";
			break;

		case "/loginOk.do":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;

		case "/signUp.do":
			viewPage = "signUp.jsp";
			break;

		case "/signupOk.do":
			command = new SignupCommand();
			command.execute(request, response);
			viewPage = "signupOk.jsp";
			break;

	
		// 주혁 1103 내정보 업데이트
		case "/myinfo.do":
			viewPage = "myinfo.jsp";
			break;

		case "/myinfo_update.do":
			command = new MyinfoUpdateCommand();
			command.execute(request, response);
			viewPage = "myinfo_update.jsp";
			break;

		case "/account_delete.do":
			command = new AccountDeleteCommand();
			command.execute(request, response);
			viewPage = "account_delete.jsp";
			break;

		case "/find_id.do":
			viewPage = "find_id.jsp";
			break;

		case "/findidOk.do":
			command = new FindidCommand();
			command.execute(request, response);
			viewPage = "findidOk.jsp";
			break;

		case "/find_pw.do":
			viewPage = "find_pw.jsp";
			break;

		case "/findpwOk.do":
			command = new FindpwCommand();
			command.execute(request, response);
			viewPage = "findpwOk.jsp";
			break;
			
			// 1103 김영재 현재 작성진행중
		case "/shop.do":
			command = new ShopCommand();
			command.execute(request, response);
			viewPage = "shop.jsp";
			break;

		case "/shopWrite.do":
			viewPage = "shopWrite.jsp";
			break;

		case "/shopWriteOk.do":
			command = new ShopWriteCommand();
			command.execute(request, response);
			viewPage = "shopWriteOk.jsp";
			break;

		case "/shopDeleteOk.do":
			command = new ShopDeleteCommand();
			command.execute(request, response);
			viewPage = "shopDeleteOk.jsp";
			break;

		case "/shopFileUpload.do":
			command = new ShopFileUploadCommand();
			command.execute(request, response);
			break;
			
		//1105 영재 구매jsp 
		case "/shopping.do":
			command = new shoppingCommand();
			command.execute(request, response);
			viewPage = "shopping.jsp";
			break;
		
		case "/shoppingOk.do":
			command = new buyCommand();
			command.execute(request, response);
			viewPage = "shoppingOk.jsp";
			break;
			
		case "/shopEdit.do":
			command = new ShopCommand();
			command.execute(request, response);
			viewPage = "shopEdit.jsp";
			break;
			// 제품 수정하는 곳
		case "/shoppingEdit.do":
			command = new ShopUpdateCommand();
			command.execute(request, response);
			viewPage = "shoppingEdit.jsp";
			break;
			
			
			 //수정확인 
		case "/shopEditOk.do":
	         command = new ShopUpdateOkCommand();
	         command.execute(request, response);
	         viewPage = "shopEditOk.jsp";
	         break;
	         
		case "/cmtdeleteOk.do":
			command = new CmtDeleteCommand();
			command.execute(request, response);
			viewPage = "cmtdeleteOk.jsp";
			break;

		} // end switch

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);

			dispatcher.forward(request, response);
		}

	}// end actionDo()

}// end Controller
