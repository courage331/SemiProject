package com.command.write;
//구매하기 완료시 뼈다귀 차감 금액 차감
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.ProductDAO;
import com.lec.beans.ProductDTO;
import com.lec.beans.SellDataDAO;
import com.lec.beans.SellDataDTO;

public class buyCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		int dcnt = 0;
		int ssdao = 0;
		ProductDAO dao = new ProductDAO();
		HttpSession session = request.getSession(); 
		CustomerDAO cdao = new CustomerDAO();
	    ProductDTO [] pdto = null;
	    ProductDAO pdao = new ProductDAO();
	    SellDataDAO sdao = new SellDataDAO();
	    SellDataDTO [] sdto = null;

//		System.out.println("buyCommand c_num" + (String) (session.getAttribute("c_num")));
//		System.out.println("buyCommand price" + request.getParameter("price"));

		int cus_num = Integer.parseInt((String) (session.getAttribute("c_num")));
		int price = Integer.parseInt(request.getParameter("price"));
		System.out.println(price+"파라메터 받은 price");
		int counting = Integer.parseInt((String) request.getParameter("counting"));
		System.out.println(counting);
		int sSum = Integer.parseInt((String) request.getParameter("sSum"));
		System.out.println(sSum + "구매총금액");
		
		int pro_num = Integer.parseInt((String) request.getParameter("pNum"));
//		System.out.println(pro_num);

		String pName = request.getParameter("pName");

		try {
			dcnt = cdao.delMoney(cus_num,price);
			cnt = dao.deleteCnt(counting, pName);
			ssdao = sdao.insert(cus_num, pro_num, counting, sSum);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		request.setAttribute("list", dcnt);
		request.setAttribute("sresult", ssdao);
	}

}