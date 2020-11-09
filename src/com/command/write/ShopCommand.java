package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ProductDAO;
import com.lec.beans.ProductDTO;

public class ShopCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      ProductDAO dao = new ProductDAO(); // DAO
      ProductDTO [] arr = null;
      //케이스 달기 parameter 타입 받아서 swich 만들기 //타입변수는 all
      
      String kind = "all";
      System.out.println(kind+"kind다!!!!");
      
      if(request.getParameter("kind") != null) {
         kind=request.getParameter("kind");
         System.out.println(kind+"if문이다");
      }
      
      switch (kind) {
      case "all":
         try {
            arr = dao.select();
            
            request.setAttribute("list", arr);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         break;
      
      case "rice":
         try {
            arr = dao.selectByKind("rice");
            
            request.setAttribute("list", arr);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         break;
         
      case "shampoo":
         try {
            arr = dao.selectByKind("shampoo");
            
            request.setAttribute("list", arr);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         break;
         
      case "snack":
          try {
             arr = dao.selectByKind("snack");
             
             request.setAttribute("list", arr);
          } catch (SQLException e) {
             e.printStackTrace();
          }
          break;
         
      case "etc":
         try {
            arr = dao.selectByKind("etc");
            
            request.setAttribute("list", arr);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         break;

      default: //어떤 것이든 올!!
         try {
            arr = dao.select();
            
            request.setAttribute("list", arr);
         } catch (SQLException e) {
            e.printStackTrace();
         }
         break;
      }
      
   }
}