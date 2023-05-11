package games;

import java.io.IOException;
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
			/*
			 * HttpSession sess = request.getSession(); String user1 =
			 * (String)sess.getAttribute("user1"); String user2 =
			 * (String)sess.getAttribute("user2");
			 */
	
		
			response.sendRedirect("/omokGame/view/game/boardview/omok.jsp");
		
			
		}

		
		else if (path.equals("/map.do")) {
			

			
			response.sendRedirect("/omokGame/view/game/boardview/map.jsp");
			
			
		}
		
		else if (path.equals("/mode.do")) {
			

			
			response.sendRedirect("/omokGame/view/game/boardview/mode.jsp");
			
			
		}
		
		else if (path.equals("/gameend.do")) {
			GamesDAO dao = new GamesDAO();
			GamesVO vo = new GamesVO();
			HttpSession sess = request.getSession();
			UsersVO p1 = (UsersVO)sess.getAttribute("user1");
			UsersVO p2 = (UsersVO)sess.getAttribute("user2");

	
			
			String whowin = request.getParameter("whowinsend");
			String winner;
			if (whowin.equals("blackwin")) {
				winner = p1.getId();
				vo.setWinner(winner);
				
			} else if (whowin.equals("whitewin")) {
				winner = p2.getId();
				vo.setWinner(winner);
			}
			Date from = new Date();
		
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String to = transFormat.format(from);
	
			vo.setDate(to);
			vo.setMode("default");
			vo.setP1Name(p1.getId());
			vo.setP2Name(p2.getId());
			dao.insertrst(vo);

		}

	}

}
