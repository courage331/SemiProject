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
      int sdto=0;
      
      ProductDAO dao = new ProductDAO();
      CustomerDAO cdao = new CustomerDAO();
      CustomerDTO [] cdto = null;
      ProductDTO [] pdto = null;
      ProductDAO pdao = new ProductDAO();
//      SellDataDAO sdao = new SellDataDAO();
      
      HttpSession session = request.getSession(); 
      String pName = request.getParameter("pName");
      System.out.println(pName+"피네임이다!!!!!!!!!!!!!!!!");
      System.out.println();
      System.out.println();
      

//      int sCnt = Integer.parseInt((String) request.getAttribute("sCnt"));
//      System.out.println(sCnt + "커넘의 씨엔티다!!!!!!!!!!!!!!!!!!!");
//      int sSum = Integer.parseInt((String) request.getAttribute("sSum"));
//      int pro_num = Integer.parseInt((String) request.getAttribute("pro_num"));
      int cus_num = Integer.parseInt((String)(session.getAttribute("c_num")));
      if(cus_num == 0) {
    	  System.out.println("null입니다");
      }
      System.out.println(cus_num+"!!!!!씨넘!!!!!!!!!!!!!");
      
      
      try {
         System.out.println("pName: ---!!!!!!!!!!!!" + pName);
         cdto = cdao.selectMoney(cus_num);
         pdto = pdao.selectBypName(pName);
//         sdto = sdao.insert(cus_num, pro_num, sCnt, sSum);
         
      } catch(SQLException e) {
         e.printStackTrace();
      }
      
      request.setAttribute("clist", cdto);
      request.setAttribute("plist", pdto);
//      request.setAttribute("sell", sdto);
   }

}