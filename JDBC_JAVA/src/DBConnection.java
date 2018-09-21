import java.sql.*;

public class DBConnection {

	public static Connection conn() {
		Connection conn = null;
		try {
			// 1.EMP 테이블에 새로운 사원 정보를 입력하는 프로그램을 작성해보자.
			// 1.DBMS(Oracle) 드라이브 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			conn = DriverManager.getConnection(url,user,pw);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("해당 클래스를 찾을 수 없습니다.");
			System.out.println("DBMS 드라이버 로드 실패");

			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("데이터베이스 연결 실패");
			e.printStackTrace();
		}
		return conn;
	}

}
