package member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

/* Data Access Object
 * 테이블 당 한개의 DAO를 작성한다.
 * 
 * JSP_MEMBER 테이블과 연관된 DAO로
 * 회원 데이터를 처리하는 클래스이다.
 */
public class MemberDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;

	private static MemberDAO instance;

	// 싱글톤 패턴
	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	public void insertMember(MemberInfo member) throws SQLException, NamingException, ClassNotFoundException {

		String jdbcUrl = "jdbc:apache:commons:dbcp:open";

		try {
			// 2. 컨넥션 객체
			conn = DriverManager.getConnection(jdbcUrl);
			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);

			// 쿼리 생성한다.
			StringBuffer sql = new StringBuffer();
			sql.append("insert into MEMBER (userid, password, username, userphoto) values");
			sql.append("(?, ?, ?, ?)");
			
			

			/*
			 * StringBuffer에 담긴 값을 얻으려면 toString()메서드를 이용해야 한다.
			 */
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getPhotoFile());

			// 쿼리 실행
			cnt = pstmt.executeUpdate();
			System.out.println(cnt);
			// 완료시 커밋
			conn.commit();

		} catch (SQLException sqle) {
			// 오류시 롤백
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	} // end insertMember()

	public int login(MemberInfo member) {

		String jdbcUrl = "jdbc:apache:commons:dbcp:open";

		try {
			conn = DriverManager.getConnection(jdbcUrl);
			stmt = conn.createStatement();
			String sql = "select * from member where userid ='" + member.getUserId()+ "'";

			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				System.out.println(member.getUserId().equals(rs.getString(1)));
				System.out.println(member.getPassword().equals(rs.getString(2)));
				
				if (member.getUserId().equals(rs.getString(1)) && member.getPassword().equals(rs.getString(2))) {
					return 1; // 로그인 성공
				}
				else {
					return 0; // 로그인 실패
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			if (rs != null) {
				try {
					rs.close();

				} catch (SQLException se) {
					
				}
			}
			
			if (stmt != null) {
				try {
					stmt.close();

				} catch (SQLException se) {
					
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException se) {

				}
			}
		}
		return -1;
	}
}
