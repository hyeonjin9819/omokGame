package history;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HistoryDAO {
	private PreparedStatement pstmt, pstmt2;
	private Connection con;
	ResultSet rs, rs2;
	private DataSource dataFactory; // �굹以묒뿉 �삤�씪�겢�쑝濡� 諛붽씀硫� �븘�슂�븿 
	
	public HistoryDAO() {

		
	      try {
	          Context ctx = new InitialContext();
	          Context envContext = (Context) ctx.lookup("java:/comp/env");
	          dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
	       } catch (Exception e) {
	          e.printStackTrace();
	       }

	}
	
	public String findName(int id) {
		String name = "";
		try {
			String query = "select nickname from users where usersid = ?";
			pstmt2 = con.prepareStatement(query);
			pstmt2.setInt(1, id);
			rs2 = pstmt2.executeQuery();
			rs2.next();
			name = rs2.getString("nickname");
			System.out.println(name);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs2.close();}catch(Exception e) {};
			try {pstmt2.close();}catch(Exception e) {};
		}
		return name;
	}
	
	// �쟾�쟻 由ъ뒪�듃 
	public List<HistoryVO> getHistoryList(int userId, String filter) {
		List<HistoryVO> list = new ArrayList<HistoryVO>();
		
		try {

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
			
			// all�씠 �븘�땺�븣留� 媛믪씠 �븘�슂�븿
			if (!"all".equals(filter)) {
				pstmt.setInt(3, userId);
			}

			rs = pstmt.executeQuery();

			while(rs.next()) {
				HistoryVO vo = new HistoryVO();
				vo.setGameIndex(rs.getInt("gamesid"));
				vo.setDate(rs.getDate("gameDate"));
				vo.setMode(rs.getString("gamemode"));
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
	
	//�쟾�쟻�뀒�씠釉� �쑀�� �젙蹂� 
	public HistoryVO getUserInfo(int userId) {
		
		HistoryVO vo = new HistoryVO();
		try {
			con = dataFactory.getConnection();
			String query = "select * from users where USERSID = ?";
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
