import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest4 {
	public static void main(String[] args) {
		try {
//			4.EMP ���̺� �� ��SCOTT�� �̸����� �˻��� ����� ����ϴ� ���α׷��� �ۼ��غ���.
						
			// 1.DBMS(Oracle) ����̺� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			// 2.�����ͺ��̽� ����
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("�����ͺ��̽� ���� ����");
			// 3.�����ͺ��̽� �۾�			
						
			String sql2 = "SELECT * FROM EMP WHERE ENAME='SCOTT'";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql2);
			
			while(rs.next()) {
				System.out.print("������ȣ : " + rs.getInt(1)+ "\t");
				System.out.print("�̸� : " + rs.getString(2)+ "\t");
				System.out.print("������ : " + rs.getString(3)+ "\t");
				System.out.print("�Ŵ��� : " + rs.getString(4)+ "\t");
				System.out.print("�Ի��� : " + rs.getString(5)+ "\t");
				System.out.print("���� : " + rs.getString(6)+ "\t");
				System.out.print("Ŀ�̼� : " + rs.getString(7)+ "\t");
				System.out.print("�μ���ȣ : " + rs.getString(8)+ "\t");
				System.out.println("\n----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			}
					
			
			stmt.close();						
						
			
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
