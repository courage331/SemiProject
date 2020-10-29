package com.lec.beans;

//예약 관련 DAO

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.D;

//
public class ReservationDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체생성 Connection 도 생성
	public ReservationDAO() {
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
	
	
	// 예약 작성 <-- DTO
	public int insert(ReservationDTO dto) throws SQLException {
		int cnt = 0;
		
		String res_startdate = dto.getRes_startdate();
		String res_lastdate = dto.getRes_lastdate();
		String mesaage = dto.getMessage();
		int cus_num= dto.getCus_num();
		int pet_num = dto.getPet_num();
				
		cnt = this.insert(res_startdate, res_lastdate, mesaage,cus_num,pet_num);
		
		return cnt;
	} // end insert(DTO)
	
	public int insert(String res_startdate, String res_lastdate,String message, int cus_num, int pet_num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_INSERT);
			pstmt.setString(1, res_startdate);
			pstmt.setString(2, res_lastdate);
			pstmt.setString(3, message);
			pstmt.setInt(4, cus_num);
			pstmt.setInt(5, pet_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	} // end insert()
	
}
