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

public class CmtDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체생성 Connection 도 생성
	public CmtDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("CmtDAO 생성, 데이터베이스 연결. . ");
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
	
	// 리뷰 작성 <-- DTO
	public int insert(CmtDTO dto) throws SQLException {
		int cnt = 0;
		
		String id = dto.getId();
		String content = dto.getContent();
		int r_num = dto.getR_num();
		int c_num = dto.getC_num();
		cnt = this.insert(id, content, r_num, c_num);
		
		return cnt;
	} // end insert(DTO)
	public int insert(String id, String content, int r_num, int c_num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CMT_INSERT);
			pstmt.setString(1, id);
			pstmt.setString(2, content);
			pstmt.setInt(3, r_num);
			pstmt.setInt(4, c_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	} // end insert()
	
	// ResultSet => DTO배열로 리턴
	public CmtDTO [] createArray(ResultSet rs) throws SQLException {
			CmtDTO [] arr = null;
			ArrayList<CmtDTO> list = new ArrayList<CmtDTO>();
			
			while(rs.next()) {
				int num = rs.getInt("cmt_num");
				System.out.println(num);
				String id = rs.getString("cmt_id");
				System.out.println(id);
				Date d = rs.getDate("cmt_regdate");  // 년, 월, 일
				Time t = rs.getTime("cmt_regdate");  // 시, 분, 초
				String regDate = "";
				if(d != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm").format(t);
				}
				String content = rs.getString("cmt_content");
				int r_num = rs.getInt("rev_num");
				int c_num = rs.getInt("cus_num");
				
				
				
				CmtDTO dto = new CmtDTO(num, id, content, r_num, c_num);
				dto.setRegDate(regDate);
				
				list.add(dto);
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			arr = new CmtDTO[size];
			list.toArray(arr);  // 리스트 -> 배열 변환
			
			return arr;
		} // end createArray()
	
	// 전체 글 SELECT
//	public CmtDTO [] select() throws SQLException {
//		CmtDTO [] arr = null;
//		
//		try {
//			pstmt = conn.prepareStatement(D.SQL_CMT_SELECT);
//			rs = pstmt.executeQuery();
//			arr = createArray(rs);
//		} finally {
//			close();
//		}
//		
//		return arr;
//		
//	} // end select()
	
	// 특정 num 의 글 만 SELECT
	public CmtDTO [] selectByNum(int num) throws SQLException{
		CmtDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CMT_SELECT_BY_NUM);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectByNum()
	
	
	public int cmtupdate(int cmt_num, String content) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_CMT_UPDATE);
			pstmt.setInt(1, cmt_num);
			pstmt.setString(2, content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try

		return cnt;
	} // end update

	
	
	// 특정 num 글 삭제 얘도 마찬가지 
	public int deleteByNum(int num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_CMT_DELETE_BY_NUM);
			pstmt.setInt(1, num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	}
	
	
	
}
