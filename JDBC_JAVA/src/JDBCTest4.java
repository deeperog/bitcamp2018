import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTest4 {
	public static void main(String[] args) {
		try {
//			4.EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
						
			// 1.DBMS(Oracle) 드라이브 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1522:orcl";
			String user = "scott";
			String pw = "1111";
			
			// 2.데이터베이스 연결
			Connection conn = DriverManager.getConnection(url, user, pw);
			
			System.out.println("데이터베이스 연결 성공");
			// 3.데이터베이스 작업			
						
			String sql2 = "SELECT * FROM EMP WHERE ENAME='SCOTT'";
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql2);
			
			while(rs.next()) {
				System.out.print("직원번호 : " + rs.getInt(1)+ "\t");
				System.out.print("이름 : " + rs.getString(2)+ "\t");
				System.out.print("담당업무 : " + rs.getString(3)+ "\t");
				System.out.print("매니져 : " + rs.getString(4)+ "\t");
				System.out.print("입사일 : " + rs.getString(5)+ "\t");
				System.out.print("연봉 : " + rs.getString(6)+ "\t");
				System.out.print("커미션 : " + rs.getString(7)+ "\t");
				System.out.print("부서번호 : " + rs.getString(8)+ "\t");
				System.out.println("\n----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			}
					
			
			stmt.close();						
						
			
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
