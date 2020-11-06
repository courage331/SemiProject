package com.lec.beans;

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
	
	public int insert(SellDataDTO dto) throws SQLException{
		int cnt = 0; 
		
		
			int pro_num = dto.getPro_num();
			int sCnt = dto.getSell_cnt();
			int sSum = dto.getSell_sum();
			
			cnt = this.insert(pro_num, sCnt,sSum);
		
		return cnt;
	}
	
	public int insert(int pro_num, int sCnt, int sSum) throws SQLException {
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_SELL_INSERT);
				pstmt.setInt(1, pro_num);
				pstmt.setInt(2, sCnt);
				pstmt.setInt(3, sSum);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			
			return cnt;
			
	
		} // end insert()
	
	// ResultSet => DTO배열로 리턴
	public SellDataDTO [] createArray(ResultSet rs) throws SQLException {
			SellDataDTO [] arr = null;
			ArrayList<SellDataDTO> list = new ArrayList<SellDataDTO>();
		
			while(rs.next()) {
				int pNum = rs.getInt("pro_num");
				Date d = rs.getDate("rev_regdate");  // 년, 월, 일
				Time t = rs.getTime("rev_regdate");  // 시, 분, 초
				String sellDate = "";
				if(d != null) {
					sellDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				int sCnt = rs.getInt("sell_cnt");
				int sSum = rs.getInt("sell_sum");
				
				
				SellDataDTO dto = new SellDataDTO(pNum, sCnt, sSum);
				dto.setSellDate(sellDate);
				
				list.add(dto);
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			arr = new SellDataDTO[size];
			list.toArray(arr);  // 리스트 -> 배열 변환
			
			return arr;
		} // end createArray()
	
//	public int IncCntByProNum(int pNum) throws SQLException {
//		int cnt = 0;
//
//		try {
//			pstmt = conn.prepareStatement(D.SQL_INC_CNT);
//			pstmt.setInt(1, pNum);
//			cnt = pstmt.executeUpdate();
//		} finally {
//			close();
//		} // end try
//
//		return cnt;
//	}
	
//	public int IncSumByProNum(int pNum) throws SQLException {
//		int cnt = 0;
//
//		try {
//			pstmt = conn.prepareStatement(D.SQL_CNT_SUM);
//			pstmt.setInt(1, pNum);
//			cnt = pstmt.executeUpdate();
//		} finally {
//			close();
//		} // end try
//
//		return cnt;
//	}
	
	
}
