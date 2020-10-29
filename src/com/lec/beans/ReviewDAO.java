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

// 1028 2:46 이호인 ReviewDAO
public class ReviewDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체생성 Connection 도 생성
	public ReviewDAO() {
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
	
	// 리뷰 작성 <-- DTO
	public int insert(ReviewDTO dto) throws SQLException {
		int cnt = 0;
		
		String subject = dto.getSubject();
		String content = dto.getContent();
		int star = dto.getStar();
		int c_num = dto.getC_num();
//		cnt = this.insert(subject, content, star);
		cnt = this.insert(subject, content, star, c_num);
		
		return cnt;
	} // end insert(DTO)
	// 위 cnt랑 밑의 insert 주석처리 이유 -> 음 u_num입력받는게 아니라 ? 근데 혹시몰라 적었습니다.
	public int insert(String subject, String content, int star, int c_num) throws SQLException {
//	public int insert(String subject, String content, int star) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, star);
			pstmt.setInt(4, c_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	} // end insert()
	
	// ResultSet => DTO배열로 리턴
	public ReviewDTO [] createArray(ResultSet rs) throws SQLException {
			ReviewDTO [] arr = null;
			ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while(rs.next()) {
				int num = rs.getInt("rev_num");
				String subject = rs.getString("rev_subject");
				String content = rs.getString("rev_content");
				if(content == null) content = "";
				
				int star = rs.getInt("rev_star");
				if(star == 0) star = 5;
				
				Date d = rs.getDate("rev_regdate");  // 년, 월, 일
				Time t = rs.getTime("rev_regdate");  // 시, 분, 초
				String regDate = "";
				if(d != null) {
					regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				int c_num = rs.getInt("cus_num");
				
				
				
				ReviewDTO dto = new ReviewDTO(num, subject, content, star, c_num);
//				ReviewDTO dto = new ReviewDTO(num, subject, content, star);
				dto.setRegDate(regDate);
				
				list.add(dto);
			} // end while
			
			int size = list.size();
			
			if(size == 0) return null;
			arr = new ReviewDTO[size];
			list.toArray(arr);  // 리스트 -> 배열 변환
			
			return arr;
		} // end createArray()
	
	// 전체 글 SELECT
	public ReviewDTO [] select() throws SQLException {
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
		
	} // end select()
	
	// 특정 num 의 글 만 SELECT
	public ReviewDTO [] selectByNum(int num) throws SQLException{
		ReviewDTO [] arr = null;
		
		try {
//			pstmt.close();여기서 안닫아줘도 되는거죠 ?
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_NUM);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try
		
		return arr;
	} // end selectByNum()
	
	// 특정 num 의 글 내용 읽기
	public ReviewDTO [] readByNum(int num) throws SQLException{
		
		int cnt = 0;
		ReviewDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_NUM);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			arr = createArray(rs);
			
			conn.commit();  // 트랜잭션 성공!
		} catch (SQLException e) {
			conn.rollback();  // 트랜잭션 실패하면 rollback()
			throw e;
		} finally {
			close();
		} // end try		
		
		
		return arr;
	} // end readByNum()
	
	// 특정 num 글 수정 (제목, 내용) 수정삭제는 cus_num을 받아와야함 어떻게 받아올까요?
	public int update(int num, String subject, String content, int star) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, star);
			pstmt.setInt(4, num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end update()
	
	// 특정 num 글 삭제 얘도 마찬가지 
	public int deleteByNum(int num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_NUM);
			pstmt.setInt(1, num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	}
	
	
	
}
