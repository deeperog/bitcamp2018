package jdbc;

import java.util.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Loader extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		try {
			String drivers = config.getInitParameter("jdbcdriver");
			StringTokenizer tokenizer = new StringTokenizer(drivers, ",");

			while (tokenizer.hasMoreTokens()) {
				String driver = tokenizer.nextToken();

				Class.forName(driver);
				System.out.println(driver + " : �����ͺ��̽� ����̹� �ε� ����!");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
