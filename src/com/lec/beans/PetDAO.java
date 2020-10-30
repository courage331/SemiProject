package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.D;

//
public class PetDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체생성 Connection 도 생성
	public PetDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("PetDAO 생성, 데이터베이스 연결. . ");
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

	
	// ResultSet => DTO배열로 리턴
		public PetDTO [] createArray(ResultSet rs) throws SQLException {
				PetDTO [] arr = null;
				ArrayList<PetDTO> list = new ArrayList<PetDTO>();
				
				while(rs.next()) {
					int pet_num = rs.getInt("pet_num");
					String pet_name = rs.getString("pet_name");
					int pet_age = rs.getInt("pet_age");
					int pet_weight = rs.getInt("pet_weight");
					int cus_num = rs.getInt("cus_num");
					
					PetDTO dto =  new PetDTO(pet_num, pet_name, pet_age,  pet_weight, cus_num);
					
					list.add(dto);
				} // end while
				
				int size = list.size();
				
				if(size == 0) return null;
				arr = new PetDTO[size];
				list.toArray(arr);  // 리스트 -> 배열 변환
				
				return arr;
			} // end createArray()
	
	public PetDTO[] FindByOwner(int cus_num) throws SQLException {
		
		PetDTO [] arr = null;
		
		try {
//			pstmt.close();여기서 안닫아줘도 되는거죠 ?
			pstmt = conn.prepareStatement(D.SQL_PET_SEARCH);
			pstmt.setInt(1, cus_num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
		
	}
	
	
}
