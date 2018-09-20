package member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.NamingException;

/* Data Access Object
 * ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 * 
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 */
public class MemberDAO {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;

	private static MemberDAO instance;

	// �̱��� ����
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
			// 2. ���ؼ� ��ü
			conn = DriverManager.getConnection(jdbcUrl);

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);

			// ���� �����Ѵ�.
			StringBuffer sql = new StringBuffer();
			sql.append("insert into MEMBER (userid, password, username, userphoto) values");
			sql.append("(?, ?, ?, ?)");

			/*
			 * StringBuffer�� ��� ���� �������� toString()�޼��带 �̿��ؾ� �Ѵ�.
			 */
			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getPhotoFile());

			// ���� ����
			pstmt.executeUpdate();
			// �Ϸ�� Ŀ��
			conn.commit();

		} catch (SQLException sqle) {
			// ������ �ѹ�
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
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
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member where userid =" + member.getUserId() + " and password ="
					+ member.getPassword());

			ResultSet rs = stmt.executeQuery(sql.toString());

			if (rs.next()) {
				if (member.getUserId().equals(rs.getString(1)) && member.getPassword().equals(rs.getString(2)))
					return 1; // �α��� ����
				else
					return 0; // �α��� ����
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

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
