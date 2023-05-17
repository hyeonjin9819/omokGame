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

import users.UsersVO;

public class HistoryDAO {
	private PreparedStatement pstmt, pstmt2, pstmtPage;
	private Connection con;
	ResultSet rs, rs2, rs3;
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
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs2.close();}catch(Exception e) {};
			try {pstmt2.close();}catch(Exception e) {};
		}
		return name;
	}
	
	// 유저의 전적이 가져오는 모든 컬럼의 숫자를 구함
	private int findPage(int id) {
		int maxPage = 0;
		try {
			String query = "select max(rnum) as maxnum from( SELECT a.*,ROW_NUMBER() OVER(ORDER BY gamedate DESC) AS rnum FROM games a WHERE user1=? OR user2=?)";
			pstmtPage = con.prepareStatement(query);
			
			String userIdStr = String.valueOf(id); // 변환
			
			
			//pstmtPage.setInt(1, id);
			//pstmtPage.setInt(2, id);
			
			
			pstmtPage.setString(1, userIdStr);
			pstmtPage.setString(2, userIdStr);
			
			
			rs3 = pstmtPage.executeQuery();
			rs3.next();
			maxPage = rs3.getInt("maxnum");
			System.out.println(maxPage);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {rs3.close();}catch(Exception e) {};
			try {pstmtPage.close();}catch(Exception e) {};
		}
		return maxPage;
		
	}
	
	// 사용자의 전적을 가져오는 리스트 -> 파라미터 pagenation: 아래 페이지네이션 버튼에서 가져옴
	public List<HistoryVO> getHistoryList(int userId, String filter, int pagenation) {
		List<HistoryVO> list = new ArrayList<HistoryVO>();
		int beginNum = 0;
		int finalNum = 0;
		try {
			// 페이지당 10개씩 보여줌
			String query = "select * from( SELECT a.*,ROW_NUMBER() OVER(ORDER BY gamedate DESC) AS rnum FROM games a WHERE user1=? OR user2=?) WHERE rnum >=? and rnum<=?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);

			int maxNum = findPage(userId); // 전체 컬럼 갯수
			if (pagenation * 10 > maxNum) { // 넘어오는 컬럼의 갯수가 10 단위가 아님 -> 마지막일 수 있음
				beginNum = (pagenation-1) * 10 +1;
				finalNum = maxNum;
			}else {
				beginNum = (pagenation-1) * 10 +1;
				finalNum = pagenation*10;
			}
			String userIdStr = String.valueOf(userId); // 변환
			
			//pstmt.setInt(1, userId);
			//pstmt.setInt(2, userId);
			
			pstmt.setString(1, userIdStr);
			pstmt.setString(2, userIdStr);
			
			pstmt.setInt(3, beginNum);
			pstmt.setInt(4, finalNum);
			
			
			// all�씠 �븘�땺�븣留� 媛믪씠 �븘�슂�븿
//			if (!"all".equals(filter)) {
//				pstmt.setInt(3, userId);
//			}

			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				HistoryVO vo = new HistoryVO();
				vo.setGameIndex(rs.getInt("gamesid"));
				vo.setDate(rs.getString("gameDate"));
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
	
	// 전적에서 왼쪽 유저 정보 불러오는 메소드
	public HistoryVO getUserInfo(int userId) {
		
		HistoryVO vo = new HistoryVO();
		try {
			con = dataFactory.getConnection();
			String query = "select * from users where USERSID = ?";
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			String userIdStr = String.valueOf(userId); // 변환
			
			//pstmt.setInt(1, userId);
			pstmt.setString(1, userIdStr);
			
			rs = pstmt.executeQuery();
			//int maxNum = findPage(userId); // 전체 컬럼 갯수
			query = "select max(rnum) as maxnum from( SELECT a.*,ROW_NUMBER() OVER(ORDER BY gamedate DESC) AS rnum FROM games a WHERE user1=? OR user2=?)";
			pstmtPage = con.prepareStatement(query);
			
			
			/*pstmtPage.setInt(1, userId);
			pstmtPage.setInt(2, userId);*/
			pstmtPage.setString(1, userIdStr);
			pstmtPage.setString(2, userIdStr);
			
			rs3 = pstmtPage.executeQuery();
			rs3.next();
			int maxNum = rs3.getInt("maxnum");
			
			
			
			vo.setTotalPage(maxNum);
			if (rs.next()) {
				int gamecnt  = rs.getInt("gamecnt");
				int wincnt = rs.getInt("wincnt");
				double winrate = ( ((double)wincnt / (double)gamecnt) * 100);
				
				// winrate 값 nan일 시(맨 처음) 0으로 수정
				if("NaN".equals(String.valueOf(winrate))) {
					winrate = 0;
				} else {
					winrate = Math.round(winrate*100)/100.0;
				}
				
				System.out.println("winrate 테스트: " + winrate);
				vo.setPoint(rs.getInt("point"));
				vo.setP1Name(rs.getString("nickname"));
				vo.setGamecnt(rs.getInt("gamecnt"));
				vo.setWinrate(winrate);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e) {}
			try {pstmt.close();} catch (Exception e) {}
			try {rs3.close();} catch (Exception e) {}
			try {pstmtPage.close();} catch (Exception e) {}
		}
		return vo;
	}
	
	
//	플레이어 목록 출력
	// 0509 db안닫기는거 수정
	public HistoryVO selectList(String searchName) {
		System.out.println("isthiscall???");
		HistoryVO vo = new HistoryVO ();
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM users WHERE nickname=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setUserName(rs.getString("nickname"));
				vo.setGamecnt(rs.getInt("gamecnt"));
				vo.setUserno(rs.getInt("usersid"));
				int total = rs.getInt("gamecnt");
				int winno = rs.getInt("wincnt");
				double winrate = (((double)winno / (double)total) * 100);
				
				if("NaN".equals(String.valueOf(winrate))) {
					winrate = 0;
				} else {
					winrate = Math.round(winrate*100)/100.0;
				}
				
				vo.setWinrate(winrate);
				vo.setPoint(rs.getInt("point"));
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch(Exception e) {};
			try {pstmt.close();} catch(Exception e) {};
			try {con.close();} catch(Exception e) {};
		}
		return vo;
	}
	
	// 랭킹 출력
	   public UsersVO selectRank(int usersno){
	      UsersVO vo = new UsersVO();
	      try {
	      con = dataFactory.getConnection();
	      String query = "SELECT * FROM (SELECT usersid, ROUND(nvl(wincnt/decode(gamecnt, 0, null, gamecnt)*100, 2)) winrate , RANK() OVER (ORDER BY wincnt DESC) ranking FROM USERS) a where usersid = ?";
	      pstmt = con.prepareStatement(query);
	      System.out.println(query);
	      System.out.println(usersno);
	      pstmt.setInt(1, usersno);
	      rs = pstmt.executeQuery();
	      rs.next();
	      vo.setId(rs.getString("usersid"));
	      vo.setWinrate(rs.getInt("winrate"));
	      vo.setRanking(rs.getInt("ranking"));
	      
	   }catch (Exception e) {
	      e.printStackTrace();
	   }finally {
	      try {rs.close();}catch(Exception e) {};
	      try {pstmt.close();}catch(Exception e) {};
	   }
	      return vo;
	   }


}
