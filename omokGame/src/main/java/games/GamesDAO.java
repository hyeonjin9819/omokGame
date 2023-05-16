package games;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import users.UsersVO;

public class GamesDAO {
	
	private PreparedStatement pstmt, pstmt2;
	private Connection con;
	ResultSet rs, rs2;
	private DataSource dataFactory; 
	
	public GamesDAO() {

		
	      try {
	          Context ctx = new InitialContext();
	          Context envContext = (Context) ctx.lookup("java:/comp/env");
	          dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
	       } catch (Exception e) {
	          e.printStackTrace();
	       }

	}
	
	
	public void insertrst(GamesVO vo) {
	    try {
	        con = dataFactory.getConnection();
	        String query2 = "INSERT INTO games(user1,user2,winner,gamedate,gamemode,gamesid) VALUES (?,?,?,?,?,games_seq.NEXTVAL)";
	        pstmt = con.prepareStatement(query2);
	        pstmt.setString(1, vo.getP1Name());
	        pstmt.setString(2, vo.getP2Name());
	        pstmt.setString(3, vo.getWinner());
	        pstmt.setString(4, vo.getDate());
	        pstmt.setString(5, vo.getMode());
	        
	        int r = pstmt.executeUpdate();

	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (pstmt != null) pstmt.close();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        try {
	            if (con != null) con.close();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
	
	// 승리한 플레이어 정보를 업데이트 해주는 메소드
	public void winUpdate(int userPk) {

	    try {
			System.out.println("승리로직 실행" + userPk);
	        con = dataFactory.getConnection();
	        String query = "UPDATE USERS SET wincnt=wincnt+1,gamecnt = gamecnt+1, point = point+50 where usersid=?";
	        pstmt = con.prepareStatement(query);
	        System.out.println(query);
	        pstmt.setInt(1, userPk);
	        System.out.println("check");
	        int r = pstmt.executeUpdate();
	        
	        
	        System.out.println("변경된 row" + r);
	        
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	    	try {pstmt.close();} catch(Exception e) {};
	    }
	}
	
	// 패배한 플레이어 정보를 업데이트 해주는 메소드
	public void defeatUpdate(int userPk) {
		System.out.println("패배로직 실행" + userPk);
	    try {
	        con = dataFactory.getConnection();
	        String query = "UPDATE USERS SET gamecnt = gamecnt+1, point = point+10 where usersid=?";
	        pstmt = con.prepareStatement(query);
	        pstmt.setInt(1, userPk);
	        pstmt.executeUpdate();

	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	    	try {pstmt.close();} catch(Exception e) {};
	    }
	}
	


}
