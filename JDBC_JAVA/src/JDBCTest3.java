import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCTest3 {
	public static void main(String[] args) {
		try {
//			3. EMP ���̺��� ��SCOTT�� ����� �޿�(sal) ������ 1000���� �ٲٴ� ���α׷��� �ۼ��غ���.
						
			// 1.DBMS(Oracle) ����̺� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			// 2.�����ͺ��̽� ����
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("�����ͺ��̽� ���� ����");
			// 3.�����ͺ��̽� �۾�
			
						
//			String sql2 = "UPDATE EMP SET SAL=1000 WHERE ENAME='SCOTT'";
			String sql2 = "UPDATE EMP SET SAL=? WHERE ENAME='SCOTT'";
			
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, 1000);
//			pstmt.setString(2, "SCOTT");			
			
			int procNum = pstmt.executeUpdate();			
			System.out.println(procNum + "�� ���� ����Ǿ����ϴ�.");
			pstmt.close();						
						
			
			// 4.�����ͺ��̽� ���� ����
			conn.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("�ش� Ŭ������ ã�� �� �����ϴ�.");
			System.out.println("DBMS ����̹� �ε� ����");
			
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("�����ͺ��̽� ���� ����");
			e.printStackTrace();
		}
		
	}

	
}
