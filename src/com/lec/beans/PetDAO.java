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
					int pet_reserve = rs.getInt("pet_reserve");
					int cus_num = rs.getInt("cus_num");
					
					PetDTO dto =  new PetDTO(pet_num, pet_name, pet_age,  pet_weight, pet_reserve, cus_num);
					
					list.add(dto);
				} // end while
				
				int size = list.size();
				
				if(size == 0) return null;
				arr = new PetDTO[size];
				list.toArray(arr);  // 리스트 -> 배열 변환
				
				return arr;
			} // end createArray()
	
	public PetDTO[] PetNameList() throws SQLException{
		
		PetDTO [] arr =null;
		try {
//			pstmt.close();여기서 안닫아줘도 되는거죠 ?
			pstmt = conn.prepareStatement(D.SQL_NAME_SEARCH);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
		
	}
		
		
		
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
	
	public int FindPetNum (int cus_num,String pet_name) throws SQLException {
		
		PetDTO [] arr = null;
		int pet_num=0;
		
		try {
//			pstmt.close();여기서 안닫아줘도 되는거죠 ?
			pstmt = conn.prepareStatement(D.SQL_PET_NUM_SEARCH);
			pstmt.setInt(1, cus_num);
			pstmt.setString(2,pet_name);
			rs = pstmt.executeQuery();
			System.out.println("rs"+ rs);
//			pet_num=Integer.parseInt(String.valueOf(rs));
			
		} finally {
			close();
		} // end try
		
		return pet_num;
	}
	
	//예약 상태로 만든다.
	public int update(int pet_num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_PET_RESERVE_UPDATE);
			pstmt.setInt(1, pet_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		return cnt;
	} // end update()
	
	// 반려견 정보 추가
	public int insert(int cus_num, String pet_name, int pet_age, int pet_weight) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_PET_INSERT);
			pstmt.setInt(1, cus_num);
			pstmt.setString(2, pet_name);
			pstmt.setInt(3, pet_age);
			pstmt.setInt(4, pet_weight);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert()
	
	//반려건 정보 조회
	public PetDTO[] selectByUid(int c_num) throws SQLException {
		PetDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_PET_SELECT);
			pstmt.setInt(1, c_num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByUid()
	//예약 상태로 만든다.
	public int update2(int pet_num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_PET_UNRESERVE_UPDATE);
			pstmt.setInt(1, pet_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		return cnt;
	} // end update()
	
}
