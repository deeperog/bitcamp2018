import java.sql.*;

public class DBConnection {

	public static Connection conn() {
		Connection conn = null;
		try {
			// 1.EMP ���̺� ���ο� ��� ������ �Է��ϴ� ���α׷��� �ۼ��غ���.
			// 1.DBMS(Oracle) ����̺� �ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			conn = DriverManager.getConnection(url,user,pw);
			
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
		return conn;
	}

}
