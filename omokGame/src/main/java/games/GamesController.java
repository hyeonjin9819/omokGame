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
			HttpSession sess = request.getSession();
			String player1 = (String)sess.getAttribute("player1");
			String player2 = (String)sess.getAttribute("player2");
	
		
			response.sendRedirect("/omokGame/view/game/boardview/omok.jsp");
		
			
		}
		else if (path.equals("/preboard.do")) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			HttpSession sess = request.getSession();
			/*
			 * sess.setAttribute("player1", "tempplayerid1"); sess.setAttribute("player2",
			 * "tempplayerid2");
			 */
			request.getRequestDispatcher("/view/game/preboard.jsp").forward(request, response);
			
			
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
			String p1 = (String)sess.getAttribute("player1");
			String p2 = (String)sess.getAttribute("player2");
	
			
			String whowin = request.getParameter("whowinsend");
			String winner;
			if (whowin.equals("blackwin")) {
				winner = p1;
				vo.setWinner(winner);
				
			} else if (whowin.equals("whitewin")) {
				winner = p2;
				vo.setWinner(winner);
			}
			Date from = new Date();
		
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			String to = transFormat.format(from);
	
			vo.setDate(to);
			vo.setMode("default");
			vo.setP1Name(p1);
			vo.setP2Name(p2);
			dao.insertrst(vo);

		}

	}

}
