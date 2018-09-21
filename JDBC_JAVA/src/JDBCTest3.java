import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JDBCTest3 {
	public static void main(String[] args) {
		try {
//			3. EMP 테이블에서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자.
						
			// 1.DBMS(Oracle) 드라이브 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			// 2.데이터베이스 연결
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("데이터베이스 연결 성공");
			// 3.데이터베이스 작업
			
						
//			String sql2 = "UPDATE EMP SET SAL=1000 WHERE ENAME='SCOTT'";
			String sql2 = "UPDATE EMP SET SAL=? WHERE ENAME='SCOTT'";
			
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, 1000);
//			pstmt.setString(2, "SCOTT");			
			
			int procNum = pstmt.executeUpdate();			
			System.out.println(procNum + "개 행이 적용되었습니다.");
			pstmt.close();						
						
			
			// 4.데이터베이스 연결 종료
			conn.close();
			
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
		
	}

	
}
