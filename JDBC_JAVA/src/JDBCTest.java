import java.sql.*;

public class JDBCTest {
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DBConnection.conn();
			
			System.out.println("데이터베이스 연결 성공");
			// 3.데이터베이스 작업
			
			String sql1 = "INSERT INTO emp VALUES(?, ?, ?, ?, ?, ?, ?, ?)";			
			
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			
			pstmt.setInt(1, 1111);
			pstmt.setString(2, "JOSH");
			pstmt.setString(3, "YOUTUBER");
			pstmt.setString(4, "1234");
			pstmt.setString(5, "18/09/19");
			pstmt.setInt(6, 2222);
			pstmt.setInt(7, 3000);
			pstmt.setInt(8, 30);
			
			int procNum = pstmt.executeUpdate();			
			System.out.println(procNum + "개 행이 적용되었습니다.");
			pstmt.close();						
			
			// 4.데이터베이스 연결 종료
			conn.close();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("데이터베이스 연결 실패");
			e.printStackTrace();
		} 
		
	}

	
}
