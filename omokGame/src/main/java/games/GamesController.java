package games;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.UsersVO;




@WebServlet("/game/*")
public class GamesController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		gamehandler(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		gamehandler(request, response);
	}

	protected void gamehandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = request.getPathInfo().trim();
		
		System.out.println(path);
		
		
		if(path.equals("/gamepage.do")) {
			System.out.println("gamecall");
			request.getSession().setAttribute("mapNo", request.getParameter("mapNo"));
//			System.out.println("맵 번호 ========== "+request.getSession().getAttribute("mapNo"));
//			System.out.println("모드 번호 ========== "+request.getSession().getAttribute("modeNo"));
			/*
			 * HttpSession sess = request.getSession(); String user1 =
			 * (String)sess.getAttribute("user1"); String user2 =
			 * (String)sess.getAttribute("user2");
			 */
	
		
			response.sendRedirect("/omokGame/view/game/boardview/omok.jsp");
		
			
		}

		
		else if (path.equals("/map.do")) {
			
			String modeNo = request.getParameter("modeNo");
			request.getSession().setAttribute("modeNo", modeNo);
			response.sendRedirect("/omokGame/view/game/boardview/map.jsp");
			
			
		}
		
		else if (path.equals("/mode.do")) {
			response.sendRedirect("/omokGame/view/game/boardview/mode.jsp");
			
			
		}
		
		else if (path.equals("/gameend.do")) {
			GamesDAO dao = new GamesDAO();
			GamesVO vo = new GamesVO();
			String mode = ""; // 저장될 모드 초기화
			HttpSession sess = request.getSession();
			UsersVO p1 = (UsersVO)sess.getAttribute("user1");
			UsersVO p2 = (UsersVO)sess.getAttribute("user2");
			
			System.out.println("mode 확인" + sess.getAttribute("modeNo"));
			if ("1".equals(sess.getAttribute("modeNo"))) {
				mode = "NORMAL";
			} else if("2".equals(sess.getAttribute("modeNo"))) {
				mode = "BLITZ";
			} else if("3".equals(sess.getAttribute("modeNo"))) {
				mode = "EVENT";
			}
			
			sess.removeAttribute("mapNo");
			sess.removeAttribute("modeNo");
			
			String whowin = request.getParameter("whowinsend");
			String winner =""; // 이긴 사람 pk, 초기화
			String defeat =""; // 진 사람 pk, 초기화
			
			if (whowin.equals("blackwin")) {
				//winner = p1.getId(); // pk 저장되어있으면 그 userid 가져오기
				winner = String.valueOf(p1.getUsersPK());
				vo.setWinner(winner);
				defeat = String.valueOf(p2.getUsersPK());
			} else if (whowin.equals("whitewin")) {
				//winner = p2.getId();
				winner = String.valueOf(p2.getUsersPK());
				vo.setWinner(winner);
				defeat = String.valueOf(p1.getUsersPK());
				
			}
			Date from = new Date();
		
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String to = transFormat.format(from);
			
			
	
			vo.setDate(to);
			vo.setMode(mode);
			vo.setP1Name(String.valueOf(p1.getUsersPK())); // name -> pk
			vo.setP2Name(String.valueOf(p2.getUsersPK())); // name -> pk
			
			dao.insertrst(vo);
			dao.winUpdate(Integer.parseInt(winner)); // 승리한 user 정보 업데이트
			dao.defeatUpdate(Integer.parseInt(defeat)); // 패배한 user 정보 업데이트
			
		}

	}

}
