package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.beans.CustomerDAO;
import com.lec.beans.CustomerDTO;
import com.lec.beans.ProductDAO;
import com.lec.beans.ProductDTO;

public class shoppingCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      CustomerDAO cdao = new CustomerDAO();
      CustomerDTO [] cdto = null;
      ProductDAO pdao = new ProductDAO();
      ProductDTO [] pdto = null;
      
      HttpSession session = request.getSession(); 
      int pNum = Integer.parseInt(request.getParameter("pNum"));

      int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
      if(cus_num == 0 ) {
    	  System.out.println("null입니다");
      }
      
      
      try {
         cdto = cdao.selectMoney(cus_num);
         pdto = pdao.readBypNum(pNum);
         
      } catch(SQLException e) {
         e.printStackTrace();
      }
      
      request.setAttribute("clist", cdto);
      request.setAttribute("plist", pdto);
   }

}