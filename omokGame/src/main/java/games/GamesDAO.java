package games;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
	


}
