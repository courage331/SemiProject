package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.D;

//
public class SellDataDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체생성 Connection 도 생성
	public SellDataDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("WriteDAO 생성, 데이터베이스 연결. . ");
			// 연결확인
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close(); 
	} // end close()
	
//	public insert(SellDataDTO dto) throws SQLException{
//		int = 0; 
//		
//		int cus_num = dto.getCus_num();
//		int pro_num = dto.getPro_num();
//		int pCnt = dto.getSell_cnt();
//		int pSum = dto.getSell_sum();
//		
//		return = 
//	}
	
	
}
