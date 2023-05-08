package games;

import java.io.IOException;
import java.io.PrintWriter;

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
	
		
			response.sendRedirect("/omokgame2/view/game/boardview/omok.jsp");
		
			
		}
		else if (path.equals("/preboard.do")) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			HttpSession sess = request.getSession();
			sess.setAttribute("player1", "tempplayerid1");
			sess.setAttribute("player2", "tempplayerid2");	
			request.getRequestDispatcher("/view/game/preboard.jsp").forward(request, response);
			
			
		}
		
		else if (path.equals("/game.do")) {
			
			HttpSession sess = request.getSession();
			 	 	
			System.out.println(sess.getAttribute("player1"));
			System.out.println(sess.getAttribute("player2"));
			System.out.println(request.getParameter("whowinsend"));
			
			
		}
		
		
		
		 
	}

}
