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
import java.util.Arrays;

import common.D;

//
public class CustomerDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체생성 Connection 도 생성
	public CustomerDAO() {
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
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	} // end close()

	// 정호 1030 uid 로 뼈다귀검색
	// ResultSet => DTO배열로 리턴
	public CustomerDTO[] createArray(ResultSet rs) throws SQLException {
		CustomerDTO[] arr = null;
		ArrayList<CustomerDTO> list = new ArrayList<CustomerDTO>();

		while (rs.next()) {
			int cus_num = rs.getInt("cus_num");
			String cus_pw = rs.getString("cus_pw");
			String cus_name = rs.getString("cus_name");
			String cus_phone = rs.getString("cus_phone");
			String cus_email = rs.getString("cus_email");
			String cus_id = rs.getString("cus_id");
			int cus_money = rs.getInt("cus_money");

			CustomerDTO dto = new CustomerDTO(cus_num, cus_pw, cus_name, cus_phone, cus_email, cus_id, cus_money);

			list.add(dto);
		} // end while

		int size = list.size();
		if (size == 0)
			return null;
		arr = new CustomerDTO[size];
		list.toArray(arr); // 리스트 -> 배열 변환
		return arr;
	} // end createArray()

	public CustomerDTO[] selectByUid(int c_num) throws SQLException {
		CustomerDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_MYPAGE_SELECT);
			pstmt.setInt(1, c_num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByUid()

	// 주혁 1031 로그인시 회원인지 아닌지 확인하기위한 조회
	public int find_account(String c_id, String c_pw) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_LOGIN_SELECT);
			pstmt.setString(1, c_id);
			pstmt.setString(2, c_pw);
			cnt = pstmt.executeUpdate();
//            rs = pstmt.executeQuery();
//            cnt = createArray(rs);
		} finally {
			close();
		} // end try

		return cnt;
	} // end selectByUid()

// 주혁 1102 로그인시 회원인지 아닌지 확인하기위한 조회
	public CustomerDTO[] find_accountinfo(String cus_id, String cus_pw) throws SQLException {
		CustomerDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(D.SQL_LOGIN_SELECT);
			pstmt.setString(1, cus_id);
			pstmt.setString(2, cus_pw);
			rs = pstmt.executeQuery();
			System.out.println();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByUid()

//리뷰 작성 <-- DTO
	public int insert(CustomerDTO dto) throws SQLException {
		int cnt = 0;

		String c_id = dto.getCus_id();
		String c_pw = dto.getCus_pw();
		String c_name = dto.getCus_name();
		String c_phone = dto.getCus_phone();
		String c_email = dto.getCus_email();

		cnt = this.c_insert(c_id, c_pw, c_name, c_phone, c_email);

		return cnt;
	} // end insert(DTO)
// 회원가입 

	public int c_insert(String c_pw, String c_name, String c_phone, String c_email, String c_id) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_SIGNUP_INSERT);
			// pstmt.setInt(1, c_num);
			pstmt.setString(1, c_pw);
			pstmt.setString(2, c_name);
			pstmt.setString(3, c_phone);
			pstmt.setString(4, c_email);
			pstmt.setString(5, c_id);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;

	} // end insert()

//주혁1103 내정보관리에서 내 데이터 읽어올때
//	public CustomerDTO [] readByNum(int num) throws SQLException{
//		
//		int cnt = 0;
//		CustomerDTO [] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(D.SQL_READ_SELECT_BY_NUM);
//			pstmt.setInt(1, num);
//			rs = pstmt.executeQuery();
//			
//			arr = createArray(rs);
//			
//			conn.commit();  // 트랜잭션 성공!
//		} catch (SQLException e) {
//			conn.rollback();  // 트랜잭션 실패하면 rollback()
//			throw e;
//		} finally {
//			close();
//		} // end try		
//		
//		
//		return arr;
//	} // end readByNum()
public int update(String cus_pw, String cus_name, String cus_phone, String cus_email, String cus_id) throws SQLException {
	int cnt = 0;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MYINFO_UPDATE);  //TODO 1104
		pstmt.setString(1, cus_pw);
		pstmt.setString(2, cus_name);
		pstmt.setString(3, cus_phone);
		pstmt.setString(4, cus_email);
		pstmt.setString(5, cus_id);
		cnt = pstmt.executeUpdate();
	} finally {
		close();
	} // end try
	
	return cnt;

} // end insert()

}
