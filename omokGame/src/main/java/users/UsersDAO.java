package users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class UsersDAO {
	private PreparedStatement pstmt;
	private Connection con;
	ResultSet rs;
	
	public UsersDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe", "testuser", "test1234");
		} catch (Exception e) {
			
		}
	}
	
	// 로그인을 위한 회원체크
	public UsersVO searchOne(String playerNum, String id, String pwd) {
		UsersVO vo = null;
		try {
			String query = "select * from USERS where id=? and pwd=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UsersVO();
				vo.setPlayerNum(playerNum);
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return vo;
	}
	
	
	public void close() {
		if (rs != null) try {rs.close();}catch(Exception e) {}
		if (pstmt != null) try {pstmt.close();}catch(Exception e) {}
		if (con != null) try {con.close();}catch(Exception e) {}
	}
	
}
