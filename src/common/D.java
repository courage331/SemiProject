package common;
// 1028 2:50 이호인 D DAO에 사용시 필요함 
public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "cosat";
	public static final String USERPW = "1234";
	
	// 게시글 관련 쿼리문
	// (글번호, 글제목, 글내용, 별점주기, 등록일자, 사용자 고유 번호)
		public static final String SQL_WRITE_INSERT = 
				"INSERT INTO review"
				+ "(rev_num, rev_subject, rev_content, rev_star, rev_regdate, cus_num) "
				+ "VALUES"
				+ "(review_seq.nextval, ?, ?, ?, SYSDATE, ?)";
		// 여기서 user_num도 '?'로 받아오는지 모르겠습니다.
		
		public static final String SQL_WRITE_SELECT = 
				"SELECT * FROM review ORDER BY rev_num DESC";
		
		public static final String SQL_WRITE_SELECT_BY_NUM =
				"SELECT * FROM review WHERE rev_num = ?";
		
		public static final String SQL_WRITE_DELETE_BY_NUM =
				"DELETE FROM review WHERE rev_num = ?";

		// rev_star 별점도 변경 
		public static final String SQL_WRITE_UPDATE =
				" UPDATE (SELECT rev_subject, rev_content, rev_star FROM review WHERE rev_num = ? AND cus_num = ?) SET rev_subject = ?, rev_content = ?, rev_star = ?";
		
		 // cmt insert 호인
		public static final String SQL_CMT_INSERT = 
				"INSERT INTO cmt"
				+ "(cmt_num, cmt_id, cmt_regdate, cmt_content, rev_num, cus_num) "
				+ "VALUES"
				+ "(cmt_seq.nextval, ?, SYSDATE, ?, ?, ?)";
		
		public static final String SQL_CMT_SELECT_BY_NUM =
				"SELECT * FROM cmt WHERE rev_num = ? ORDER BY CMT_NUM";
		
		public static final String SQL_CMT_DELETE_BY_NUM =
				"DELETE FROM cmt WHERE cmt_num = ?";
		
		
		//지민 1029 reservation 관련(예약 성공시에 상입)
		public static final String SQL_RESERVATION_INSERT=
				"INSERT INTO reservation"
			+"(res_num,res_startdate,res_lastdate,res_message,res_sinfo,res_state,cus_num,pet_num)"
			+"VALUES"
			+"(reservation_seq.nextval,?,?,?,?,1,?,?)"
		;
		
		//예약 수정
		public static final String SQL_RESERVATION_UPDATE =
				" UPDATE (SELECT res_startdate, res_lastdate, res_message, res_sinfo FROM reservation WHERE res_num = ?) SET res_startdate=?, res_lastdate=?,res_message=?,res_sinfo=?";
		
		public static final String SQL_RESERVATION_DELETE_BY_NUM =
				"DELETE FROM reservation WHERE res_num = ?";
		
		public static final String SQL_PET_SEARCH_BY_NUM = 
				"SELECT * FROM pet WHERE pet_num = ?";
		
		public static final String SQL_NAME_SEARCH =
				"SELECT * FROM pet";
		
		public static final String SQL_PET_SEARCH =
				"SELECT * FROM pet WHERE cus_num = ?";
		
		public static final String SQL_RESERVATION_SELECT = 
				"SELECT * FROM reservation ORDER BY res_num DESC";
		
		public static final String SQL_RESERVATION_SELECT_BY_NUM =
				"SELECT * FROM reservation WHERE cus_num = ? ORDER BY res_num DESC";

		public static final String SQL_RESERVATION_SELECT_BY_RESNUM =
				"SELECT * FROM reservation WHERE res_num = ?";
		
		public static final String SQL_PET_RESERVE_UPDATE=
				" UPDATE pet SET pet_reserve = 1 WHERE pet_num = ?";
		
		public static final String SQL_PET_UNRESERVE_UPDATE=
				" UPDATE pet SET pet_reserve = 0 WHERE pet_num = ?";
		
		public static final String SQL_PET_NUM_SEARCH =
				"SELECT pet_num FROM pet WHERE cus_num = ? AND pet_name=?";
		//정호 1030 mypage 관련(뼈다귀)
		public static final String SQL_MYPAGE_SELECT = 
				"SELECT * FROM CUSTOMER WHERE CUS_NUM = ?";
		//주혁 1031 로그인시 회원인지 확인
		public static final String SQL_LOGIN_SELECT = 
				"SELECT * FROM CUSTOMER WHERE cus_id = ? AND cus_pw = ?";
		//주혁 1102 회원가입시 인설트
		public static final String SQL_SIGNUP_INSERT = 
				"INSERT INTO customer"
				+ "(CUS_NUM, CUS_PW, CUS_NAME, CUS_PHONE, CUS_EMAIL, CUS_ID, CUS_MONEY) "
				+ "VALUES"
				+ "(customer_seq.nextval,?,?,?,?,?,0)";
		//영재 1103 쇼핑몰 게시판 작성
		public static final String SQL_PRODUCT_INSERT = 
				"INSERT INTO PRODUCT"
				+ "(pro_num, pro_kind, pro_price, pro_cnt, pro_name) "
				+ "VALUES"
				+ "(product_seq.nextval, ?, ?, ?, ?)";
		//상품 번호 순서 정렬
		public static final String SQL_PRODUCT_SELECT = 
				"SELECT * FROM product ORDER BY pro_num";
		
		public static final String SQL_PRODUCT_SELECT_BY_NAME =
				"SELECT * FROM product WHERE pro_name = ?";
		
		public static final String SQL_PRODUCT_SELECT_BY_KIND =
				"SELECT * FROM product WHERE pro_kind = ?";
		
		public static final String SQL_PRODUCT_SELECT_BY_NUM =
				"SELECT * FROM product WHERE pro_num = ?";
		
		//상품 삭제
		public static final String SQL_PRODUCT_DELETE_BY_NUM =
				"DELETE FROM product WHERE pro_num = ?";
		// 가격, 재고수량 제품 이름 수정
		public static final String SQL_PRODUCT_UPDATE =
				" UPDATE PRODUCT SET pro_price = ?, pro_cnt = ? WHERE pro_num = ?";
				//" UPDATE (SELECT pro_price, pro_cnt FROM PRODUCT WHERE pro_num = ?) SET pro_price = ?, pro_cnt = ?";
				//" UPDATE (SELECT pro_price, pro_cnt FROM product WHERE pro_num = ?) SET pro_price = ?, pro_cnt = ?";
		//주혁 1103 내정보관리에서 데이터 읽어오기
		//public static final String SQL_READ_SELECT_BY_NUM =
		//		"SELECT * FROM customer WHERE CUS_NUM = ?";
		//주혁 1104 내정보 수정
		public static final String SQL_MYINFO_UPDATE =
				" UPDATE (SELECT CUS_PW, CUS_NAME, CUS_PHONE, CUS_EMAIL FROM customer WHERE CUS_NUM = ?) SET CUS_PW = ?, CUS_NAME = ?, CUS_PHONE = ?, CUS_EMAIL = ?";
		
		// 정호 1103 반려견 정보 추가 인설트 
		public static final String SQL_PET_INSERT =
				"INSERT INTO pet"
				+ "(pet_num, cus_num, pet_name, pet_age, pet_weight, pet_reserve, pet_image)"
				+ "VALUES"
				+ "(PET_SEQ.nextval,?,?,?,?,0,?)";
		//정호 1103 반려견 정보 조회
		public static final String SQL_PET_SELECT = 
				"SELECT * FROM PET WHERE CUS_NUM = ?";
		//주혁 1104 회원탈퇴
		public static final String SQL_ACCOUNT_DELETE_BY_NUM =
				"DELETE FROM customer WHERE CUS_NUM = ?";
		//주혁 1104 아이디찾기
		public static final String SQL_FINDID_SELECT = 
				"SELECT * FROM CUSTOMER WHERE CUS_NAME = ? AND CUS_EMAIL = ?";
		
		//주혁 1104 비밀번호찾기
		public static final String SQL_FINDPW_SELECT = 
				"SELECT * FROM CUSTOMER WHERE CUS_NAME = ? AND CUS_EMAIL = ? AND CUS_ID = ?";
		
		//정호 1104 뼈다귀 충전
		public static final String SQL_CASH_UPDATE =
				"UPDATE (SELECT CUS_MONEY FROM CUSTOMER WHERE CUS_NUM = ?) SET CUS_MONEY = CUS_MONEY + ?";
		
		//정호 1104 반려견 정보 삭제
		public static final String SQL_PET_DELETE =
				"DELETE FROM PET WHERE PET_NUM = ?";
		
		//정호 1105 반려견 정보 수정
		public static final String SQL_PET_MODIFY =
				"UPDATE (SELECT PET_NAME, PET_AGE, PET_WEIGHT, PET_IMAGE FROM PET WHERE PET_NUM = ?) "
				+ "SET PET_NAME = ?, PET_AGE = ?, PET_WEIGHT = ?, PET_IMAGE = ?";
		
		//영재 1105 재고 수량 제거 일단 1개로
		public static final String SQL_PRODUCT_DEC_CNT = 
				"UPDATE PRODUCT SET pro_cnt = pro_cnt - 1 WHERE pro_name = ?";

		//영재 1105 금액 차감 
		public static final String SQL_CASH_DEL_UPDATE = 
				"UPDATE (SELECT CUS_MONEY FROM CUSTOMER WHERE CUS_NUM = ?) SET CUS_MONEY = CUS_MONEY - ?";
		//주혁 1106 아이디중복확인
		public static final String SQL_IDCHK_SELECT = 
				"SELECT count(*) FROM CUSTOMER WHERE CUS_ID = ?";
		
	    public static final String SQL_FIND_CASH = 
	            "SELECT * FROM CUSTOMER WHERE CUS_NUM=?";
	    
	    public static final String SQL_SELL_INSERT =
	    		"INSERT INTO SELLDATA"
	    				+ "(cus_num, pro_num, sell_date, sell_cnt, sell_sum)"
	    				+ "VALUES"
	    				+ "(?,?,SYSDATE,?,?)";
	  //주혁 1109 이메일찾기
	  		public static final String SQL_EMAILCHK_SELECT = 
	  				"SELECT count(*) FROM CUSTOMER WHERE CUS_EMAIL = ?";
	    
//	    public static final String SQL_INC_CNT = 
//	    		"UPDATE (SELECT SELL_CNT FROM SELLDATA WHERE PRO_NUM = ?) SET SELL_CNT = CELL_CNT + 1";
//	    
//	    public static final String SQL_CNT_SUM = 
//	    		"UPDATE (SELECT SELL_SUM FROM SELLDATA WHERE PRO_NUM = ?) SET SELL_SUM = CELL_SUM + ?";
	    		

}
