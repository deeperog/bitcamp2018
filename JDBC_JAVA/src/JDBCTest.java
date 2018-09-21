import java.sql.*;

public class JDBCTest {
	public static void main(String[] args) {
		Connection conn = null;
		try {
			conn = DBConnection.conn();
			
			System.out.println("�����ͺ��̽� ���� ����");
			// 3.�����ͺ��̽� �۾�
			
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
			System.out.println(procNum + "�� ���� ����Ǿ����ϴ�.");
			pstmt.close();						
			
			// 4.�����ͺ��̽� ���� ����
			conn.close();
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("�����ͺ��̽� ���� ����");
			e.printStackTrace();
		} 
		
	}

	
}
