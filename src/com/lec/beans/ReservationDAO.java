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
			System.out.println("ReservationDAO 생성, 데이터베이스 연결. . ");
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

	// ResultSet => DTO배열로 리턴
	public ReservationDTO[] createArray(ResultSet rs) throws SQLException {
		ReservationDTO[] arr = null;
		ArrayList<ReservationDTO> list = new ArrayList<ReservationDTO>();

		while (rs.next()) {
			int res_num = rs.getInt("res_num");
			
			Date d = rs.getDate("res_startdate");  // 년, 월, 일
			String regDate = "";
			if(d != null) {
				regDate = new SimpleDateFormat("yyyy-MM-dd").format(d);
			}
			
			d = rs.getDate("res_lastdate");  // 년, 월, 일
			String regDate2 = "";
			if(d != null) {
				regDate2 = new SimpleDateFormat("yyyy-MM-dd").format(d);
			}
			
			String res_message = rs.getString("res_message");
			if (res_message == null)
				res_message = "";
			String res_sinfo = rs.getString("res_sinfo");
			int res_state=rs.getInt("res_state");
			int cus_num = rs.getInt("cus_num");
			int pet_num = rs.getInt("pet_num");

			ReservationDTO dto = new ReservationDTO(res_num, res_message, res_sinfo,res_state, cus_num, pet_num);
			dto.setRes_startdate(regDate);
			dto.setRes_lastdate(regDate2);
			
			list.add(dto);
		} // end while

		int size = list.size();

		if (size == 0)
			return null;
		arr = new ReservationDTO[size];
		list.toArray(arr); // 리스트 -> 배열 변환
		return arr;
	} // end createArray()

	// 예약 작성 <-- DTO
	public int insert(ReservationDTO dto) throws SQLException {
		int cnt = 0;

		String res_startdate = dto.getRes_startdate();
		String res_lastdate = dto.getRes_lastdate();
		String res_message = dto.getRes_message();
		String res_sinfo = dto.getRes_sinfo();
		int cus_num = dto.getCus_num();
		int pet_num = dto.getPet_num();

		cnt = this.insert(res_startdate, res_lastdate, res_message, res_sinfo, cus_num, pet_num);

		return cnt;
	} // end insert(DTO)

	public int insert(String res_startdate, String res_lastdate, String res_message, String res_sinfo,int cus_num,
			int pet_num) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_INSERT);
			pstmt.setString(1, res_startdate);
			pstmt.setString(2, res_lastdate);
			pstmt.setString(3, res_message);
			pstmt.setString(4, res_sinfo);
			pstmt.setInt(5, cus_num);
			pstmt.setInt(6, pet_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	} // end insert()

	// 전체 예약 SELECT
	public ReservationDTO[] select() throws SQLException {
		ReservationDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;

	} // end select()

	// 특정 사용자의 num의 글 만 SELECT
	public ReservationDTO[] selectByNum(int cus_num) throws SQLException {
		ReservationDTO[] arr = null;
		int cnt=0;
		
		try {
			//투숙중으로
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_STATE);
			pstmt.setInt(1, cus_num);
			cnt = pstmt.executeUpdate();
	
			//강아지 상태 바꾸기 1->0으로
			pstmt = conn.prepareStatement(D.SQL_PET_STATE);
			pstmt.setInt(1, cus_num);
			cnt = pstmt.executeUpdate();
			
			//예약 종료로
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_STATE2);
			pstmt.setInt(1, cus_num);
			cnt = pstmt.executeUpdate();
			
			//예약 리스트 뽑기
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_SELECT_BY_NUM);
			pstmt.setInt(1, cus_num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByNum()
	
	
	// 특정 예약번호의 글 만 SELECT
	public ReservationDTO[] selectByResNum(int num) throws SQLException {
		ReservationDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_SELECT_BY_RESNUM);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		} // end try

		return arr;
	} // end selectByNum()
	
	
	// 특정 num 글 삭제 얘도 마찬가지 
	public int deleteByNum(int num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_DELETE_BY_NUM);
			pstmt.setInt(1, num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	}

	
	// 특정 num 글 수정 (제목, 내용) 수정삭제는 cus_num을 받아와야함 어떻게 받아올까요?
	public int update(int num, String res_startdate, String res_lastdate, String res_message, String res_sinfo) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_UPDATE);
			pstmt.setInt(1, num);
			pstmt.setString(2, res_startdate);
			pstmt.setString(3, res_lastdate);
			pstmt.setString(4, res_message);
			pstmt.setString(5, res_sinfo);

			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	} // end update()
	
	
	public int stateupdate(int cus_num) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_STATE);
			pstmt.setInt(1, cus_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		try {
			pstmt = conn.prepareStatement(D.SQL_RESERVATION_STATE2);
			pstmt.setInt(1, cus_num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try
		
		return cnt;
	}
	
}
