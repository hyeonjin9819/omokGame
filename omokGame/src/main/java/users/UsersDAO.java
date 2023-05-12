package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class UsersDAO {
	private PreparedStatement pstmt;
	private Connection con;
	ResultSet rs;
	private DataSource dataFactory;

	public UsersDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 濡쒓렇�씤�쓣 �쐞�븳 �쉶�썝泥댄겕
	public UsersVO searchOne(String playerNum, String id, String pwd) {
		UsersVO vo = null;
		try {
			con = dataFactory.getConnection();
			String query = "select * from USERS where id=? and pwd=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UsersVO();
				vo.setUsersPK(rs.getInt("usersid"));
				vo.setPlayerNum(playerNum);
				vo.setId(rs.getString("id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setWincnt(rs.getInt("wincnt"));
				vo.setGamecnt(rs.getInt("gamecnt"));
				vo.setPoint(rs.getInt("point"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return vo;
	}
	
	public boolean insert(String id, String pwd, String nName) {
	      boolean result = false;
	      try {
	         con = dataFactory.getConnection();
	         String query = "INSERT INTO USERS (usersid, id, pwd, nickname) VALUES (USERS_SEQ.NEXTVAL,?,?,?)";
	         pstmt = con.prepareStatement(query);
	         pstmt.setString(1, id);
	         pstmt.setString(2, pwd);
	         pstmt.setString(3, nName);
	         int r = pstmt.executeUpdate();
	         if (r > 0)
	            result = true;
	         pstmt.close();

	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;
	   }
	   
	   public boolean checkNickname(String nName) {
	      boolean result = false;
	      System.out.println(nName);
	      try {
	         con = dataFactory.getConnection();
	         pstmt = con.prepareStatement("SELECT COUNT(*) AS cnt FROM users WHERE nickname=?");
	         pstmt.setString(1, nName);
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         if(rs.getInt("cnt") > 0) result = true;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {rs.close();}catch(Exception e) {e.printStackTrace();}
	         try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
	         try {con.close();}catch(Exception e) {e.printStackTrace();}
	      }
	      return result;
	   }
	   
	   public boolean checkId(String id) {
	      boolean result = false;
	      try {
	         con = dataFactory.getConnection();
	         pstmt = con.prepareStatement("SELECT COUNT(*) AS cnt FROM users WHERE id=?");
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         if(rs.getInt("cnt") > 0) result = true;
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {rs.close();}catch(Exception e) {e.printStackTrace();}
	         try {pstmt.close();}catch(Exception e) {e.printStackTrace();}
	         try {con.close();}catch(Exception e) {e.printStackTrace();}
	      }
	      return result;
	   }
	
	
	
}

