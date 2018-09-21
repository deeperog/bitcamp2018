package guest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import guest.model.Message;
import guest.service.ServiceException;
import jdbc.JdbcUtil;

public class MessageDao {
	private static MessageDao dao = new MessageDao();

	public static MessageDao getInstance() {
		return dao;
	}

	private MessageDao() {
	}

	public int insert(Connection conn, Message message) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("insert into guestbook_message "
					+ "(message_id, guest_name, password, message) " + "values (message_id_seq.NEXTVAL, ?, ?, ?)");
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from guestbook_message");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	private Message makeMessageFromResultSet(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		
		
		
		message.setMessage(rs.getString("message"));
		return message;
	}

	public List<Message> selectList(Connection conn, int firstRow, int endRow) {
		// TODO Auto-generated method stub
		return null;
	}
}