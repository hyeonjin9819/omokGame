package history;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import javax.sql.DataSource;

public class HistoryDAO {
	private PreparedStatement pstmt, pstmt2;
	private Connection con;
	ResultSet rs, rs2;
	private DataSource dataFactory; // 나중에 오라클으로 바꾸면 필요함 
	
	public HistoryDAO() {
		try { // 일단은 mysql로 연결
			String DB_URL = "jdbc:mysql://localhost:3306/omok";
				
			String USERNAME = "root"; // DB ID
			String PASSWORD = "1234"; // DB Password
			String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver"; // jdbc 드라이버 주소
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public String findName(int id) {
		String name = "";
		try {
			String query = "select nickname from users where _id = ?";
			pstmt2 = con.prepareStatement(query);
			pstmt2.setInt(1, id);
			rs2 = pstmt2.executeQuery();
			rs2.next();
			name = rs2.getString("nickname");
			System.out.println(name);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	
	// 전적 리스트 
	public List<HistoryVO> getHistoryList(int userId, String filter) {
		List<HistoryVO> list = new ArrayList<HistoryVO>();
		
		try {
			// 기본정렬 -> 최근 날짜순으로  
			//String query = "select * from games where (user1 = ? OR user2 =?) ORDER BY gameDate DESC";
			String query = "select * from games where (user1 = ? OR user2 =?)";
			if("win".equals(filter)) {
				query += " AND winner = ?";

			} else if("defeat".equals(filter)) {
				query += " AND winner != ?";
			} else if ("all".equals(filter)) {
				
			}
			query += " ORDER BY gameDate DESC";
			
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			pstmt.setInt(2, userId);
			
			// all이 아닐때만 값이 필요함
			if (!"all".equals(filter)) {
				pstmt.setInt(3, userId);
			}

			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				HistoryVO vo = new HistoryVO();
				vo.setGameIndex(rs.getInt("_id"));
				vo.setDate(rs.getDate("gameDate"));
				vo.setMode(rs.getString("mode"));
				int p1Id = rs.getInt("user1");
				int p2Id = rs.getInt("user2");
				int winnerId = rs.getInt("winner");
				
				vo.setP1Name(findName(p1Id));
				vo.setP2Name(findName(p2Id));
				vo.setWinner(findName(winnerId));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs.close();}catch(Exception e) {};
			try {pstmt.close();}catch(Exception e) {};
		}
		return list;
	}
	
	//전적테이블 유저 정보 
	public HistoryVO getUserInfo(int userId) {
		
		HistoryVO vo = new HistoryVO();
		try {
			String query = "select * from users where _id = ?";
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setInt(1, userId);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int gamecnt  = rs.getInt("gamecnt");
				int wincnt = rs.getInt("wincnt");
				vo.setPoint(rs.getInt("point"));
				vo.setP1Name(rs.getString("nickname"));
				vo.setGamecnt(rs.getInt("gamecnt"));
				vo.setWinrate(gamecnt / wincnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {pstmt.close();} catch (Exception e) {}
		}
		return vo;
	}
	
	
	
	
	

}
