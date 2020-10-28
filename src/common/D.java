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
				+ "(rev_num, rev_subject, rev_content, rev_star, rev_regdate, user_num) "
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
				"UPDATE review SET rev_subject = ?, rev_content = ?, rev_star = ?, WHERE rev_num = ?";
		
}
